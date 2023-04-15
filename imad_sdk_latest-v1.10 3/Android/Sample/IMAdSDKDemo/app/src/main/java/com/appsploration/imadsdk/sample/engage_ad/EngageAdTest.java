package com.appsploration.imadsdk.sample.engage_ad;

import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.RectF;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.webkit.WebView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import com.appsploration.imadsdk.core.ad.AdUnit;
import com.appsploration.imadsdk.core.ad.TargetProperties;
import com.appsploration.imadsdk.core.task.AdExecutor;
import com.appsploration.imadsdk.engage.EngageAdConfiguration;
import com.appsploration.imadsdk.engage.IMAdEngage;
import com.appsploration.imadsdk.engage.ad.EngageAd;
import com.appsploration.imadsdk.sample.R;
import com.appsploration.imadsdk.sample.TestIMAdApplication;

import java.util.ArrayList;

/**
 * Created by jaspherelee on 03/04/2017.
 */
public class EngageAdTest extends AppCompatActivity implements AdExecutor.AdLoadCallback, IMAdEngage.AdEventCallback
{
    public static final String KEY_AD_TYPE_STRING = "kAdType";
    public static final String KEY_AD_TYPE_IS_PREMIUM = "kIsPremium";
    public static final String KEY_AD_TYPE_PREMIUM_ID = "kPremiumZoneId";
    protected int getContentViewLayoutId() {
        return R.layout.activity_display_ad_test;
    }
    protected int getAdContainerLayoutId() { return R.id.engage_ad_test_root; }
    private EngageAd banner;
    private Handler handler;
    private AdContainerTouchListener listener;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(getContentViewLayoutId());

        // Create IMAd Object with Activity Context
        initAdLoading();
    }

    protected void initAdLoading() {
        handler = new Handler();

        View v = findViewById(getAdContainerLayoutId());
        v.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener()
        {
            @Override
            public void onGlobalLayout()
            {
                View v = findViewById(getAdContainerLayoutId());
                if (v.getMeasuredHeight() > 0)
                {
                    v.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                    String zoneId = getIntent().getStringExtra(KEY_AD_TYPE_STRING);
                    boolean isPremium = getIntent().getBooleanExtra(KEY_AD_TYPE_IS_PREMIUM, false);
                    String premiumZoneId = getIntent().getStringExtra(KEY_AD_TYPE_PREMIUM_ID);
                    TargetProperties properties = new TargetProperties();
                    properties.setProperty(TargetProperties.IMATargetPropKey_Gender, "M");
                    properties.setProperty(TargetProperties.IMATargetPropKey_Age, "21");
                    properties.setProperty(TargetProperties.IMATargetPropKey_Language, "EN");

                    IMAdEngage engage = IMAdEngage.with(((TestIMAdApplication) getApplication()).getImAdSdk(), "test-publisher");
                    if (isPremium) {
                        engage.setPremiumZone(premiumZoneId);
                    }
                    RectF r = new RectF();
                    r.top = 0;
                    r.right = 0;
                    r.left = v.getMeasuredWidth() - v.getPaddingLeft() - v.getPaddingRight();
                    r.bottom = v.getMeasuredHeight();
                    engage.load(EngageAdTest.this, zoneId, properties, EngageAdTest.this, EngageAdTest.this, new EngageAdConfiguration.Builder().setAvailableAre(r).build());
                }
            }
        });

        SwipeRefreshLayout refreshLayout = findViewById(R.id.engage_refresh);
        if (refreshLayout == null)
        {
            return;
        }
        refreshLayout.setOnChildScrollUpCallback(new SwipeRefreshLayout.OnChildScrollUpCallback() {
            @Override
            public boolean canChildScrollUp(SwipeRefreshLayout parent, View child) {
                if (banner != null) {
                    return listener.isAdTouchInAction();
                }
                return false;
            }
        });
    }

    @Override
    protected void onResume()
    {
        super.onResume();
    }

    @Override
    public void onConfigurationChanged(Configuration newConfig)
    {
        super.onConfigurationChanged(newConfig);
    }

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
    public void adReady(AdUnit adUnit)
    {
        banner = (EngageAd) adUnit;

        ViewGroup container = (ViewGroup) findViewById(R.id.entryType);
        listener = new AdContainerTouchListener();

        ViewGroup view = banner.getView();
        ArrayList<WebView> webViews = getViewsByType(view, WebView.class);

        if (webViews.size() > 0) {
            webViews.get(0).setOnTouchListener(listener);
        }

        container.addView(banner.getView());
        banner.show();
    }

    public static <T extends View> ArrayList<T> getViewsByType(ViewGroup root, Class<T> tClass) {
        final ArrayList<T> result = new ArrayList<>();
        int childCount = root.getChildCount();

        for (int i = 0; i < childCount; i++)
        {
            final View child = root.getChildAt(i);

            if (child instanceof ViewGroup)
                result.addAll(getViewsByType((ViewGroup) child, tClass));

            if (tClass.isInstance(child))
                result.add(tClass.cast(child));
        }

        return result;
    }

    @Override
    public void adFailed(String id, Exception reason)
    {
        Log.e("EngageAd", "adFailed", reason);
        Toast.makeText(this, "Failed to load ads", Toast.LENGTH_LONG).show();
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
        if (banner != null) {
            ViewGroup container = (ViewGroup) findViewById(R.id.entryType);
            container.removeView(banner.getView());
            banner.destroy();
            banner = null;
        }
    }

    @Override
    public void adWasClicked(EngageAd ads)
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

    private static class AdContainerTouchListener implements View.OnTouchListener {
        private boolean isAdTouchInAction = false;

        public boolean isAdTouchInAction() {
            return isAdTouchInAction;
        }

        @Override
        public boolean onTouch(View view, MotionEvent motionEvent) {

            if (motionEvent.getAction() == MotionEvent.ACTION_DOWN) {
                isAdTouchInAction = true;
            }
            else if (motionEvent.getAction() == MotionEvent.ACTION_UP || motionEvent.getAction() == MotionEvent.ACTION_CANCEL) {
                isAdTouchInAction = false;
            }

            return false;
        }
    }
}
