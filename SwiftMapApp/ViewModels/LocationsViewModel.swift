//
//  LocastionsViewModel.swift
//  SwiftMapApp
//
//  Created by Arnaldo Baumanis on 4/2/25.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    
    // show list of locations
    @Published var showLocationList: Bool = false
    
    // Show location detail via sheet
    @Published var sheetLocation: Location? = nil
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation (.easeInOut) {
            mapRegion = MKCoordinateRegion(center: mapLocation.coordinates, span: mapSpan)
        }
    }
    
    func toggleLocationList() {
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    }
    
    func selectLocation(location: Location) {
        withAnimation(.easeInOut) {
            self.mapLocation = location
            showLocationList = false
        }
    }
    
    func nextButtonPressed() {
        // get current index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else { return }
        
        // check if current index is valid, if is not valid restart from 0
        let nextIndex = (currentIndex + 1) < locations.count ? currentIndex + 1 : 0
//        let nextIndex = currentIndex + 1
//        guard locations.indices.contains(nextIndex) else {
//            // next index is not valid, restarft from 0
//            guard let firstLocation = locations.first else { return }
//            selectLocation(location: firstLocation)
//            
//            return
//        }
        
        // next index is valid
        let nextLocation = locations[nextIndex]
        selectLocation(location: nextLocation)
    }
}
