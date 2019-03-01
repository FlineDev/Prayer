//
//  Created by Cihat Gündüz on 25.02.19.
//  Copyright © 2019 Flinesoft. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmHelper {
    static let shared = RealmHelper()

    func setup() {
        let migrationBlock: MigrationBlock = { migration, oldSchemaVersion in
            if oldSchemaVersion <= 0 {
                // add migrations from schema version 0 to 1 here if needed
            }
        }

        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 0, migrationBlock: migrationBlock)
    }

    func all<T: BaseObject>(ofType type: T.Type) -> Results<T> {
        do {
            let realm = try Realm()
            return realm.objects(type)
        } catch {
            fatalError("Could not create Realm object.")
        }
    }
}
