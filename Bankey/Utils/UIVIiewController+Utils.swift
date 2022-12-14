//
//  UIVIiewController+Utils.swift
//  Bankey
//
//  Created by Артем Орлов on 16.10.2022.
//

import UIKit

extension UIViewController {
    func setStatusBar() {
//        let statusBarSize = U IApplication.shared.statusBarFrame.size
//        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusBarSize = view.window?.windowScene?.statusBarManager?.statusBarFrame.size
        let frame = CGRect(origin: .zero, size: statusBarSize ?? CGSize())
        let statusbarView = UIView(frame: frame)
        
        statusbarView.backgroundColor = appColor
        view.addSubview(statusbarView)
    }
    
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
