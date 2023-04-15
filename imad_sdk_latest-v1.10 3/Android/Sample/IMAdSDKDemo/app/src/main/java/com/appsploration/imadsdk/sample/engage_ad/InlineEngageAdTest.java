package com.appsploration.imadsdk.sample.engage_ad;

import android.os.Bundle;

import com.appsploration.imadsdk.sample.R;

public class InlineEngageAdTest extends EngageAdTest{

    @Override
    protected int getContentViewLayoutId() {
        return R.layout.activity_display_ad_test_inline;
    }

    @Override
    protected int getAdContainerLayoutId() {
        return R.id.article_container;
    }
}
