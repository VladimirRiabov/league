//
//  AllHeroesStatistics.swift
//  EmojiGame
//
//  Created by Владимир Рябов on 21.02.2022.
//

import UIKit

class AllHeroesStatistics {
    static let allStatistics = AllHeroesStatistics()
    
    let wizzardAllianceStatistics = HeroStatisticsStruct(name: "Wizzard", avatarPersonage: "🧙🏻‍♂️", health: 1.0, mana: 1.0, attackPower: .attackPower(value: 5.0), agility: .agility(value: 5.0), intelligence: .intelligence(value: 50.0), guildType: .alliance, attackType: .longRange, ultimateAbility: .mag, basicPosition: .allianceSP)
    
    let paladinAllianceStatistics = HeroStatisticsStruct(name: "Paladin", avatarPersonage: "🤺", health: 1.0, mana: 1.0, attackPower: .attackPower(value: 25.0), agility: .agility(value: 20.0), intelligence: .intelligence(value: 15.0), guildType: .alliance, attackType: .longRange, ultimateAbility: .paladin, basicPosition: .allianceSP)
    
    let unicornAllianceStatistics = HeroStatisticsStruct(name: "Unicorn", avatarPersonage: "🦄", health: 1.0, mana: 1.0, attackPower: .attackPower(value: 30.0), agility: .agility(value: 30.0), intelligence: .intelligence(value: 30.0), guildType: .alliance, attackType: .longRange, ultimateAbility: .unicorn, basicPosition: .allianceSP)
    
    let zombieOrcStatistics = HeroStatisticsStruct(name: "Zombie", avatarPersonage: "🧟‍♂️", health: 1.0, mana: 1.0, attackPower: .attackPower(value: 10.0), agility: .agility(value: 10.0), intelligence: .intelligence(value: 10.0), guildType: .orc, attackType: .longRange, ultimateAbility: .zombie, basicPosition: .orcSP)
    
    let vampireOrcStatistics = HeroStatisticsStruct(name: "Vampire", avatarPersonage: "🧛🏻‍♂️", health: 1.0, mana: 1.0, attackPower: .attackPower(value: 15.0) , agility: .agility(value: 25.0), intelligence: .intelligence(value: 40.0), guildType: .orc, attackType: .longRange, ultimateAbility: .vampire, basicPosition: .orcSP)
    
    let covidOrcStatistics = HeroStatisticsStruct(name: "Covid", avatarPersonage: "🦠", health: 1.0, mana: 1.0, attackPower: .attackPower(value: 35.0) , agility: .agility(value: 35.0), intelligence: .intelligence(value: 5.0), guildType: .orc, attackType: .longRange, ultimateAbility: .covid, basicPosition: .orcSP)

}
