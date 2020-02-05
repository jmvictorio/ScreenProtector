//
//  ScreenProtector.swift
//  Example
//
//  Created by jvictorio on 17/12/2019.
//  Copyright © 2019 jvictorio. All rights reserved.
//

import UIKit

open class ScreenProtector {
    
    public static let shared = ScreenProtector()
    
    var enabled : Bool = true
    
    var view : UIView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    var window : UIWindow = UIApplication.shared.windows.last!

    open func prepare(with view: UIView) {
        self.view = view
        prepare()
    }
    
    open func prepare(){
        registerCapturedRecord()
        registerScreenshotDetect()
        loadStyle()
    }
    
    open func setEnabled(enabled: Bool) {
        self.enabled = enabled
    }
    
    private func loadStyle(){
        view.backgroundColor = .lightGray
    }
    
    open func showProtector(){
        view.alpha = 1
        window.rootViewController?.view.addSubview(view)
    }
    
    open func hideProtector(){
        UIView.animate(withDuration: 0.2, animations: {
            self.view.alpha = 0
        }) { (finish) in
            self.view.removeFromSuperview()
        }
    }
    
    private func registerCapturedRecord(){
        NotificationCenter.default.addObserver(
            forName: UIScreen.capturedDidChangeNotification,
            object: nil,
            queue: .main) { notification in
                if self.isRecording() {
                    self.showProtector()
                }else{
                    self.hideProtector()
                }
        }
    }
    
    private func registerScreenshotDetect(){
        NotificationCenter.default.addObserver(
            forName: UIApplication.userDidTakeScreenshotNotification,
            object: nil,
            queue: .main) { notification in
                
        }
    }
    
    private func isRecording() -> Bool{
        for screen in UIScreen.screens {
            if screen.isCaptured {
                return true
            }
        }
        return false
    }
}
