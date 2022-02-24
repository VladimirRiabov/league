//
//  Shakeable.swift
//  ProtocolsRyabov
//
//  Created by Владимир Рябов on 16.02.2022.
//


import UIKit

//MARK: - Protocol for the first type cell
protocol Rotate {}
extension Rotate where Self: UIView {
    func rotationCell(view : UIView, delay: TimeInterval) {
        let animationDuration = 1.5
        UIView.animate(withDuration: animationDuration, delay: delay, options: [UIView.AnimationOptions.autoreverse, UIView.AnimationOptions.repeat], animations: {
            view.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
        }, completion: nil)
    }
    
    func randomColor(view : UIView, delay: TimeInterval) {
        let animationDuration = 1.5
        UIView.animate(withDuration: animationDuration, delay: delay, options: [UIView.AnimationOptions.autoreverse, UIView.AnimationOptions.repeat], animations: {
            view.backgroundColor = .random()
        }, completion: nil)
    }
    
}

//MARK: - Protocol for the second type cell
protocol ShakeAndFade {}
extension ShakeAndFade where Self: UIView {
    func shake() {
        let anim = CABasicAnimation(keyPath: "position")
        anim.duration = 0.07
        anim.repeatCount = .infinity
        anim.autoreverses = true
        anim.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 5.0, y: self.center.y))
        anim.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 5.0, y: self.center.y))
        layer.add(anim, forKey: "position")
    }
    
    func fadeViewInThenOut(view : UIView, delay: TimeInterval) {
        
        let animationDuration = 1.5
        UIView.animate(withDuration: animationDuration, delay: delay, options: [UIView.AnimationOptions.autoreverse, UIView.AnimationOptions.repeat], animations: {
            view.alpha = 0
        }, completion: nil)
    }
    
    func randomColor(view : UIView, delay: TimeInterval) {
        let animationDuration = 1.5
        UIView.animate(withDuration: animationDuration, delay: delay, options: [UIView.AnimationOptions.autoreverse, UIView.AnimationOptions.repeat], animations: {
            view.backgroundColor = .random()
        }, completion: nil)
    }
}

//MARK: - Случай #2, когде реализация методов протокола описана в самих классах и у нас есть метод который принимает объекты с этим протоколом
protocol Drawer {
    func drawIcon(view : UIView)
}

func makeAnIcon(cellWithProtocolDrawer: Drawer, view: UIView) {
    cellWithProtocolDrawer.drawIcon(view: view)
}

