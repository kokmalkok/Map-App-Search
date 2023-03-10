//
//  ManageStructs.swift
//  Map Search App
//
//  Created by Константин Малков on 29.01.2023.
//

import Foundation
import UIKit
import MapKit



struct FullAdress {
    let street: String
    let appartmentNumber: String
    let city: String
    let country: String
    let postIndex: String
    let latitude: Double
    let longitude: Double
}

struct DetailsData {
    let userLocation: CLLocationManager
    let placePoint: CLLocationCoordinate2D
    let pointOfInterestName: String
    let distanceRoute: String
    let placemark: CLPlacemark?
}


