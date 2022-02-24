//
//  Enums.swift
//  EmojiGame
//
//  Created by Владимир Рябов on 21.02.2022.
//

import Foundation
import UIKit

enum BasicAttributes {
    case attackPower(value: Float)
    case agility(value: Float)
    case intelligence(value: Float)
    
    var value: Float {
        switch self {
        case .attackPower(let value):
            return value
        case .agility(let value):
            return value
        case .intelligence(let value):
            return value
        }
    }
}

extension BasicAttributes: Comparable {
    static func < (lhs: BasicAttributes, rhs: BasicAttributes) -> Bool {
        switch (lhs, rhs) {
        case (.attackPower(value: let lhsValue), .attackPower(value: let rhsValue)):
            return lhsValue < rhsValue
        case (.agility(value: let lhsValue), .agility(value: let rhsValue)):
            return lhsValue < rhsValue
        case (.intelligence(value: let lhsValue), .intelligence(value: let rhsValue)):
            return lhsValue < rhsValue
        default:
            return false
        }
    }
}

enum GuildType {
    case alliance
    case orc
    
    static func <(lhs: GuildType, rhs: GuildType) -> Bool {
        switch (lhs, rhs) {
        case(.alliance, .orc):
            return true
        default:
            return false
        }
    }
}

enum Positions {
    case allianceSP
    case orcSP
    var startPoint: CGPoint {
        get {
            switch self {
                case .allianceSP:
                    return CGPoint(x: 100, y: 300)
                case .orcSP:
                    return CGPoint(x: 100, y: 500)
            }
        }
    }
}

enum AttackType: String {
    case melee = "melee attack"
    case longRange  = "long range attack"
}

enum UltimateType: String {
    case mag
    case paladin
    case unicorn
    case zombie
    case vampire
    case covid
}
