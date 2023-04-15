package com.appsploration.imadsdk.sample;

import android.app.Application;
import android.util.Log;

import com.appsploration.imadsdk.core.sdk.IMAdSdk;
import com.appsploration.imadsdk.core.sdk.IMAdSdkBuilder;

/**
 * Created by jaspherelee on 09/03/2017.
 */
public class TestIMAdApplication extends Application
{
    private IMAdSdk imAdSdk;

    @Override
    public void onCreate()
    {
        super.onCreate();
        imAdSdk = new IMAdSdkBuilder(this).build();
        imAdSdk.trackInstalledApps(this);

        // Use below code to change open every landing page in external browser
        //imAdSdk = new IMAdSdkBuilder(this, new SdkConfiguration.Builder().setClickTagMode(SdkConfiguration.CLICK_TAG_MODE_EXTERNAL_BROWSER).build()).build();

        Log.d("IMAdSDKSample", "Version: " + imAdSdk.getVersion());
    }

    public IMAdSdk getImAdSdk()
    {
        return imAdSdk;
    }
}
