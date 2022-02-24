//
//  MainViewController.swift
//  EmojiGame
//
//  Created by Владимир Рябов on 21.02.2022.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    var allianceSoldier: Hero?
    var orcsSoldier: Hero?
    var allHeroes: [Hero] = [] {
        didSet {
            for subview in allHeroes {
                subview.addPanGesture(view: subview)
                subview.addTapGesture(view: subview)
            }
        }
    }
    
    let mag = Hero(statistics: AllHeroesStatistics.allStatistics.wizzardAllianceStatistics)
    let paladin = Hero(statistics: AllHeroesStatistics.allStatistics.paladinAllianceStatistics)
    let unicorn = Hero(statistics: AllHeroesStatistics.allStatistics.unicornAllianceStatistics)
    
    let zombie = Hero(statistics: AllHeroesStatistics.allStatistics.zombieOrcStatistics)
    let vampire = Hero(statistics: AllHeroesStatistics.allStatistics.vampireOrcStatistics)
    let covid = Hero(statistics: AllHeroesStatistics.allStatistics.covidOrcStatistics)
    
    let comparisonLable = UILabel()
    var comparisonLableText: String = ""
    var comparisonInteligenceText: String = ""
    var comparisonAgilityText: String = ""
    var comparisonAttackPowerText: String = ""
    
    let restartButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        addingHeroesToMassive()
        pickingHeroes()
        style()
        layout()
        comparisonHeroesAbilities()
        
    }
}

extension MainViewController {
    func style() {
        comparisonLable.translatesAutoresizingMaskIntoConstraints = false
        comparisonLable.font = .boldSystemFont(ofSize: 16)
        comparisonLable.text = comparisonLableText
        comparisonLable.numberOfLines = 0
        comparisonLable.textColor = .white
        comparisonLable.layer.opacity = 0.5
        
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        restartButton.configuration = .filled()
        restartButton.isEnabled = true
        restartButton.setTitle("Restart", for: [])
        restartButton.addTarget(self, action: #selector(restartButtonTapped), for: .primaryActionTriggered)
    }
    
    private func layout() {
        guard let allianceSoldier = allianceSoldier else {return}
        guard let orcsSoldier = orcsSoldier else {return}
        view.addSubview(comparisonLable)
        view.addSubview(restartButton)
        view.addSubview(allianceSoldier)
        view.addSubview(orcsSoldier)
        
        comparisonLable.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
        restartButton.frame = CGRect(x: 10, y: 140, width: 100, height: 50)
    }
    
    private func assignbackground(){
        let background = UIImage(named: "background")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    @objc func restartButtonTapped(sender: UIButton) {

        heroToZero()
        pickingHeroes()
        
        guard let allianceSoldier = allianceSoldier else {return}
        guard let orcsSoldier = orcsSoldier else {return}
        view.addSubview(allianceSoldier)
        view.addSubview(orcsSoldier)
        
        comparisonHeroesAbilities()
      
    }
    
    private func pickingHeroes() {
        allianceSoldier = allHeroes.filter({$0.guildType == .alliance})[.random(in: 0...allHeroes.filter({$0.guildType == .alliance}).count - 1)]
        orcsSoldier = allHeroes.filter({$0.guildType == .orc})[.random(in: 0...allHeroes.filter({$0.guildType == .orc}).count - 1)]
        
        guard let allianceSoldier = allianceSoldier else {return}
        guard let orcsSoldier = orcsSoldier else {return}
        
        allianceSoldier.opponent = orcsSoldier
        orcsSoldier.opponent = allianceSoldier
    }
    
    private func addingHeroesToMassive() {
        allHeroes.append(mag)
        allHeroes.append(paladin)
        allHeroes.append(unicorn)
        allHeroes.append(zombie)
        allHeroes.append(vampire)
        allHeroes.append(covid)
    }
    
    private func comparisonHeroesAbilities() {
        guard let allianceSoldier = allianceSoldier else {return}
        guard let orcsSoldier = orcsSoldier else {return}
        
        allianceSoldier.attackPower > orcsSoldier.attackPower ? (comparisonAttackPowerText = allianceSoldier.name) : (comparisonAttackPowerText = orcsSoldier.name)
        allianceSoldier.agility > orcsSoldier.agility ? (comparisonAgilityText = allianceSoldier.name) : (comparisonAgilityText = orcsSoldier.name)
        allianceSoldier.intelligence > orcsSoldier.intelligence ? (comparisonInteligenceText = allianceSoldier.name) : (comparisonInteligenceText = orcsSoldier.name)
        
        comparisonLable.text = "Сила атаки выше у \(comparisonAttackPowerText)\nЛовкость выше у \(comparisonAgilityText)\nИнтеллект выше у \(comparisonInteligenceText)"
    }
    
    private func heroToZero() {
        guard let allianceSoldier = allianceSoldier else {return}
        guard let orcsSoldier = orcsSoldier else {return}

        allianceSoldier.removeFromSuperview()
        orcsSoldier.removeFromSuperview()
        allianceSoldier.health = 1.0
        allianceSoldier.health = 1.0
        allianceSoldier.healthIndicator.progress = 100
        allianceSoldier.manaIndicator.progress = 100
        allianceSoldier.isUserInteractionEnabled = true
        allianceSoldier.imageView.isHidden = true
        allianceSoldier.avatar.text = allianceSoldier.avatarPersonage
        allianceSoldier.ultimateButton.isUserInteractionEnabled = true
        allianceSoldier.layer.removeAllAnimations()
        
        orcsSoldier.health = 1.0
        orcsSoldier.mana = 1.0
        orcsSoldier.healthIndicator.progress = 100
        orcsSoldier.manaIndicator.progress = 100
        orcsSoldier.isUserInteractionEnabled = true
        orcsSoldier.imageView.isHidden = true
        orcsSoldier.avatar.text = orcsSoldier.avatarPersonage
        orcsSoldier.ultimateButton.isUserInteractionEnabled = true
        orcsSoldier.layer.removeAllAnimations()
        
        allianceSoldier.removeFromSuperview()
        orcsSoldier.removeFromSuperview()
       
        
        
    }
}
