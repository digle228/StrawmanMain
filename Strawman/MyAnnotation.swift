//
//  MyAnnotation.swift
//  Strawman
//
//  Created by wusuchen on 2016/1/15.
//
//

import Foundation
import UIKit
import MapKit


class MyAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var weigth: Double?
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, weigth: Double) {
        
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.weigth = weigth
    }
    
}