//
//  Position.swift
//  Prayer
//
//  Created by Cihat Gündüz on 26.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit

enum Position {
    case standing
    case bending
    case sitting
    case worship
    case salamRight
    case salamLeft


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
