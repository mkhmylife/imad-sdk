package com.appsploration.imadsdk.sample.native_video;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.widget.ListView;

import com.appsploration.imadsdk.core.ad.AdUnit;
import com.appsploration.imadsdk.native_video.ad.NativeVideoAd;
import com.appsploration.imadsdk.native_video.IMAdNativeVideo;
import com.appsploration.imadsdk.core.task.AdExecutor;
import com.appsploration.imadsdk.sample.R;
import com.appsploration.imadsdk.sample.TestIMAdApplication;
import com.squareup.picasso.Picasso;

import java.util.ArrayList;

/**
 * Created by jaspherelee on 16/03/2017.
 */
public class NativeVideoAdTest extends Activity implements AdExecutor.AdLoadCallback
{
    private NativeVideoAdsListAdapter adsListAdapter;
    private ListView listView;
    private Picasso picasso;
    private Handler handler;
    private NativeVideoAd nativeAds;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_native_ad_test);
        listView = (ListView) findViewById(R.id.native_ads_list);
        picasso = Picasso.with(this);
        handler = new Handler();

        new Thread(new Runnable()
        {
            @Override
            public void run()
            {

                createItemList();
            }
        }).start();

        handler.postDelayed(new Runnable()
        {
            @Override
            public void run()
            {
                IMAdNativeVideo nativeAd = IMAdNativeVideo.with(((TestIMAdApplication) getApplication()).getImAdSdk());
                nativeAd.load("native_video", null, NativeVideoAdTest.this);
            }
        }, 5000);
    }

    @Override
    protected void onDestroy()
    {
        super.onDestroy();
        if (isFinishing())
        {
            adsListAdapter.destroy();
            if (nativeAds != null)
            {
                nativeAds.destroy();
                nativeAds = null;
            }
            adsListAdapter = null;
            listView = null;
            picasso = null;
            handler = null;
        }
    }

    private void createItemList()
    {

        final ArrayList<ViewItem> viewItems = new ArrayList<>();
        int res[] = new int[]
                {
                        R.drawable.cell02,
                        R.drawable.cell03,
                        R.drawable.cell04,
                        R.drawable.cell05
                };
        for (int i = 0; i < 20; i ++)
        {
            if (i == 0)
            {
                viewItems.add(new ViewItem(R.drawable.cell01));
            }
            else
            {
                viewItems.add(new ViewItem(res[(i - 1) % res.length]));
            }
        }

        handler.post(new Runnable()
        {
            @Override
            public void run()
            {

                createAdapter(viewItems);
            }
        });
    }

    @Override
    public void adReady(AdUnit adUnit)
    {
        nativeAds = (NativeVideoAd) adUnit;
        handler.post(new Runnable()
        {
            @Override
            public void run()
            {
                adsListAdapter.setAdUnit(nativeAds);
            }
        });
    }

    @Override
    public void adFailed(String id, Exception reason)
    {
        Log.e("NativeVideoAd", "adFailed", reason);

    }

    private void createAdapter(ArrayList<ViewItem> items)
    {

        adsListAdapter = new NativeVideoAdsListAdapter(picasso, items, this);
        listView.setAdapter(adsListAdapter);
    }
}
