package com.appsploration.imadsdk.sample.video;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.util.Log;
import android.view.ViewTreeObserver;
import android.widget.ScrollView;

import com.appsploration.imadsdk.core.ad.AdUnit;
import com.appsploration.imadsdk.core.task.AdExecutor;
import com.appsploration.imadsdk.sample.R;
import com.appsploration.imadsdk.sample.TestIMAdApplication;
import com.appsploration.imadsdk.video_interstitial.ad.VideoInterstitialAd;
import com.appsploration.imadsdk.video_interstitial.IMAdVideoInterstitial;

/**
 * Created by jaspherelee on 29/03/2017.
 */
public class VideoAdTest extends Activity implements ViewTreeObserver.OnScrollChangedListener, AdExecutor.AdLoadCallback
{
    private ScrollView scrollView;

    private boolean isAdStartedBefore = false;
    private VideoInterstitialAd adUnit = null;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_video_test);

        scrollView = (ScrollView) findViewById(R.id.article_scrollview);
        scrollView.getViewTreeObserver().addOnScrollChangedListener(this);

        IMAdVideoInterstitial video = IMAdVideoInterstitial.with(((TestIMAdApplication) getApplication()).getImAdSdk());
        video.load("video_interstitial", null, this);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data)
    {
        if (requestCode == IMAdVideoInterstitial.REQUEST_VIDEO_INTERSTITIAL_PLAYBACK)
        {
            Log.d("VideoAdTest", "playback completed");
        }
        super.onActivityResult(requestCode, resultCode, data);
    }

    @Override
    protected void onDestroy()
    {
        super.onDestroy();
        if (isFinishing() && adUnit != null)
        {
            adUnit.destroy();
            adUnit = null;
        }
    }

    @Override
    public void onConfigurationChanged(Configuration newConfig)
    {
        super.onConfigurationChanged(newConfig);
    }

    @Override
    protected void onResume()
    {
        super.onResume();
    }

    @Override
    public void onScrollChanged()
    {
        Log.d("IMAdVideoView", "isLoaded: " + adUnit);
        if (scrollView.getScrollY() > 800 && !isAdStartedBefore && adUnit != null)
        {
            isAdStartedBefore = true;

            // show ad
            adUnit.show(this);
        }
    }

    @Override
    public void adReady(AdUnit adUnit)
    {
        Log.d("IMAdVideoView", "adready: " + adUnit);
        this.adUnit = (VideoInterstitialAd) adUnit;
    }

    @Override
    public void adFailed(String id, Exception reason)
    {
        // failed
        Log.d("IMAdVideoView", "adFailed: " + adUnit, reason);
    }
}
