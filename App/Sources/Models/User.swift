//
//  Created by Cihat Gündüz on 25.02.19.
//  Copyright © 2019 Flinesoft. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class User: BaseObject {
  dynamic var name: String = ""

  let prayedPrayers = List<Prayer>()
}
