//
//  EngageAdsViewController.swift
//  IMADSample
//
//  Created by Appsploration on 23/05/2017.
//  Copyright © 2017 Appsploration. All rights reserved.
//

import UIKit

class EngageAdsViewController: UIViewController {

    @IBOutlet var back: UIButton!
    @IBOutlet weak var pull: UIButton!
    @IBOutlet weak var mediumRectangle: UIButton!
    @IBOutlet weak var mobileLeaderboard: UIButton!
    @IBOutlet weak var interstitial: UIButton!
    @IBOutlet weak var mobileSpinButton: UIButton!
    @IBOutlet weak var mobileSpinPlusButton: UIButton!
    @IBOutlet weak var revolverButton: UIButton!
    @IBOutlet weak var header: UIImageView!
    
    @IBOutlet weak var splashSpinButton: UIButton!
    @IBOutlet weak var splashCardButton: UIButton!
    @IBOutlet weak var mobileSpinLiteButton: UIButton!
    @IBOutlet weak var mobileCardButton: UIButton!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var mrecCubeButton: UIButton!
    
    @IBOutlet weak var recoAdButton: UIButton!
    @IBOutlet weak var contentViewHeight: NSLayoutConstraint!
    @IBOutlet weak var mrecSliderButton: UIButton!
    @IBOutlet weak var premiumInterstitial: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let borderU = CALayer()
        borderU.borderColor = UIColor.black.cgColor
        borderU.frame = CGRect(x: 0, y: pull.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: pull.frame.size.height)
        borderU.borderWidth = 1
        pull.layer.addSublayer(borderU)
        pull.layer.masksToBounds = true
        
        let borderH = CALayer()
        borderH.borderColor = UIColor.black.cgColor
        borderH.frame = CGRect(x: 0, y: header.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: header.frame.size.height)
        borderH.borderWidth = 1
        header.layer.addSublayer(borderH)
        header.layer.masksToBounds = true
        
        
        let borderE = CALayer()
        borderE.borderColor = UIColor.black.cgColor
        borderE.frame = CGRect(x: 0, y: mediumRectangle.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: mediumRectangle.frame.size.height)
        borderE.borderWidth = 1
        mediumRectangle.layer.addSublayer(borderE)
        mediumRectangle.layer.masksToBounds = true
        
        let borderM = CALayer()
        borderM.borderColor = UIColor.black.cgColor
        borderM.frame = CGRect(x: 0, y: mobileLeaderboard.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: mobileLeaderboard.frame.size.height)
        borderM.borderWidth = 1
        mobileLeaderboard.layer.addSublayer(borderM)
        mobileLeaderboard.layer.masksToBounds = true
        
        let borderI = CALayer()
        borderI.borderColor = UIColor.black.cgColor
        borderI.frame = CGRect(x: 0, y: interstitial.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: interstitial.frame.size.height)
        borderI.borderWidth = 1
        interstitial.layer.addSublayer(borderI)
        interstitial.layer.masksToBounds = true
        
        let borderMS = CALayer()
        borderMS.borderColor = UIColor.black.cgColor
        borderMS.frame = CGRect(x: 0, y: mobileSpinButton.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: back.frame.size.height)
        borderMS.borderWidth = 1
        mobileSpinButton.layer.addSublayer(borderMS)
        mobileSpinButton.layer.masksToBounds = true
        
        let borderMSP = CALayer()
        borderMSP.borderColor = UIColor.black.cgColor
        borderMSP.frame = CGRect(x: 0, y: mobileSpinPlusButton.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: back.frame.size.height)
        borderMSP.borderWidth = 1
        mobileSpinPlusButton.layer.addSublayer(borderMSP)
        mobileSpinPlusButton.layer.masksToBounds = true
        
        let borderRv = CALayer()
        borderRv.borderColor = UIColor.black.cgColor
        borderRv.frame = CGRect(x: 0, y: revolverButton.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: back.frame.size.height)
        borderRv.borderWidth = 1
        revolverButton.layer.addSublayer(borderRv)
        revolverButton.layer.masksToBounds = true
        
        let borderMSL = CALayer()
        borderMSL.borderColor = UIColor.black.cgColor
        borderMSL.frame = CGRect(x: 0, y: mobileSpinLiteButton.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: mobileSpinLiteButton.frame.size.height)
        borderMSL.borderWidth = 1
        mobileSpinLiteButton.layer.addSublayer(borderMSL)
        mobileSpinLiteButton.layer.masksToBounds = true
        
        let borderSpC = CALayer()
        borderSpC.borderColor = UIColor.black.cgColor
        borderSpC.frame = CGRect(x: 0, y: splashCardButton.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: splashCardButton.frame.size.height)
        borderSpC.borderWidth = 1
        splashCardButton.layer.addSublayer(borderSpC)
        splashCardButton.layer.masksToBounds = true
        
