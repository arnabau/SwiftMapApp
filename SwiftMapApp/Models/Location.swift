//
//  Location.swift
//  SwiftMapApp
//
//  Created by Arnaldo Baumanis on 4/2/25.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    /*
        Identifiable.
        name = Colosseum
        cityName = Rome
        id = ColosseumRome
     */
    var id: String {
        name + cityName
    }
    
    // Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
