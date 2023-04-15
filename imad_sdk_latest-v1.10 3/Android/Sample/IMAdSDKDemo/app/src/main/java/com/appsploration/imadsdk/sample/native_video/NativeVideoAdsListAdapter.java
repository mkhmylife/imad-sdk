package com.appsploration.imadsdk.sample.native_video;

import android.app.Activity;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.appsploration.imadsdk.native_video.ad.NativeVideoAd;
import com.appsploration.imadsdk.native_video.view.IMAdNativeVideoView;
import com.appsploration.imadsdk.sample.R;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

/**
 * Created by jaspherelee on 16/03/2017.
 */
public class NativeVideoAdsListAdapter extends BaseAdapter implements View.OnClickListener
{
    private Picasso picasso;
    private static final int AD_INDEX = 12;
    private ArrayList<ViewItem> items;
    private NativeVideoAd adUnit;
    private Activity launchingActivity;
    private AdViewHolder adViewHolder;
    private View adView;
    private Handler handler;

    public NativeVideoAdsListAdapter(Picasso picasso, ArrayList<ViewItem> items, Activity launchingActivity)
    {
        handler = new Handler(launchingActivity.getMainLooper());
        this.picasso = picasso;
        this.items = items;
        this.launchingActivity = launchingActivity;
    }

    public void setAdUnit(NativeVideoAd adUnit)
    {
        this.adUnit = adUnit;
        notifyDataSetChanged();
    }

    public void destroy()
    {
        adUnit = null;
        if (adViewHolder != null)
        {
            adViewHolder.icon.destroy();
            adViewHolder.icon = null;
            adViewHolder = null;
        }

        if (adView != null)
        {
            adView.setTag(null);
            adView = null;
        }

        items = null;

        launchingActivity = null;
    }

    @Override
    public int getViewTypeCount()
    {
        return 2;
    }

    @Override
    public int getItemViewType(int position)
    {
        if (items != null)
        {
            if (adUnit != null)
            {
                if (position == AD_INDEX)
                {
                    return 1;
                }
            }
        }

        return 0;
    }

    @Override
    public int getCount()
    {
        if (items != null)
        {
            if (adUnit != null)
            {
                return items.size() + 1;
            }
            else
            {
                return items.size();
            }
        }
        return 0;
    }

    @Override
    public Object getItem(int i)
    {
        if (items != null)
        {
            if (adUnit != null)
            {
                if (i < AD_INDEX)
                {
                    return items.get(i);
                }
                else if (i == AD_INDEX)
                {
                    return adUnit;
                }
                else
                {
                    return items.get(i - 1);
                }
            }
            else
            {
                return items.get(i);
            }
        }
        return null;
    }

    @Override
    public long getItemId(int i)
    {
        return 0;
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup)
    {
        if (getItemViewType(i) == 1)
        {
            // ad
            return getAdItemView(i, view, viewGroup);
        }

        return getNormalItemView(i, view, viewGroup);
    }

    @Override
    public void onClick(View view)
    {
        adUnit.click(launchingActivity);
    }

    private View getNormalItemView(int i, View view, ViewGroup viewGroup)
    {
        NormalViewHolder viewHolder = null;
        if (view == null)
        {
            LayoutInflater inflater = LayoutInflater.from(viewGroup.getContext());
            view = inflater.inflate(R.layout.item_native_ad_normal, viewGroup, false);
            viewHolder = new NormalViewHolder();
            viewHolder.container = view;
            viewHolder.image = (ImageView) view.findViewById(R.id.image_native_ads);
            view.setTag(viewHolder);
        }
        else
        {
            viewHolder = (NormalViewHolder) view.getTag();
        }

        ViewItem item = (ViewItem) getItem(i);

        picasso.load(item.getImageRes())
                .into(viewHolder.image);

        return view;
    }

    private View getAdItemView(int i, View view, ViewGroup viewGroup)
    {
        AdViewHolder viewHolder = null;
        if (view == null)
        {
            LayoutInflater inflater = LayoutInflater.from(viewGroup.getContext());
            view = inflater.inflate(R.layout.item_native_ad_video, viewGroup, false);
            viewHolder = new AdViewHolder();
            viewHolder.container = view;
            viewHolder.title = (TextView) view.findViewById(R.id.txt_native_ads_title);
            viewHolder.description = (TextView) view.findViewById(R.id.txt_native_ads_description);
            viewHolder.icon = (IMAdNativeVideoView) view.findViewById(R.id.video_native_ads);
            view.setTag(viewHolder);
            view.setOnClickListener(this);

            adViewHolder = viewHolder;
        }
        else
        {
            viewHolder = (AdViewHolder) view.getTag();
        }
//        handler.removeCallbacksAndMessages(null);
//        handler.postDelayed(new Runnable()
//        {
//            @Override
//            public void run()
//            {
//                configureNativeAd(adViewHolder, adUnit);
//            }
//        }, 500);
        configureNativeAd(viewHolder, adUnit);

        return view;
    }

    private void configureNativeAd(AdViewHolder viewHolder, NativeVideoAd adUnit)
    {
        viewHolder.title.setText(adUnit.getTitle());
        viewHolder.description.setText(adUnit.getDescription());
        adUnit.setVideoView(viewHolder.icon);
        adUnit.displayed();
    }

    private static class NormalViewHolder
    {
        View container;
        ImageView image;
    }

    private static class AdViewHolder
    {
        View container;
        TextView title, description;
        IMAdNativeVideoView icon;
    }
}
