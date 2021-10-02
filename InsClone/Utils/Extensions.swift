//
//  Extensions.swift
//  InsClone
//
//  Created by Sen Lin on 4/8/2021.
//

import UIKit

extension UIApplication {
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
