package com.appsploration.imadsdk.sample.native_ad;

import android.app.Activity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.appsploration.imadsdk.native_ad.ad.NativeAd;
import com.appsploration.imadsdk.sample.R;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

/**
 * Created by jaspherelee on 03/03/2017.
 */
public class NativeAdsListAdapter extends BaseAdapter implements View.OnClickListener
{
    private Picasso picasso;
    private static final int AD_INDEX = 12;
    private ArrayList<ViewItem> items;
    private NativeAd adUnit;
    private Activity launchingActivity;

    public NativeAdsListAdapter(Picasso picasso, ArrayList<ViewItem> items, Activity launchingActivity)
    {
        this.picasso = picasso;
        this.items = items;
        this.launchingActivity = launchingActivity;
    }

    public void setAdUnit(NativeAd adUnit)
    {
        this.adUnit = adUnit;
        notifyDataSetChanged();
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
            view = inflater.inflate(R.layout.item_native_ad_ad, viewGroup, false);
            view.setOnClickListener(this);
            viewHolder = new AdViewHolder();
            viewHolder.container = view;
            viewHolder.title = (TextView) view.findViewById(R.id.txt_native_ads_title);
            viewHolder.description = (TextView) view.findViewById(R.id.txt_native_ads_description);
            viewHolder.icon = (ImageView) view.findViewById(R.id.image_native_ads);
            view.setTag(viewHolder);
        }
        else
        {
            viewHolder = (AdViewHolder) view.getTag();
        }

        configureNativeAd(viewHolder, adUnit);
        adUnit.displayed();

        return view;
    }

    @Override
    public void onClick(View view)
    {
        adUnit.click(launchingActivity);
    }

    private void configureNativeAd(AdViewHolder viewHolder, NativeAd adUnit)
    {
        viewHolder.title.setText(adUnit.getTitle());
        viewHolder.description.setText(adUnit.getDescription());
        viewHolder.icon.setImageBitmap(adUnit.getThumbnail());
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
        ImageView icon;
    }
}
