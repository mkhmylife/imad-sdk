//
//  VideoInterstitialViewController.swift
//  IMADSample
//
//  Created by Appsploration on 30/03/2017.
//  Copyright © 2017 Appsploration. All rights reserved.
//

import UIKit
import IMAd
class VideoInterstitialViewController: UIViewController
{
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bg2Image: UIImageView!
    var videoInterstitial : IMAdVideoInterstitial!
    var adUnit: VideoInterstitialAd!
    var flag: Bool = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.bounces = false
        videoInterstitial = IMAdVideoInterstitial().initIMAdVideoInterstitial(imadSDK: AppDelegate.getImadSDKCore())
        videoInterstitial.targetingProperties.setTargetingProperties(key: IMAdTargetingProperties.IMATargetPropKey_Age, value: "28")
        videoInterstitial.targetingProperties.setTargetingProperties(key: IMAdTargetingProperties.IMATargetPropKey_Gender, value: "M")
        videoInterstitial.targetingProperties.setTargetingProperties(key: "customKey", value: "customValue")
        videoInterstitial.load(zoneId: "video_interstitial", adLoadCallback: self, videoInterstitialAdLoadCallback: self)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        print("MEMORY WARNING IN VIDEO INTERSTITIAL")
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: bg2Image.frame.origin.y + bg2Image.frame.height)
        contentViewHeightConstraint.constant = bg2Image.frame.origin.y + bg2Image.frame.height
    }
    
    @IBAction func back(_ sender: Any)
    {
        if self.adUnit != nil
        {
            self.adUnit.destroy()
        }
        self.videoInterstitial = nil
        self.adUnit = nil
        //self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true);
    }
}
extension VideoInterstitialViewController: UIScrollViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if scrollView.contentOffset.y >= (scrollView.contentSize.height * 50 / 100)
        {
            if self.adUnit != nil
            {
                flag = true
                self.adUnit.show(viewController: self)
            }
        }
    }
}
extension VideoInterstitialViewController: VideoInterstitialAdLoadCallback
{
    func adClosed()
    {
        print("Video Interstitial ad closed")
    }
}
extension VideoInterstitialViewController: AdLoadCallback
{
    func adReady(adUnit: AdUnit)
    {
        print("IMAD SAMPLE -> adReady")
        self.adUnit = adUnit as? VideoInterstitialAd
        if flag
        {
            self.adUnit.show(viewController: self)
        }
    }
    func adFailed(zoneId: String, error: Error)
    {
        print("\(zoneId) - \(error)")
        
        showToast(controller: self, message: "Ad failed to load", seconds: 2);
    }
}
