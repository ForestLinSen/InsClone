//
//  HelpFunctions.swift
//  InsClone
//
//  Created by Sen Lin on 29/11/2021.
//

import SwiftUI
import Firebase

func convertTimeStamp(_ time: Timestamp) -> String{

    let formater = DateComponentsFormatter()
    formater.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
    formater.maximumUnitCount = 1
    formater.unitsStyle = .abbreviated
    return formater.string(from: time.dateValue() , to: Date()) ?? "" // time difference

}

