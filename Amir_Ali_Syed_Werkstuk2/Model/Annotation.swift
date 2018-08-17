//
//  Annotation.swift
//  Amir_Ali_Syed_Werkstuk2
//
//  Created by Amir Ali Syed on 17/08/2018.
//  Copyright © 2018 Amir Ali Syed. All rights reserved.
//

import MapKit

class Annotation: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}

