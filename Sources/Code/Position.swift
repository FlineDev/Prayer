//
//  Position.swift
//  Prayer
//
//  Created by Cihat Gündüz on 26.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit

enum Position: Int {
    // NOTE: Values reflect the approximate head position in centimeters
    case standing   = 180
    case bending    = 120
    case sitting    = 50
    case worship    = 10
    case salamRight = 49
    case salamLeft  = 51

    // MARK: - Type Properties

    private static let baseMovementDuration = Duration.milliseconds(1_400)


    // MARK: - Case Methods

    func arrow(forChangingTo newPosition: Position?) -> Arrow? {
        guard let newPosition = newPosition else { return nil }

        switch self {
        case .standing:
            if newPosition == .bending { return .diagonalRightDown }
            if newPosition == .worship { return .down }
        case .bending:
            if newPosition == .standing { return .diagonalLeftUp }
        case .sitting:
            if newPosition == .worship { return .diagonalRightDown }
            if newPosition == .salamRight { return .right }
            if newPosition == .standing { return .up }
        case .worship:
            if newPosition == .sitting { return .diagonalLeftUp }
            if newPosition == .standing { return .up }
        case .salamRight:
            if newPosition == .salamLeft { return .left }
        default: break
        }

        return nil
    }

    func movementDuration(forChangingTo newPosition: Position) -> TimeInterval {
        if abs(self.rawValue - newPosition.rawValue) > 100 {
            return 1.5 * Position.baseMovementDuration.timeInterval
        }
        return Position.baseMovementDuration.timeInterval
    }
}


// MARK: - Sub Types

extension Position {
    enum Arrow: String {
        case up = "↑"
        case down = "↓"
        case left = "←"
        case right = "→"
        case diagonalLeftUp = "↖"
        case diagonalRightDown = "↘"
    }
}
