//
//  Created by Cihat Gündüz on 25.02.19.
//  Copyright © 2019 Flinesoft. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmEditable { /* extension only protocol */  }

extension RealmEditable where Self: BaseObject {
  /// Inserts a new object to database.
  func create() {
    mungo.do {
      let realm = try Realm()
      try realm.write {
        createdAt = Date()
        updatedAt = Date()
        realm.add(self)
      }
    }
  }

  /// Updates an existing object in database.
  func update(_ closure: (Self) -> Void) {
    mungo.do {
      let realm = try Realm()
      try realm.write {
        updatedAt = Date()
        closure(self)
      }
    }
  }

  /// Deletes an existing object from database.
  func destroy() {
    mungo.do {
      let realm = try Realm()
      try realm.write {
        realm.delete(self)
      }
    }
  }
}
