//
//  SwipeLeftViewController.swift
//  IMADSample
//
//  Created by Appsploration on 10/04/2017.
//  Copyright © 2017 Appsploration. All rights reserved.
//

import UIKit

import IMAd
class MobileSpinLiteViewController: UIViewController
{
    var engageAd: IMAdEngage!
    var adUnit: EngageAd!
    @IBOutlet var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var Bg2Img: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        engageAd = IMAdEngage().initIMAdEngage(imadSDK: AppDelegate.getImadSDKCore(), publisherId: "test_publisher")
        engageAd.targetingProperties.setTargetingProperties(key: IMAdTargetingProperties.IMATargetPropKey_Age, value: "28")
        engageAd.targetingProperties.setTargetingProperties(key: IMAdTargetingProperties.IMATargetPropKey_Gender, value: "M")
        engageAd.targetingProperties.setTargetingProperties(key: "customKey", value: "customValue")
        engageAd.load(zoneId: "spin_lite", adLoadCallback: self, adEventCallback: self, viewController: self)
    }
    override var prefersStatusBarHidden: Bool
    {
        return true
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
}
extension MobileSpinLiteViewController: AdLoadCallback
{
    func adReady(adUnit: AdUnit)
    {
        print("IMAD SAMPLE -> adReady")
        self.adUnit = adUnit as? EngageAd
//        let ff = self.adUnit.getAdView()!.frame;
        self.view.addSubview(self.adUnit.getAdView()!)
    }
    func adFailed(zoneId: String, error: Error)
    {
        print("IMAD SAMPLE -> adDidFailLoad *currently not available\(zoneId)")
        
        showToast(controller: self, message: "Ad failed to load", seconds: 2);
    }
}
extension MobileSpinLiteViewController: AdEventCallback
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
