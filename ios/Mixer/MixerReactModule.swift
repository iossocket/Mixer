//
//  MixerReactModule.swift
//  Mixer
//
//  Created by XueliangZhu on 07/06/2017.
//  Copyright © 2017 Razeware LLC. All rights reserved.
//

import UIKit
import React

class MixerReactModule: NSObject {
    static let sharedInstance = MixerReactModule()
    
    var bridge: RCTBridge?
    
    func createBridgeIfNeeded() -> RCTBridge {
        if bridge == nil {
            bridge = RCTBridge.init(delegate: self, launchOptions: nil)
        }
        return bridge!
    }
    
    func viewForModule(_ moduleName: String, initialProperties: [String : Any]?) -> RCTRootView {
        let viewBridge = createBridgeIfNeeded()
        let rootView: RCTRootView = RCTRootView(
            bridge: viewBridge,
            moduleName: moduleName,
            initialProperties: initialProperties)
        return rootView
    }
}

extension MixerReactModule: RCTBridgeDelegate {
    func sourceURL(for bridge: RCTBridge!) -> URL! {
        let bundle: Bundle = Bundle.main
        let configuration: String = (bundle.infoDictionary!["configuration"] as! String)
        if configuration == "Release" {
            return bundle.url(forResource: "main", withExtension: "jsbundle")
        }
        return URL(string: "http://localhost:8081/index.ios.bundle?platform=ios")
    }
}
