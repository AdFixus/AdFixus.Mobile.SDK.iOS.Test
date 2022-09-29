//
//  ResponsiveAdController.swift
//  AdFixus.Mobile.SDK.iOS.Test
//
//  Created by ADFIXUS PTY LTD on 27/08/2022.
//  Copyright (c) ADFIXUS PTY LTD. All rights reserved.

import AdFixusMobileAds
import GoogleMobileAds
import UIKit

class AdFixusAdViewProvider: NSObject {
    private let manager = ResponsiveAdManager(loggingEnabled: true)
    private var rootViewController: UIViewController
    private var adContainerView: UIView?

    private var bannerView: UIView?
    private var adHasLoaded = false
    public var managerCorrelatorValue: String?

    var isFetchingAd = false

    init(_ viewController: UIViewController) {
        self.rootViewController = viewController
        super.init()
        manager.delegate = self
    }
    
    func loadAd(containerView: UIView, targeting: inout Dictionary<String, String>) {
        let rootViewController = rootViewController
        let containerView = containerView

        var adSizes = [NSValue]()
        let adUnitID = "/21842759191/carsales.ios/used/results"
        let size = CGSize(width: 360, height: 500)
        let richMediaSize = GADAdSizeFromCGSize(size)
        let mrec = GADAdSizeFromCGSize(CGSize(width: 300, height: 250))
        adSizes.append(NSValueFromGADAdSize(richMediaSize))
        adSizes.append(NSValueFromGADAdSize(mrec))
        
        if managerCorrelatorValue == nil {
            managerCorrelatorValue = UUID().uuidString
        }
        let currentCorrelatorValue = managerCorrelatorValue

        isFetchingAd = true
        // AUTO MANAGED EVENTS
        var bv = manager.loadResponsiveAd(rootViewController, adContainerUIView: containerView, initialSize: size, adSizes: adSizes, adUnitID: adUnitID, correlatorValue: currentCorrelatorValue, customTargeting: &targeting, publisherProvidedID: nil)
        
        if bv != nil {
            manager.resizeBannerView(containerView, bannerView: bv!)
        }
        
        
        let gamBv = bv as! GAMBannerView
    }
}

extension AdFixusAdViewProvider: GADBannerViewDelegate, BannerViewDelegate {
    func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
        print("\n")
        print("Handle bannerViewDidRecordImpression Event")
    }

    func bannerViewDidRecordClick(_ bannerView: GADBannerView) {
        print("\n")
        print("Handle bannerViewDidRecordClick Event")
    }

    func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("\n")
        print("Handle bannerViewWillPresentScreen Event")
    }

    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("\n")
        print("Handle bannerViewWillDismissScreen Event")
    }

    func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("\n")
        print("Handle bannerViewDidDismissScreen Event")
    }

    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
        adHasLoaded = true
        isFetchingAd = false
        self.bannerView = bannerView
        print("\n")
        print("Handle bannerViewDidReceiveAd Event")
    }

    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
        isFetchingAd = false
        print("\n")
        print("Handle bannerView Event")
    }
}
