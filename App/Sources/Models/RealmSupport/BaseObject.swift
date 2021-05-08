//
//  Created by Cihat Gündüz on 25.02.19.
//  Copyright © 2019 Flinesoft. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class BaseObject: Object, RealmEditable {
  dynamic var id: String = UUID().uuidString
  dynamic var createdAt = Date()
  dynamic var updatedAt = Date()

  var isManagedObject: Bool {
    return realm != nil
  }

  override static func primaryKey() -> String {
    return "id"
  }
}
