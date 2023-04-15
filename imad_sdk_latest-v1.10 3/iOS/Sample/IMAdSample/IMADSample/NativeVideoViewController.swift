//
//  NativeVideoViewController.swift
//  IMADSample
//
//  Created by Appsploration on 30/03/2017.
//  Copyright © 2017 Appsploration. All rights reserved.
//

import UIKit
import IMAd
class NativeVideoViewController: UIViewController
{
    @IBOutlet weak var scrollView: UIScrollView!
    var nativeVideo: IMAdNativeVideo!
    var adUnit: NativeVideoAd!
    var videoView: UIView!
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var lastImage: UIImageView!
    @IBOutlet weak var bg6Image: UIImageView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        scrollView.bounces = false
        nativeVideo = IMAdNativeVideo().initIMAdNativeVideo(imadSDK: AppDelegate.getImadSDKCore())
        nativeVideo.targetingProperties.setTargetingProperties(key: IMAdTargetingProperties.IMATargetPropKey_Age, value: "28")
        nativeVideo.targetingProperties.setTargetingProperties(key: IMAdTargetingProperties.IMATargetPropKey_Gender, value: "M")
        nativeVideo.targetingProperties.setTargetingProperties(key: "customKey", value: "customValue")
        nativeVideo.load(zoneId: "native_video", adLoadCallback: self)
        
        navigationController?.interactivePopGestureRecognizer?.addTarget(self, action: #selector(NativeVideoViewController.handleBackswipe))
    }
    
    @objc private func handleBackswipe() {
        navigationController?.interactivePopGestureRecognizer?.removeTarget(self, action: #selector(NativeVideoViewController.handleBackswipe))
        
        if self.adUnit != nil
        {
            self.adUnit.destroy()
        }
        self.nativeVideo = nil
        self.adUnit = nil
        if videoView != nil
        {
            videoView.removeFromSuperview()
        }
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: lastImage.frame.origin.y + lastImage.frame.height)
        contentViewHeightConstraint.constant = lastImage.frame.origin.y + lastImage.frame.height
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        return UIInterfaceOrientationMask.portrait
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        print("MEMORY WARNING FROM NATIVE VIDEO")
    }
    
    func showAds()
    {
        let adView = UIView(frame: CGRect(x: 0, y: self.bg6Image.frame.origin.y, width: UIScreen.main.bounds.width, height: self.bg6Image.frame.height - 2.5))
        adView.backgroundColor = .white
        adView.isUserInteractionEnabled  = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(sendurl))
        adView.addGestureRecognizer(tap)
        
        let videoWidth:CGFloat = 110.0;
        let videoHeight:CGFloat = videoWidth * 360 / 640;
        videoView = UIView(frame: CGRect(x: UIScreen.main.bounds.width - videoWidth - 25, y: 20, width: videoWidth, height: videoHeight))
        self.adUnit.setVideoView(videoView: videoView)
        videoView.isUserInteractionEnabled  = true
        let videoTap = UITapGestureRecognizer(target: self, action: #selector(sendurl))
        videoView.addGestureRecognizer(videoTap)
        adView.addSubview(videoView)
        
        let title = UILabel(frame: CGRect(x: 20, y: 20, width: adView.frame.width - videoView.frame.width - 25 - 20, height: 21))
        title.text = self.adUnit.getTitle()
        title.isUserInteractionEnabled = true
        let titleTap = UITapGestureRecognizer(target: self, action: #selector(sendurl))
        title.addGestureRecognizer(titleTap)
        adView.addSubview(title)
        
        let desc = UILabel(frame: CGRect(x: 20, y: 20 + 21 + 5 , width: adView.frame.width - videoView.frame.width - 25 - 20, height: 21))
        desc.text = self.adUnit.getDesc()
        desc.lineBreakMode = NSLineBreakMode.byWordWrapping
        desc.numberOfLines = 3;
        desc.sizeToFit()
        desc.isUserInteractionEnabled = true
        let descTap = UITapGestureRecognizer(target: self, action: #selector(sendurl))
        desc.addGestureRecognizer(descTap)
        adView.addSubview(desc)
        
        self.adUnit.displayed()
        
        self.scrollView.addSubview(adView)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: lastImage.frame.origin.y + lastImage.frame.height + 133)
        contentViewHeightConstraint.constant = lastImage.frame.origin.y + lastImage.frame.height + 133
        
        self.topConstraint.constant = 133
    }
    
    @objc func sendurl()
    {
         self.adUnit.clicked(viewController: self)
    }
    
    @IBAction func back(_ sender: Any)
    {
        if self.adUnit != nil
        {
            self.adUnit.destroy()
        }
        self.nativeVideo = nil
        self.adUnit = nil
        if videoView != nil
        {
            videoView.removeFromSuperview()
        }
        //self.dismiss(animated: true, completion: nil)
        
        self.navigationController?.popViewController(animated: true);
    }
    
}
extension NativeVideoViewController: AdLoadCallback
{
    func adReady(adUnit: AdUnit)
    {
        self.adUnit = adUnit as? NativeVideoAd
        print("IMAD SAMPLE -> adReady")
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
