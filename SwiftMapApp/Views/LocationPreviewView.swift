//
//  LocationPreviewView.swift
//  SwiftMapApp
//
//  Created by Arnaldo Baumanis on 4/2/25.
//

import SwiftUI
//import MapKit

struct LocationPreviewView: View {
    @EnvironmentObject private var viewModel: LocationsViewModel
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 60)
                .shadow(radius: 8)
        )
        .cornerRadius(10)
    }
}

extension LocationPreviewView {
    // image section
    private var imageSection: some View {
        ZStack {
            if let imageNames = location.imageNames.first {
                Image(imageNames)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    // title section
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text(location.name)
                .font(.title)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // buttons section
    private var learnMoreButton: some View {
        Button(action: {
            viewModel.sheetLocation = location
        }) {
            Text("Learn More")
                .frame(width: 110, height: 25)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
        }
    }
    
    private var nextButton: some View {
        Button(action: {
            viewModel.nextButtonPressed()
        }) {
            Text("Next")
                .frame(width: 110, height: 25)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
        }
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea(edges: .all)
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .padding()
    }
        .environmentObject(LocationsViewModel())
        
}
