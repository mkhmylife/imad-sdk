package com.appsploration.imadsdk.sample;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.view.View;

import com.appsploration.imadsdk.sample.engage_ad.EngageAdList;
import com.appsploration.imadsdk.sample.native_ad.NativeAdTest;
import com.appsploration.imadsdk.sample.native_video.NativeVideoAdTest;
import com.appsploration.imadsdk.sample.video.VideoAdTest;


public class MainActivity extends Activity
{

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
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

    public void onInterstitialVideo(View v)
    {
        Intent intent = new Intent(this, VideoAdTest.class);
        startActivity(intent);
    }

    public void onNativeVideo(View v)
    {
        Intent intent = new Intent(this, NativeVideoAdTest.class);
        startActivity(intent);

    }

    public void onNative(View v)
    {
        Intent intent = new Intent(this, NativeAdTest.class);
        startActivity(intent);
    }

    public void onEngage(View v)
    {
        Intent intent = new Intent(this, EngageAdList.class);
        startActivity(intent);
    }
}
