//
//  AddRatingManager.swift
//  Mixer
//
//  Created by XueliangZhu on 20/06/2017.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

import Foundation
import React

@objc(AddRatingManager)
class AddRatingManager: NSObject {
    
    var bridge: RCTBridge!
    
    @objc func dismissPresentedViewController(_ reactTag: NSNumber) {
        DispatchQueue.main.async {
            if let view = self.bridge.uiManager.view(forReactTag: reactTag) {
                let presentedViewController: UIViewController! = view.reactViewController()
                presentedViewController.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc func save(_ reactTag: NSNumber, rating: Int, forIdentifier identifier: Int) {
        UserDefaults.standard.set(rating, forKey: "currentRating-\(identifier)")
        dismissPresentedViewController(reactTag)
    }
}
