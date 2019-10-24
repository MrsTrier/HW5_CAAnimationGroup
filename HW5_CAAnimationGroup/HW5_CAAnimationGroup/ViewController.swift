//
//  ViewController.swift
//  HW5_CAAnimationGroup
//
//  Created by Roman Cheremin on 23/10/2019.
//  Copyright © 2019 Roman Cheremin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

//Кнопка для возврата на первый экран -- rootViewController
    let button : MyButton = {
        let button = MyButton(type: .custom)
        button.setTitle("Эфектное исчезновение!", for: .normal)
        button.backgroundColor = UIColor.white
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action:  #selector(tapButton), for:.touchDown)
        button.frame = CGRect(x: 25.0, y: 100.0, width: 300.0, height: 40.0)
        button.layer.cornerRadius = button.frame.height / 2
        return button
    }()
    
//Кнопка вызывающая анимацию кнопки3
    let button2 : MyButton = {
        let button2 = MyButton(type: .custom)
        button2.backgroundColor = UIColor.white
        button2.setTitleColor(UIColor.black, for: .normal)
        button2.addTarget(self, action:  #selector(tapButton2), for:.touchDown)
        button2.frame = CGRect(x: -50.0, y: -70.0, width: 300.0, height: 40.0)
        button2.layer.cornerRadius = button2.frame.height / 2
        return button2
    }()

//Кнопка вызывающая появление кнопки2 на экран ViewController'a
    let button3 : MyButton = {
        let button3 = MyButton(type: .custom)
        button3.setTitle("Круто, да?!", for: .normal)
        button3.backgroundColor = UIColor.white
        button3.setTitleColor(UIColor.black, for: .normal)
        button3.addTarget(self, action:  #selector(tapButton3), for:.touchDown)
        button3.frame = CGRect(x: 10.0, y: 270.0, width: 300.0, height: 40.0)
        button3.layer.cornerRadius = button3.frame.height / 2
        return button3
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor(red:0.94, green:0.78, blue:0.74, alpha:1.0)
        view.addSubview(button)
        view.addSubview(button2)
        view.addSubview(button3)
    }

//Анимация кнопки 3 с использованием CAAnimationGroup и CABasicAnimation
    @objc func tapButton2() {

            var animations = [CABasicAnimation]()
    
            var posAnimation = CABasicAnimation(keyPath: "position.x")
            posAnimation.duration = 2.0
            posAnimation.autoreverses = true
            posAnimation.toValue = view.bounds.size.width
        
            animations.append(posAnimation)
    
            var heightAnimation = CABasicAnimation(keyPath: "bounds.size")
            heightAnimation.autoreverses = true
            heightAnimation.duration = 3.0
            heightAnimation.toValue = CGSize(width:500.0, height: 80.0)
            heightAnimation.beginTime = 2.0
    
            animations.append(heightAnimation)
    
            var opacityAnimation = CABasicAnimation(keyPath: "opacity")
            opacityAnimation.autoreverses = true
            opacityAnimation.duration = 2.0
            opacityAnimation.toValue = 0.0
            opacityAnimation.beginTime = 5.0
        
            animations.append(opacityAnimation)
        
            let group = CAAnimationGroup()
    
            group.duration = 7.0
            group.animations = animations
            button3.layer.add(group, forKey: "my custom animation")
}
    
//Анимация для появления кнопки 2 с использованием UIView.animate
    @objc func tapButton3() {
        
        var frame = self.button2.frame
        frame.origin.y = 500
        frame.origin.x = 150
        frame.size.height = 200
        var color = self.button2.backgroundColor
        color = UIColor(red:0.84, green:0.27, blue:0.37, alpha:1.0)
        var leters = UIColor(red:0.91, green:0.84, blue:0.82, alpha:1.0)
        
        UIView.animate(withDuration: 1.5, delay: 0.0, options: .curveEaseOut, animations: {
            self.button2.frame = frame
            self.button2.backgroundColor = color
            self.button2.setTitleColor(leters, for: .normal)
            self.button2.setTitle("Нажми!", for: .normal)
        }) { (true) in
        }
    }
    
//Анимация для смены экнанов с ViewController'a на RootViewController
    @objc func tapButton() {
        let transition = CATransition()
        transition.duration = 1.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        
        navigationController?.view.layer.add(transition, forKey: "transition")
        navigationController?.popViewController(animated: false)
    }
}

