//
//  Station.swift
//  Amir_Ali_Syed_Werkstuk2
//
//  Created by Amir Ali Syed on 17/08/2018.
//  Copyright © 2018 Amir Ali Syed. All rights reserved.
//

import Foundation

struct Station: Codable {
    let name: String
    let address: String
    let position: Position?
}

struct Position: Codable {
    let lat: Double
    let lng: Double
}
