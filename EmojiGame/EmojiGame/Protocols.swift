//
//  Protocols.swift
//  EmojiGame
//
//  Created by Владимир Рябов on 21.02.2022.
//

import UIKit

protocol HeroProtocol: AnyObject {
    var name: String { get set }
    var avatarPersonage: String { get set }
    var health: Float { get set }
    var mana: Float { get set }
    var attackPower: BasicAttributes { get set }
    var agility: BasicAttributes { get set }
    var intelligence: BasicAttributes { get set }
    var guildType: GuildType { get set }
    var attackType: AttackType { get set }
    var ultimateAbility: UltimateType { get set }
    var basicPosition: Positions { get set }
    
    init(statistics: HeroStatisticsProtocol)
    
    func ultimate(sender: Hero, enemy: Hero)
    func attack(sender: Hero, enemy: Hero)
    func fly(sender: Hero)
}

protocol AnimationManagerProtocol {}

extension AnimationManagerProtocol {
    func shake(view: Hero) {
        let anim = CABasicAnimation(keyPath: "position")
        anim.duration = 0.07
        anim.repeatCount = 4
        anim.autoreverses = true
        anim.fromValue = NSValue(cgPoint: CGPoint(x: view.center.x - 5.0, y: view.center.y))
        anim.toValue = NSValue(cgPoint: CGPoint(x: view.center.x + 5.0, y: view.center.y))
        view.layer.add(anim, forKey: "position")
    }
    
    func shakeUltimate(view: Hero) {
        let anim = CABasicAnimation(keyPath: "position")
        anim.duration = 0.1
        anim.repeatCount = 5
        anim.autoreverses = true
        anim.fromValue = NSValue(cgPoint: CGPoint(x: view.center.x, y: view.center.y ))
        anim.toValue = NSValue(cgPoint: CGPoint(x: view.center.x , y: view.center.y - 30.0))
        view.layer.add(anim, forKey: "position")
    }
    
    func flyShake(sender: Hero) {
        let anim = CABasicAnimation(keyPath: "position")
        anim.duration = 1.0
        anim.repeatCount = .infinity
        anim.autoreverses = true
        sender.imageView.isHidden = false
        anim.fromValue = NSValue(cgPoint: CGPoint(x: sender.center.x, y: sender.center.y ))
        anim.toValue = NSValue(cgPoint: CGPoint(x: sender.center.x + 60.0 , y: sender.center.y))
        sender.layer.add(anim, forKey: "position")
    }
    
}

protocol HealthManagerProtocol {}

extension HealthManagerProtocol {
    func attack(sender: Hero, enemy: Hero) {
        enemy.shake(view: enemy)
        enemy.healthIndicator.progress -= sender.attackPower.value / 100
        enemy.healthLabel.text = "health \(enemy.healthIndicator.progress)"
        enemy.avatar.text = enemy.healthIndicator.progress > 0 ? enemy.avatar.text : "☠️"
        enemy.imageView.isHidden = true
        if enemy.healthIndicator.progress <= 0 {
            enemy.flyShake(sender: enemy)
            enemy.isUserInteractionEnabled = false
        }
        if sender.healthIndicator.progress <= 0 {
            sender.isUserInteractionEnabled = false
        }
 
    }
    
    func ultimate(sender: Hero, enemy: Hero) {
        enemy.shake(view: enemy)
        sender.shakeUltimate(view: sender)
        sender.imageView.isHidden = true
        enemy.healthIndicator.progress -= sender.attackPower.value * 2 / 100
        enemy.healthLabel.text = "health \(enemy.healthIndicator.progress)"
        sender.manaIndicator.progress -= sender.attackPower.value * 4 / 100
        if sender.manaIndicator.progress <= 0 {
            sender.ultimateButton.isEnabled = false
        }

        sender.manaLabel.text = "health \(enemy.healthIndicator.progress)"
        enemy.avatar.text = enemy.healthIndicator.progress > 0 ? enemy.avatar.text : "☠️"
        enemy.imageView.isHidden = true
        if enemy.healthIndicator.progress <= 0 {
            enemy.flyShake(sender: enemy)
            enemy.isUserInteractionEnabled = false
        }
        if sender.healthIndicator.progress <= 0 {
            sender.isUserInteractionEnabled = false
        }
    }
    
    func fly(sender: Hero) {
        sender.flyShake(sender: sender)
    }
}

protocol ViewMovementProtocol {}

extension ViewMovementProtocol {
    func moveViewWithPan(view: UIView, sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    func returnViewToOrigin(view: UIView, coordinateOfView: CGPoint) {
        UIView.animate(withDuration: 0.3, animations: {
            view.frame.origin = coordinateOfView
        })
    }
}



