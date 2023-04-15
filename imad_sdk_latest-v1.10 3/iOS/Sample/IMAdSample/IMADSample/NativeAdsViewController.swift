//
//  NativeAdsViewController.swift
//  IMADSample
//
//  Created by Appsploration on 30/03/2017.
//  Copyright © 2017 Appsploration. All rights reserved.
//

import UIKit
import IMAd
import Foundation
class NativeAdsViewController: UIViewController
{

    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var lastImage: UIImageView!
    
    @IBOutlet weak var bg6Image: UIImageView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    var nativeAd : IMAdNative!
    var adUnit: NativeAd!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        scrollView.bounces = false
        nativeAd = IMAdNative().initIMAdNative(imadSDK: AppDelegate.getImadSDKCore())
        nativeAd.targetingProperties.setTargetingProperties(key: IMAdTargetingProperties.IMATargetPropKey_Age, value: "28")
        nativeAd.targetingProperties.setTargetingProperties(key: IMAdTargetingProperties.IMATargetPropKey_Gender, value: "M")
        nativeAd.targetingProperties.setTargetingProperties(key: "customKey", value: "customValue")

        nativeAd.load(zoneId: "native", adLoadCallback: self)
        print(ASIdentifierManager.shared().advertisingIdentifier.uuidString)
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: lastImage.frame.origin.y + lastImage.frame.height)
        contentViewHeightConstraint.constant = lastImage.frame.origin.y + lastImage.frame.height
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        print("MEMORY WARNING IN NATIVE ADS")
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
    func engageTapHandle()
    {
        self.adUnit.clicked(viewController: self)
    }
    
    @IBAction func back(_ sender: Any)
    {
        if self.adUnit != nil
        {
            self.adUnit.destroy()
        }
        self.nativeAd = nil
        self.adUnit = nil
        //self.dismiss(animated: true, completion: nil)
        
        self.navigationController?.popViewController(animated: true);
    }
    
    func showAds()
    {
        self.adUnit.displayed()
        
        let adView = UIView(frame: CGRect(x: 0, y: self.bg6Image.frame.origin.y, width: UIScreen.main.bounds.width, height: bg6Image.frame.height - 2.5))
        adView.backgroundColor = .white
        adView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(openlink))
        adView.addGestureRecognizer(tap)
        
        let title = UILabel(frame: CGRect(x: 20 , y: 20, width: UIScreen.main.bounds.width - 105, height: 21))
        title.text = self.adUnit.getTitle()
        title.isUserInteractionEnabled = true
        let titleTap = UITapGestureRecognizer(target: self, action: #selector(openlink))
        title.addGestureRecognizer(titleTap)
        
        let desc = UILabel(frame: CGRect(x: 20 , y: 20 + 21 + 5 , width: adView.frame.width - 110, height: 21))
        desc.text = self.adUnit.getDesc()
        desc.lineBreakMode = NSLineBreakMode.byWordWrapping
        desc.numberOfLines = 3;
        desc.sizeToFit()
        desc.isUserInteractionEnabled = true
        let descTap = UITapGestureRecognizer(target: self, action: #selector(openlink))
        desc.addGestureRecognizer(descTap)
        
        
        let thumbail = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width - 110 , y: 20, width: 90, height: 90))
        thumbail.image = UIImage(data: self.adUnit.getThumbnail())
        thumbail.isUserInteractionEnabled = true
        let thumbailTap = UITapGestureRecognizer(target: self, action: #selector(openlink))
        thumbail.addGestureRecognizer(thumbailTap)
        
        adView.addSubview(title)
        adView.addSubview(desc)
        adView.addSubview(thumbail)
        self.scrollView.addSubview(adView)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: lastImage.frame.origin.y + lastImage.frame.height + 133)
        contentViewHeightConstraint.constant = lastImage.frame.origin.y + lastImage.frame.height + 133
        self.topConstraint.constant = 133

    }
    
    @objc func openlink()
    {
        self.adUnit.clicked(viewController: self)
    }
}
extension NativeAdsViewController: AdLoadCallback
{
    func adReady(adUnit: AdUnit)
    {
        print("IMAD SAMPLE -> adReady")
        self.adUnit = adUnit as? NativeAd
        DispatchQueue.main.async
        {
            self.showAds()
        }
    }
    func adFailed(zoneId: String, error: Error)
    {
        print("\(error)")
        
        showToast(controller: self, message: "Ad failed to load", seconds: 2);
    }
}
