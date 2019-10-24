//
//  RootViewController.swift
//  HW5_CAAnimationGroup
//
//  Created by Roman Cheremin on 23/10/2019.
//  Copyright © 2019 Roman Cheremin. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    let viewController : ViewController = {
        let viewController = ViewController()
        return viewController
    }()
    
    let button : MyButton = {
        let button = MyButton(type: .custom)
        button.setTitle("Эфектное появление!", for: .normal)
        button.backgroundColor = UIColor(red:0.94, green:0.78, blue:0.74, alpha:1.0)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action:  #selector(tapButton), for:.touchDown)
        button.frame = CGRect(x: 25.0, y: 100.0, width: 300.0, height: 40.0)
        button.layer.cornerRadius = button.frame.height / 2

        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.white
        view.addSubview(button)
    }
    
    @objc func tapButton () {
        let transition = CATransition()
        transition.duration = 1.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        
        navigationController?.view.layer.add(transition, forKey: "transition")
        
        navigationController?.pushViewController(viewController, animated: false)
    }
}


