//
//  CustomNavigationController.swift
//  IMADSample
//
//  Created by Jasphere Lee on 04/05/2021.
//  Copyright © 2021 Appsploration. All rights reserved.
//

import Foundation
import UIKit

class CustomNavigationController : UINavigationController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return self.topViewController?.supportedInterfaceOrientations ?? .all
        }
    }

    override var shouldAutorotate: Bool {
        return self.topViewController?.shouldAutorotate ?? false
    }
}
