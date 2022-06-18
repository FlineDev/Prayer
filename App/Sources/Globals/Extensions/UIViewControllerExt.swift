//
//  Created by Cihat Gündüz on 16.10.21.
//  Copyright © 2021 Flinesoft. All rights reserved.
//

import NotificationToast
import UIKit

extension UIViewController {
   func showToast(message: String) {
      let toastView = ToastView(
         title: message,
         titleFont: UIFont.systemFont(ofSize: UIFont.labelFontSize, weight: .regular),
         position: .bottom
      )
      toastView.displayTime = TimeInterval.seconds(3)
      toastView.hideOnTap = false
      toastView.show()
   }
}
