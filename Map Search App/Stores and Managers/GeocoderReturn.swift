//
//  GeocoderReturn.swift
//  Map Search App
//
//  Created by Константин Малков on 03.02.2023.
//

import Foundation
import MapKit

struct Geocoder {
    let streetName: String
    let appNumber: String
    let administrativArea: String
    let district: String
    let country: String
    let postalCode: String
    let areaOfInterest: String?
    let placemark: CLPlacemark
    
    init(streetName: String, appNumber: String, administrativArea: String, district: String, country: String, postalCode: String, areaOfInterest: String?, placemark: CLPlacemark) {
        self.streetName = streetName
        self.appNumber = appNumber
        self.administrativArea = administrativArea
        self.district = district
        self.country = country
        self.postalCode = postalCode
        self.areaOfInterest = areaOfInterest
        self.placemark = placemark
    }
}

class GeocoderReturn: NSObject {
    static let shared = GeocoderReturn()
    
    public func convertFromGeocode(coordinate location: CLLocationCoordinate2D, completion: @escaping ((Geocoder) -> Void)){
        let location = CLLocation(latitude: location.latitude, longitude: location.longitude)
        print(location)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { places, error in
            guard let place = places?.first, error != nil else {
                return
            }
            
            print(place.country)
            let street = place.thoroughfare ?? ""
            let appNum = place.subThoroughfare ?? ""
            let area = place.administrativeArea ?? ""
            let country = place.country ?? ""
            let district = place.subLocality ?? ""
            let postal = place.postalCode ?? ""
            let areaOfInterest = place.areasOfInterest?.first ?? ""
            
            let result = Geocoder(streetName: street, appNumber: appNum, administrativArea: area, district: district, country: country, postalCode: postal, areaOfInterest: areaOfInterest, placemark: place)
            completion(result)
            print(result)
        }
    }
    
    
}
