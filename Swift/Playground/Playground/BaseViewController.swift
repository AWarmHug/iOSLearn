//
//  BaseViewController.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/5.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        view.backgroundColor = UIColor.white

        guard let navigationController = navigationController else {
            return
        }
        navigationController.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
//        navigationController.navigationBar.tintColor = UIColor.gankNavgationBarTitleColor()
        navigationController.navigationBar.barTintColor = UIColor.gankNavgationBarTintColor()
        navigationController.navigationBar.backgroundColor = nil
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.shadowImage = nil
        navigationController.navigationBar.barStyle = .default

        let gradient = CAGradientLayer()
        let sizeLength = UIScreen.main.bounds.size.height * 2
        let sizeHeight: CGFloat = UIDevice.current.iPhoneX ? 88.0 : 64.0
        let defaultNavigationBarFrame = CGRect(x: 0, y: 0, width: sizeLength, height: sizeHeight)
        gradient.frame = defaultNavigationBarFrame
        gradient.colors = [UIColor.gankNavgationBarGradientStartColor().cgColor, UIColor.gankNavgationBarGradientEndColor().cgColor]

        navigationController.navigationBar.setBackgroundImage(UIImage.image(fromLayer: gradient), for: .default)
        navigationController.navigationBar.backIndicatorImage = UIImage.back
        navigationController.navigationBar.backIndicatorTransitionMaskImage = UIImage.back
        edgesForExtendedLayout = []
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "返回", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = item

    }

    func push(_ vc: UIViewController, animated: Bool = true) {
        guard let nav = navigationController else {
            return
        }
        vc.hidesBottomBarWhenPushed = true
        nav.pushViewController(vc, animated: animated)
    }

}
