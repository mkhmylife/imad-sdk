//
//  ViewController.swift
//  IMADSample
//
//  Created by Appsploration on 30/03/2017.
//  Copyright © 2017 Appsploration. All rights reserved.
//

import UIKit
import AppTrackingTransparency
class ViewController: UIViewController
{
    @IBOutlet weak var header: UIImageView!
    @IBOutlet weak var interstitialVideoButton: UIButton!
    @IBOutlet weak var nativeAdsButton: UIButton!
    @IBOutlet weak var nativeVideoAdsButton: UIButton!
    @IBOutlet weak var EngageAdsButton: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.isToolbarHidden = true;
        self.navigationController?.navigationBar.isHidden = true;
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true;
        
        let borderU = CALayer()
        borderU.borderColor = UIColor.black.cgColor
        borderU.frame = CGRect(x: 0, y: interstitialVideoButton.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: interstitialVideoButton.frame.size.height)
        borderU.borderWidth = 1
        interstitialVideoButton.layer.addSublayer(borderU)
        interstitialVideoButton.layer.masksToBounds = true
        
        let borderH = CALayer()
        borderH.borderColor = UIColor.black.cgColor
        borderH.frame = CGRect(x: 0, y: header.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: header.frame.size.height)
        borderH.borderWidth = 1
        header.layer.addSublayer(borderH)
        header.layer.masksToBounds = true
        
        let borderN = CALayer()
        borderN.borderColor = UIColor.black.cgColor
        borderN.frame = CGRect(x: 0, y: nativeAdsButton.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: nativeAdsButton.frame.size.height)
        borderN.borderWidth = 1
        nativeAdsButton.layer.addSublayer(borderN)
        nativeAdsButton.layer.masksToBounds = true
        
        let borderN2 = CALayer()
        borderN2.borderColor = UIColor.black.cgColor
        borderN2.frame = CGRect(x: 0, y: nativeVideoAdsButton.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: nativeVideoAdsButton.frame.size.height)
        borderN2.borderWidth = 1
        nativeVideoAdsButton.layer.addSublayer(borderN2)
        nativeVideoAdsButton.layer.masksToBounds = true
        
        let borderE = CALayer()
        borderE.borderColor = UIColor.black.cgColor
        borderE.frame = CGRect(x: 0, y: EngageAdsButton.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: EngageAdsButton.frame.size.height)
        borderE.borderWidth = 1
        EngageAdsButton.layer.addSublayer(borderE)
        EngageAdsButton.layer.masksToBounds = true;
        
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                // Tracking authorization completed. Start loading ads here.
                // loadAd()
            })
        } else {
            // Fallback on earlier versions
        }
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return false
    }
    
    @IBAction func videoInterstitial(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VideoInterstitialViewController") as! VideoInterstitialViewController
        vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    @IBAction func nativeAds(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NativeAdsViewController") as! NativeAdsViewController
        vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    @IBAction func nativeVideo(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "NativeVideoViewController") as! NativeVideoViewController
        vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }

    @IBAction func EngageAds(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EngageAdsViewController") as! EngageAdsViewController
        vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }

}