        let borderSpS = CALayer()
        borderSpS.borderColor = UIColor.black.cgColor
        borderSpS.frame = CGRect(x: 0, y: splashSpinButton.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: splashSpinButton.frame.size.height)
        borderSpS.borderWidth = 1
        splashSpinButton.layer.addSublayer(borderSpS)
        splashSpinButton.layer.masksToBounds = true
        
        let borderMCards = CALayer()
        borderMCards.borderColor = UIColor.black.cgColor
        borderMCards.frame = CGRect(x: 0, y: mobileCardButton.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: mobileCardButton.frame.size.height)
        borderMCards.borderWidth = 1
        mobileCardButton.layer.addSublayer(borderMCards)
        mobileCardButton.layer.masksToBounds = true
        
        let borderMRCube = CALayer()
        borderMRCube.borderColor = UIColor.black.cgColor
        borderMRCube.frame = CGRect(x: 0, y: mrecCubeButton.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: mrecCubeButton.frame.size.height)
        borderMRCube.borderWidth = 1
        mrecCubeButton.layer.addSublayer(borderMRCube)
        mrecCubeButton.layer.masksToBounds = true
        
        let borderMRSlider = CALayer()
        borderMRSlider.borderColor = UIColor.black.cgColor
        borderMRSlider.frame = CGRect(x: 0, y: mrecSliderButton.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: mrecSliderButton.frame.size.height)
        borderMRSlider.borderWidth = 1
        mrecSliderButton.layer.addSublayer(borderMRSlider)
        mrecSliderButton.layer.masksToBounds = true
        

        
        let borderRecoSlider = CALayer()
        borderRecoSlider.borderColor = UIColor.black.cgColor
        borderRecoSlider.frame = CGRect(x: 0, y: recoAdButton.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: recoAdButton.frame.size.height)
        borderRecoSlider.borderWidth = 1
        recoAdButton.layer.addSublayer(borderRecoSlider)
        recoAdButton.layer.masksToBounds = true//        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width, height: mobileCardButton.frame.origin.y + mobileCardButton.frame.height + 20);
        
        let borderPInterstitialSlider = CALayer()
        borderPInterstitialSlider.borderColor = UIColor.black.cgColor
        borderPInterstitialSlider.frame = CGRect(x: 0, y: premiumInterstitial.frame.size.height - 1, width:  UIScreen.main.bounds.width, height: premiumInterstitial.frame.size.height)
        borderPInterstitialSlider.borderWidth = 1
        premiumInterstitial.layer.addSublayer(borderPInterstitialSlider)
        premiumInterstitial.layer.masksToBounds = true
        
//        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width, height: mobileCardButton.frame.origin.y + mobileCardButton.frame.height + 20);
        contentViewHeight.constant = recoAdButton.frame.origin.y + recoAdButton.frame.height
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
//        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width, height: mobileCardButton.frame.origin.y + mobileCardButton.frame.height + 20);
        
    }

    @IBAction func back(_ sender: Any)
    {
        //self.dismiss(animated: true, completion: nil)
        
        self.navigationController?.popViewController(animated: true);
    }
    @IBAction func interstitial(_ sender: Any){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "InterstitialViewController") as! InterstitialViewController
        vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }

    @IBAction func mobileLeaderboard(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StandardBanner320x50ViewController") as! StandardBanner320x50ViewController
        vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    @IBAction func mediumRectangle(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Banner300x250ViewController") as! Banner300x250ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.setZoneId(zoneId: "medium_rectangle")
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    @IBAction func pull(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PullViewController") as! PullViewController
        vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }
    @IBAction func mobileSpin(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MobileSpinViewController") as! MobileSpinViewController
        vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    @IBAction func mobileSpinPlus(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MobileSpinPlusViewController") as! MobileSpinPlusViewController
        vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    @IBAction func revolver(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RevolverViewController") as! RevolverViewController
        vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    
    @IBAction func mobileSpinLite(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MobileSpinLiteViewController") as! MobileSpinLiteViewController
        vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    @IBAction func splashCard(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SplashCardViewController") as! SplashCardViewController
        vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    @IBAction func splashSpin(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SplashSpinLiteViewController") as! SplashSpinLiteViewController
        vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    @IBAction func mrecCube(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Banner300x250ViewController") as! Banner300x250ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.setZoneId(zoneId: "medium_rectangle_cube")
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    @IBAction func mrecSlider(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Banner300x250ViewController") as! Banner300x250ViewController
        vc.modalPresentationStyle = .fullScreen
        vc.setZoneId(zoneId: "medium_rectangle_slider")
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    @IBAction func mobileCards(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MobileCardViewController") as! MobileCardViewController
        vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    @IBAction func recoAd(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RecoAdViewController") as! RecoAdViewController
        vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    @IBAction func premiumIntersitial(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PremiumInterstitialViewController") as! PremiumInterstitialViewController
        vc.modalPresentationStyle = .fullScreen
        //self.present(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true);
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        return UIInterfaceOrientationMask.portrait
    }
    
}
