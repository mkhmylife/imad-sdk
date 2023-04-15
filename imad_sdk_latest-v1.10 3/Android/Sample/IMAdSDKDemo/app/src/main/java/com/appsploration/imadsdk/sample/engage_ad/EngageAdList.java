package com.appsploration.imadsdk.sample.engage_ad;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import androidx.appcompat.app.AppCompatActivity;

import com.appsploration.imadsdk.sample.R;

/**
 * Created by jaspherelee on 12/04/2017.
 */
public class EngageAdList extends AppCompatActivity
{
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_display_ad_list);
    }

    public void showSmallStandardBanner(View v)
    {
        startInlineDisplayAd("mobile_leaderboard");
    }

    public void showMediumStandaradBanner(View v)
    {
        startInlineDisplayAd("medium_rectangle");
    }

    public void showPull(View v)
    {
        startDisplayAd("pull");
    }

    public void showMobileSpin(View v)
    {
        startDisplayAd("spin");
    }

    public void showMobileSpinPlus(View v)
    {
        startDisplayAd("spin_plus");
    }

    public void showMobileSpinLite(View v)
    {
        startDisplayAd("spin_lite");
    }

    public void showInterstitial(View v)
    {
        startInterstitalAd("interstitial");
    }
    public void showRevolver(View v)
    {
        startDisplayAd("revolver");
    }

    public void showSplashCard(View v)
    {
        startDisplayAd("splash_cards");
    }

    public void showSplashSpin(View v)
    {
        startDisplayAd("splash_spin_lite");
    }

    public void showMobileCard(View v)
    {
        startDisplayAd("mobile_cards");
    }

    public void showMediumStandaradCube(View v) {
        startInlineDisplayAd("medium_rectangle_cube");
    }

    public void showMediumStandaradSlider(View v) {
        startInlineDisplayAd("medium_rectangle_slider");
    }

    public void showPremiumZone(View v) {
        Intent intent = new Intent(this, EngageAdTest.class);
        intent.putExtra(EngageAdTest.KEY_AD_TYPE_STRING, "mobile_cards");
        intent.putExtra(EngageAdTest.KEY_AD_TYPE_IS_PREMIUM, true);
        intent.putExtra(EngageAdTest.KEY_AD_TYPE_PREMIUM_ID, "100320");

        startActivity(intent);
    }



    public void showRecoAds(View v) {
        startInlineDisplayAd("reco");
    }


    private void startDisplayAd(String zoneId)
    {
        Intent intent = new Intent(this, EngageAdTest.class);
        intent.putExtra(EngageAdTest.KEY_AD_TYPE_STRING, zoneId);

        startActivity(intent);
    }

    private void startInlineDisplayAd(String zoneId)
    {
        Intent intent = new Intent(this, InlineEngageAdTest.class);
        intent.putExtra(EngageAdTest.KEY_AD_TYPE_STRING, zoneId);

        startActivity(intent);
    }

    private void startInterstitalAd(String zoneId)
    {
        Intent intent = new Intent(this, InterstitialAdTest.class);
        intent.putExtra(EngageAdTest.KEY_AD_TYPE_STRING, zoneId);

        startActivity(intent);
    }
}
