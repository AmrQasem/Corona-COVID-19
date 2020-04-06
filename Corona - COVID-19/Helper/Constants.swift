//
//  Constants.swift
//  zagel
//
//  Created by Youm7 on 9/3/17.
//  Copyright © 2017 Youm7. All rights reserved.
//

import UIKit

extension UIView {
    
    @discardableResult
    func corners(_ radius: CGFloat) -> UIView {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        return self
    }
}


//extension UIViewController {
//    func showSpinner(onView : UIView) {
//        let spinnerView = UIView.init(frame: onView.bounds)
//        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
//        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
//        ai.startAnimating()
//        ai.center = spinnerView.center
//
//        DispatchQueue.main.async {
//            spinnerView.addSubview(ai)
//            onView.addSubview(spinnerView)
//        }
//
//        vSpinner = spinnerView
//    }
//
//    func removeSpinner() {
//        DispatchQueue.main.async {
//            vSpinner?.removeFromSuperview()
//            vSpinner = nil
//        }
//    }
//}

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}


func CreateColor(red: Float, green: Float, blue: Float) -> UIColor {
    
    return UIColor(red: CGFloat(red/255.0), green: CGFloat(green/255.0), blue: CGFloat(blue/255.0), alpha: 1.0)
}
enum Colors {
    
    static let red = CreateColor(red: 255, green: 80, blue: 64)
    static let lightGray = CreateColor(red: 176, green: 183, blue: 195)
    static let lightGreen = CreateColor(red: 171, green: 210, blue: 63)
    static let darkGreen = CreateColor(red: 4, green: 162, blue: 145)
    static let darkBlue = CreateColor(red: 47, green: 66, blue: 107)
    static let navBarBlue = CreateColor(red: 3, green: 99, blue: 174)
    static let navBarGray = CreateColor(red: 242, green: 244, blue: 247)
    static let butFollow = CreateColor(red: 77, green: 108, blue: 175)
    static let selectall = CreateColor(red: 89, green: 119, blue: 182)
}


enum Saved { //keys of userDefaults
    
    static let memberID = "MemberID"
    static let authToken = "AuthToken"
    static let email = "email"
    static let password = "password"
    static let name = "name"
    static let skipped = "skipped"
    static let FBid = "fbid"
    //    static let deviceToken = "devicetoken"
}


enum StoryBoards {
    
    static let main = UIStoryboard(name: "Main", bundle: nil)
    static let login = UIStoryboard(name: "Login", bundle: nil)
    static let settings = UIStoryboard(name: "Settings", bundle: nil)
}
struct constant {
    
    static var refreshArticle = false
    static var refreshSearch = false
    static var refreshSourceandtopics = false
    static var isSwippingBack = false
    static var FollowButtonpressed = false
    static var isrefreshapi = "false"
    static var firstCardTS = ""
    static var iswhispering = false
}
enum VersionError: Error {
    case invalidResponse, invalidBundleInfo
}
let K_Main_URL = "http://apiversion10.thezagelapp.com/"
let K_API_URL = K_Main_URL + "api/"
let K_Media_URL = "http://img.thezagelapp.com/"
//let K_Device_ID = UIDevice.current.identifierForVendor!.uuidString
let K_Defaults = UserDefaults.standard
let K_Notifications = NotificationCenter.default
let K_AppDelegate = UIApplication.shared.delegate as! AppDelegate
let K_Parse_Error = "عذراً حدث خطا"
//global variables
var socialMethod = ""
var isUserLoggedIn = false
var customerLoggedIn = false
