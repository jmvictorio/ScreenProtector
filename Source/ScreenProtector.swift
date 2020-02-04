//
//  ScreenProtector.swift
//  Example
//
//  Created by jvictorio on 17/12/2019.
//  Copyright © 2019 jvictorio. All rights reserved.
//

import UIKit

class ScreenProtector {
    
    static let shared = ScreenProtector()
    
    var enabled : Bool = true
    
    var view : UIView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    var window : UIWindow = UIApplication.shared.windows.last!

    func prepare(with view: UIView) {
        self.view = view
        prepare()
    }
    
    func prepare(){
        registerCapturedRecord()
        registerScreenshotDetect()
        loadStyle()
    }
    
    func setEnabled(enabled: Bool) {
        self.enabled = enabled
    }
    
    private func loadStyle(){
        view.backgroundColor = .lightGray
    }
    
    func showProtector(){
        view.alpha = 1
        window.rootViewController?.view.addSubview(view)
    }
    
    func hideProtector(){
        UIView.animate(withDuration: 0.2, animations: {
            self.view.alpha = 0
        }) { (finish) in
            self.view.removeFromSuperview()
        }
    }
    
    func registerCapturedRecord(){
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
    
    func registerScreenshotDetect(){
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
