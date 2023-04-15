package com.appsploration.imadsdk.sample.engage_ad;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.ViewGroup;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.appsploration.imadsdk.core.ad.AdUnit;
import com.appsploration.imadsdk.core.ad.TargetProperties;
import com.appsploration.imadsdk.core.task.AdExecutor;
import com.appsploration.imadsdk.engage.IMAdEngage;
import com.appsploration.imadsdk.engage.ad.EngageAd;
import com.appsploration.imadsdk.sample.R;
import com.appsploration.imadsdk.sample.TestIMAdApplication;

import java.util.Timer;
import java.util.TimerTask;

public class InterstitialAdTest extends AppCompatActivity implements AdExecutor.AdLoadCallback, IMAdEngage.AdEventCallback
{
    public static final String KEY_AD_TYPE_STRING = "kAdType";
    private EngageAd banner;

    private Timer timer;

    @Override
    protected void onDestroy()
    {
        super.onDestroy();
        if (isFinishing())
        {
            if (banner != null)
            {
                banner.destroy();
                banner = null;
            }
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_interstitial_ad_test);

        // Create IMAd Object with Activity Context
        timer = new Timer();
        String zoneId = getIntent().getStringExtra(KEY_AD_TYPE_STRING);
        TargetProperties properties = new TargetProperties();
        properties.setProperty(TargetProperties.IMATargetPropKey_Gender, "M");
        properties.setProperty(TargetProperties.IMATargetPropKey_Age, "21");
        properties.setProperty(TargetProperties.IMATargetPropKey_Language, "EN");

        IMAdEngage engage = IMAdEngage.with(((TestIMAdApplication) getApplication()).getImAdSdk(), "test-publisher");
        AdExecutor.AdExecution result = engage.load(this, zoneId, properties, this, this, null);

        // set a timeout
        if (result != null)
        {
            timer.schedule(new TimerTask()
            {
                @Override
                public void run()
                {
                    loadAlternateAd();
                }
            }, 3000);
        }
    }

    private void loadAlternateAd()
    {
        // Your code to load alternate ad here
        // load AdMob, MoPub, Google Ads here
    }

    @Override
    public void adReady(AdUnit adUnit)
    {
        // cancel the timeout
        timer.cancel();

        // ad is loaded, no need to load alternate ad
        banner = (EngageAd) adUnit;

        ViewGroup container = (ViewGroup) findViewById(R.id.entryType);
        container.addView(banner.getView());
        banner.show();
    }

    @Override
    public void adFailed(String id, Exception reason)
    {
        // cancel the timeout
        Log.e("EngageAd", "adFailed", reason);
        Toast.makeText(this, "Failed to load ads", Toast.LENGTH_LONG).show();
        timer.cancel();

        // call to load alternate ad
        loadAlternateAd();
    }

    @Override
    public void adDidBeginPreview(EngageAd ads)
    {
        Log.d("EngageAd", "adDidBeginPreview");
    }

    @Override
    public void adDidEndPreview(EngageAd ads)
    {
        Log.d("EngageAd", "adDidEndPreview");
    }

    @Override
    public void adDidExpand(EngageAd ads)
    {
        Log.d("EngageAd", "adDidExpand");
    }

    @Override
    public void adDidCancelExpand(EngageAd ads)
    {
        Log.d("EngageAd", "adDidCancelExpand");
    }

    @Override
    public void adDidCloseExpanded(EngageAd ads)
    {
        Log.d("EngageAd", "adDidCloseExpanded");
    }

    @Override
    public void adActionWillBegin(EngageAd ads)
    {
        Log.d("EngageAd", "adActionWillBegin");
    }

    @Override
    public void adActionDidEnd(EngageAd ads)
    {
        Log.d("EngageAd", "adActionDidEnd");
    }

    @Override
    public void adActionWillLeaveApplication(EngageAd ads)
    {
        Log.d("EngageAd", "adActionWillLeaveApplication");
    }

    @Override
    public void adDidUnload(EngageAd ads)
    {
        Log.d("EngageAd", "adDidUnload");
        ((ViewGroup) ads.getView().getParent()).removeView(ads.getView());
    }

    @Override
    public void adWasClicked(EngageAd engageAd)
    {
        Log.d("EngageAd", "adWasClicked");
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (banner != null) {
            if (banner.reportActivityResult(requestCode, resultCode, data)) {
                // the SDK has consumed the result
                return;
            }
        }

        // proceed with the result handling
        super.onActivityResult(requestCode, resultCode, data);
    }
}
