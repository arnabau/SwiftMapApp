//
//  SwiftMapAppApp.swift
//  SwiftMapApp
//
//  Created by Arnaldo Baumanis on 4/2/25.
//

import SwiftUI

@main
struct SwiftMapAppApp: App {
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            LocationsView()
                .environmentObject(vm)
        }
    }
}
