//
//  Banner300x250ViewController.swift
//  IMADSample
//
//  Created by Appsploration on 04/04/2017.
//  Copyright © 2017 Appsploration. All rights reserved.
//

import UIKit
import  IMAd
class Banner300x250ViewController: UIViewController
{
    @IBOutlet var bg2Image: UIImageView!
    @IBOutlet var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var scrollView: UIScrollView!
    var engageAd: IMAdEngage!
    var adUnit: EngageAd!
    var zoneId:String!;
    @IBOutlet weak var spacesConstraintBetweenImages: NSLayoutConstraint!
    
    func setZoneId(zoneId: String) {
        self.zoneId = zoneId;
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        scrollView.bounces = false
        engageAd = IMAdEngage().initIMAdEngage(imadSDK: AppDelegate.getImadSDKCore(), publisherId: "test-publisher")
        engageAd.targetingProperties.setTargetingProperties(key: IMAdTargetingProperties.IMATargetPropKey_Age, value: "28")
        engageAd.targetingProperties.setTargetingProperties(key: IMAdTargetingProperties.IMATargetPropKey_Gender, value: "M")
        engageAd.targetingProperties.setTargetingProperties(key: "customKey", value: "customValue")
        engageAd.load(zoneId: zoneId, adLoadCallback: self, adEventCallback: self, viewController: self)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        print("MEMORY WARNING IN Banner300x250ViewController")
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        return UIInterfaceOrientationMask.portrait
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
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: bg2Image.frame.origin.y + bg2Image.frame.height)
        contentViewHeightConstraint.constant = bg2Image.frame.origin.y + bg2Image.frame.height
    }
}
extension Banner300x250ViewController: AdLoadCallback
{
    func adReady(adUnit: AdUnit)
    {
        print("IMAD SAMPLE -> adReady")
        self.adUnit = adUnit as? EngageAd
        let adView = self.adUnit.getAdView()!;
        let newAdViewFrame = CGRect(x: (UIScreen.main.bounds.width - adView.frame.width) / 2, y: bg2Image.frame.origin.y, width: adView.frame.width, height: adView.frame.height);
        
        adView.frame = newAdViewFrame;
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: bg2Image.frame.origin.y + bg2Image.frame.height + adView.frame.height);
        contentViewHeightConstraint.constant = bg2Image.frame.origin.y + bg2Image.frame.height + adView.frame.height;
        
        spacesConstraintBetweenImages.constant = adView.frame.height;
        print("height: \(adView.frame.height)")
        self.scrollView.addSubview(adView)
    }
    func adFailed(zoneId: String, error: Error)
    {
        print("IMAD SAMPLE -> adDidFailLoad \(zoneId)")
        
        showToast(controller: self, message: "Ad failed to load", seconds: 2);
    }
}
extension Banner300x250ViewController: AdEventCallback
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
    
    func adWasClicked(engageAd: EngageAd) {
        print("IMAD SAMPLE -> adWasClicked")
    }
}


