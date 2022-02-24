//
//  HeroStatisticsStruct.swift
//  EmojiGame
//
//  Created by Владимир Рябов on 21.02.2022.
//

import Foundation

struct HeroStatisticsStruct: HeroStatisticsProtocol, Equatable {
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
}

protocol HeroStatisticsProtocol {
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
}
