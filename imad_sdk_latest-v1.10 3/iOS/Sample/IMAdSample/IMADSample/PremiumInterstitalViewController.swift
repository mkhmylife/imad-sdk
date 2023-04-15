//
//  PremiumInterstitialViewController.swift
//  IMADSample
//
//  Created by Appsploration on 30/03/2017.
//  Copyright © 2017 Appsploration. All rights reserved.
//

import UIKit
import IMAd
class PremiumInterstitialViewController: UIViewController
{

    @IBOutlet weak var bg2Image: UIImageView!
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bg1Image: UIImageView!
    var engageAd: IMAdEngage!
    var adUnit: EngageAd!
    var gesture: UITapGestureRecognizer!;
    
    var outputLog:UILabel!;
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        scrollView.bounces = false
//        engageAd = IMAdEngage().initIMAdEngage(imadSDK: AppDelegate.getImadSDKCore(), publisherId: "test_publisher")
        engageAd = IMAdEngage().initIMAdEngage(imadSDK: AppDelegate.getImadSDKCore(), publisherId: "267")
        engageAd.targetingProperties.setTargetingProperties(key: IMAdTargetingProperties.IMATargetPropKey_Age, value: "28")
        engageAd.targetingProperties.setTargetingProperties(key: IMAdTargetingProperties.IMATargetPropKey_Gender, value: "M")
        engageAd.targetingProperties.setTargetingProperties(key: "customKey", value: "customValue")
        engageAd.setPremiumZone(premiumZoneId: "100320");
        let config = EngageAdConfiguration(availableArea: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height));

        engageAd.load(zoneId: "mobile_cards", adLoadCallback: self, adEventCallback: self, viewController: self, config: config)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        print("MEMORY WARNING IN INTERSTITIAL-----")
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        return UIInterfaceOrientationMask.portrait
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: bg2Image.frame.origin.y + bg2Image.frame.height)
        contentViewHeightConstraint.constant = bg2Image.frame.origin.y + bg2Image.frame.height
        
        print("after add observer")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);
        NotificationCenter.default.removeObserver(self);
    }
    
    @IBAction func back(_ sender: Any)
    {
        self.engageAd.destroy()
        self.engageAd = nil
        if self.adUnit != nil
        {
            self.adUnit.destroy()
            self.adUnit = nil
        }
        self.navigationController?.popViewController(animated: true);
    }
}

extension PremiumInterstitialViewController: AdLoadCallback
{
    func adReady(adUnit: AdUnit)
    {
        self.adUnit = adUnit as? EngageAd
        print("IMAD SAMPLE -> adReady")
        self.view.addSubview(self.adUnit.getAdView()!)
        
    }
    func adFailed(zoneId: String, error: Error)
    {
        print("IMAD SAMPLE -> adDidFailLoad \(zoneId)")
        
        showToast(controller: self, message: "Ad failed to load", seconds: 2);
    }
}
extension PremiumInterstitialViewController: AdEventCallback
{
    func adDidBeginPreview(engageAd: EngageAd)
    {
        print("IMAD SAMPLE -> adDidBeginPreview")
    }
    func adDidEndPreview(engageAd: EngageAd)
    {
        print("IMAD SAMPLE -> adDidEndPreview")
    }
    func adDidCancelExpand(engageAd: EngageAd)
    {
        print("IMAD SAMPLE -> adDidCancelExpand")
    }
    func adDidCloseExpanded(engageAd: EngageAd)
    {
        print("IMAD SAMPLE -> adDidCloseExpanded")
    }
    func adDidExpand(engageAd: EngageAd)
    {
        print("IMAD SAMPLE -> adDidExpand")
    }
    func adActionDidEnd(engageAd: EngageAd)
    {
        print("IMAD SAMPLE -> adActionDidEnd")
    }
    func adActionWillBegin(engageAd: EngageAd)
    {
        print("IMAD SAMPLE -> adActionWillBegin")
    }
    func adActionWillLeaveApplication(engageAd: EngageAd?)
    {
        print("IMAD SAMPLE -> adActionWillLeaveApplication \(engageAd)")
    }
    func adWasClicked(engageAd: EngageAd) {
        print("IMAD SAMPLE -> adWasClicked")
    }
    
    func adDidUnload(engageAd: EngageAd) {
        print("IMAD SAMPLE -> adDidUnload")
        self.adUnit.getAdView()?.removeFromSuperview();
    }
}
