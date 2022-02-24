//
//  Hero.swift
//  EmojiGame
//
//  Created by Владимир Рябов on 21.02.2022.
//

import UIKit

class Hero: UIView, HeroProtocol, AnimationManagerProtocol, ViewMovementProtocol {
    
    //MARK: - Vars
    var name: String
    var avatarPersonage: String
    var health: Float
    var mana: Float
    var attackPower: BasicAttributes
    var agility: BasicAttributes
    var intelligence: BasicAttributes
    var guildType: GuildType
    var attackType: AttackType
    var ultimateAbility: UltimateType
    var basicPosition: Positions
    var opponent: Hero?
    required init(statistics: HeroStatisticsProtocol) {
        name = statistics.name
        avatarPersonage = statistics.avatarPersonage
        health = statistics.health
        mana = statistics.mana
        attackPower = statistics.attackPower
        agility = statistics.agility
        intelligence = statistics.intelligence
        guildType = statistics.guildType
        attackType = statistics.attackType
        ultimateAbility = statistics.ultimateAbility
        basicPosition = statistics.basicPosition
        super.init(frame: CGRect(x: 0, y: 0, width: 250, height: 160))
        style()
        layout()
        
    }
    
    //MARK: - Outlets
    var nameLable = UILabel()
    var avatar = UILabel()
    let healthIndicator = UIProgressView()
    let manaIndicator = UIProgressView()
    let healthLabel = UILabel()
    let manaLabel = UILabel()
    let attackPowerLabel = UILabel()
    let agilityLabel = UILabel()
    let intelligenceLabel = UILabel()
    let descriptionView = UIView()
    let ultimateButton = UIButton(type: .system)
    let flyButton = UIButton(type: .system)
    let wings = UIImage(named: "wings")
    var imageView : UIImageView!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getStatistics() -> HeroStatisticsProtocol? {
        return HeroStatisticsStruct(name: name, avatarPersonage: avatarPersonage, health: health, mana: mana, attackPower: attackPower, agility: agility, intelligence: intelligence, guildType: guildType, attackType: attackType, ultimateAbility: ultimateAbility, basicPosition: basicPosition)
    }
    
}

//MARK: - Layout setup
extension Hero {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        frame.origin = basicPosition.startPoint
        backgroundColor = .clear
        
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.backgroundColor = .white
        descriptionView.layer.opacity = 0.7
        descriptionView.layer.cornerRadius = 10
        
        ultimateButton.translatesAutoresizingMaskIntoConstraints = false
        ultimateButton.configuration = .filled()
        ultimateButton.isEnabled = true
        ultimateButton.setTitle("Ultimate", for: [])
        ultimateButton.addTarget(self, action: #selector(ultimateButtonTapped), for: .primaryActionTriggered)
        
        flyButton.translatesAutoresizingMaskIntoConstraints = false
        flyButton.configuration = .filled()
        flyButton.isEnabled = true
        flyButton.setTitle("fly", for: [])
        flyButton.addTarget(self, action: #selector(flyButtonTapped), for: .primaryActionTriggered)
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.font = .systemFont(ofSize: 100)
        avatar.text = avatarPersonage
        
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        nameLable.font = .boldSystemFont(ofSize: 20)
        nameLable.text = name
        nameLable.textColor = .white
        nameLable.layer.opacity = 0.1
        
        healthIndicator.translatesAutoresizingMaskIntoConstraints = false
        healthIndicator.progressTintColor = .green
        healthIndicator.progress = health
        
        manaIndicator.translatesAutoresizingMaskIntoConstraints = false
        manaIndicator.progressTintColor = .blue
        manaIndicator.progress = mana
        
        attackPowerLabel.translatesAutoresizingMaskIntoConstraints = false
        attackPowerLabel.text = "attack \(attackPower.value)"
        agilityLabel.translatesAutoresizingMaskIntoConstraints = false
        agilityLabel.text = "agility \(agility.value)"
        intelligenceLabel.translatesAutoresizingMaskIntoConstraints = false
        intelligenceLabel.text = "intelligence \(intelligence.value)"
        healthLabel.translatesAutoresizingMaskIntoConstraints = false
        healthLabel.text = "health \(health)"
        manaLabel.translatesAutoresizingMaskIntoConstraints = false
        manaLabel.text = "mana \(mana)"
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        imageView.contentMode =  UIView.ContentMode.scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = wings
        imageView.isHidden = true
        
    }
    
    private func layout() {
        addSubview(imageView)
        addSubview(descriptionView)
        addSubview(avatar)
        addSubview(healthIndicator)
        addSubview(manaIndicator)
        addSubview(ultimateButton)
        addSubview(flyButton)
        addSubview(nameLable)
        
        descriptionView.addSubview(attackPowerLabel)
        descriptionView.addSubview(agilityLabel)
        descriptionView.addSubview(intelligenceLabel)
        descriptionView.addSubview(healthLabel)
        descriptionView.addSubview(manaLabel)
        descriptionView.addSubview(ultimateButton)
        descriptionView.addSubview(flyButton)
        
        avatar.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        nameLable.frame = CGRect(x: 15, y: 60, width: 100, height: 100)
        healthIndicator.frame = CGRect(x: 0, y: -15, width: 100, height: 100)
        manaIndicator.frame = CGRect(x: 0, y: -10, width: 100, height: 100)
        
        descriptionView.frame = CGRect(x: 110, y: 0, width: 130, height: 140)
        imageView.frame = CGRect(x: -45, y: 0, width: 200, height: 100)
        
        healthLabel.frame = CGRect(x: 3, y: 3, width: 110, height: 15)
        manaLabel.frame = CGRect(x: 3, y: 18, width: 110, height: 15)
        attackPowerLabel.frame = CGRect(x: 3, y: 33, width: 110, height: 15)
        agilityLabel.frame = CGRect(x: 3, y: 48, width: 110, height: 15)
        intelligenceLabel.frame = CGRect(x: 3, y: 63, width: 130, height: 15)
        ultimateButton.frame = CGRect(x: 5, y: 80, width: 120, height: 25)
        flyButton.frame = CGRect(x: 5, y: 110, width: 120, height: 25)
        
    }
}

//MARK: - TapGesture
//adding gesture to view
extension Hero {
    func addTapGesture(view: UIView) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(recognizer: UIPanGestureRecognizer) {
        UIView.animate(withDuration: 0.3, animations: {
            self.descriptionView.isHidden.toggle()
        })
    }
}
//pan gesture management
extension Hero: HealthManagerProtocol {
    func addPanGesture(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        guard let recognizerView = recognizer.view else { return }
        switch recognizer.state {
        case .began, .changed:
            moveViewWithPan(view: recognizerView, sender: recognizer)
        case .ended:
            guard let enemy = opponent else { return }
            if recognizerView.frame.intersects(enemy.frame) {
                attack(sender: self, enemy: enemy)
                returnViewToOrigin(view: recognizerView, coordinateOfView: basicPosition.startPoint)
                imageView.isHidden = true
            } else {
                returnViewToOrigin(view: recognizerView, coordinateOfView: basicPosition.startPoint)
                imageView.isHidden = true
            }
        default:
            break
        }
    }
}

//MARK: - Buttons Tapped
extension Hero {
    @objc func ultimateButtonTapped(sender: UIButton) {
        guard let enemy = opponent else { return }
        ultimate(sender: self, enemy: enemy)
    }
    
    @objc func flyButtonTapped(sender: UIButton) {
        
        fly(sender: self)
    }
}




