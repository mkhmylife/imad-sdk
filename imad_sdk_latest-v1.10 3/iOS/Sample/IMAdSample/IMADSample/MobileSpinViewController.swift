//
//  SwipeLeftViewController.swift
//  IMADSample
//
//  Created by Appsploration on 10/04/2017.
//  Copyright © 2017 Appsploration. All rights reserved.
//

import UIKit

import IMAd
class MobileSpinViewController: UIViewController
{
    var engageAd: IMAdEngage!
    var adUnit: EngageAd!
    var timer:Timer?;
    @IBOutlet var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var Bg2Img: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        engageAd = IMAdEngage().initIMAdEngage(imadSDK: AppDelegate.getImadSDKCore(), publisherId: "test-publisher")
        engageAd.targetingProperties.setTargetingProperties(key: IMAdTargetingProperties.IMATargetPropKey_Age, value: "28")
        engageAd.targetingProperties.setTargetingProperties(key: IMAdTargetingProperties.IMATargetPropKey_Gender, value: "M")
        engageAd.targetingProperties.setTargetingProperties(key: "customKey", value: "customValue")
        
        // load the banner
        engageAd.load(zoneId: "spin", adLoadCallback: self, adEventCallback: self, viewController: self)
        
        // set a timeout
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { timer in
            self.loadAlternateAd()
        });
    }
    
    func loadAlternateAd()
    {
        // Your code to load alternate ad here
        // load AdMob, MoPub, Google Ads here
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return false
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        print("MEMORY WARNING IN Banner300x250TapViewController")
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: Bg2Img.frame.origin.y + Bg2Img.frame.height)
        contentViewHeightConstraint.constant = Bg2Img.frame.origin.y + Bg2Img.frame.height
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
extension MobileSpinViewController: AdLoadCallback
{
    func adReady(adUnit: AdUnit)
    {
        // cancel the timeout
        if (timer != nil)
        {
            timer!.invalidate()
        }
        
        // ad is loaded, no need to load alternate ad
        print("IMAD SAMPLE -> adReady")
        self.adUnit = adUnit as? EngageAd
        self.view.addSubview(self.adUnit.getAdView()!)
        
    }
    func adFailed(zoneId: String, error: Error)
    {
        // cancel the timeout
        if (timer != nil)
        {
            timer!.invalidate()
        }
        
        print("IMAD SAMPLE -> adDidFailLoad *currently not available\(zoneId)")
        
        // call to load alternate ad
        loadAlternateAd()
    }
}
extension MobileSpinViewController: AdEventCallback
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
        print("IMAD SAMPLE -> adActionWillLeaveApplication")
    }
    
    func adDidUnload(engageAd:EngageAd) {
        engageAd.getAdView()?.removeFromSuperview();
    }
    
    func adWasClicked(engageAd: EngageAd) {
        print("IMAD SAMPLE -> adWasClicked")
    }
}
