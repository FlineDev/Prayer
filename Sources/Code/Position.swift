//
//  Created by Cihat Gündüz on 26.01.17.
//  Copyright © 2017 Flinesoft. All rights reserved.
//

import UIKit

enum Position: Int {
    // NOTE: Values reflect the approximate head position in centimeters
    case standing = 180
    case bending = 120
    case sitting = 50
    case worship = 10
    case salamRight = 49
    case salamLeft = 51

    // MARK: - Type Properties
    private static let baseMovementDuration = Duration.milliseconds(1_400)

    // MARK: - Case Methods
    func arrow(forChangingTo newPosition: Position?) -> Arrow? { // swiftlint:disable:this cyclomatic_complexity
        guard let newPosition = newPosition else { return nil }

        switch self {
        case .standing:
            if newPosition == .bending { return .diagonalRightDown }
            if newPosition == .worship { return .downwards }

        case .bending:
            if newPosition == .standing { return .diagonalLeftUp }

        case .sitting:
            if newPosition == .worship { return .diagonalRightDown }
            if newPosition == .salamRight { return .rightwards }
            if newPosition == .standing { return .upwards }

        case .worship:
            if newPosition == .sitting { return .diagonalLeftUp }
            if newPosition == .standing { return .upwards }

        case .salamRight:
            if newPosition == .salamLeft { return .leftwards }

        default:
            break
        }

        return nil
    }

    func movementDuration(forChangingTo newPosition: Position) -> TimeInterval {
        guard abs(self.rawValue - newPosition.rawValue) <= 100 else { return 1.5 * Position.baseMovementDuration.timeInterval }
        return Position.baseMovementDuration.timeInterval
    }
}

// MARK: - Sub Types
extension Position {
    enum Arrow: String {
        case upwards = "↑"
        case downwards = "↓"
        case leftwards = "←"
        case rightwards = "→"
        case diagonalLeftUp = "↖"
        case diagonalRightDown = "↘"
    }
}
