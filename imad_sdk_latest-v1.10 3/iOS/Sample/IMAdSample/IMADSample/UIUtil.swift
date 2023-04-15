//
//  UIUtil.swift
//  IMADSample
//
//  Created by Jasphere Lee on 16/11/2020.
//  Copyright © 2020 Appsploration. All rights reserved.
//

import Foundation
import UIKit

func showToast(controller: UIViewController, message : String, seconds: Double) {
    let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    alert.view.backgroundColor = UIColor.black
    alert.view.alpha = 0.6
    alert.view.layer.cornerRadius = 15

    controller.present(alert, animated: true)

    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
        alert.dismiss(animated: true)
    }
}
