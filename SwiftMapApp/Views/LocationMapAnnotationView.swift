//
//  LocationMapAnnotationView.swift
//  SwiftMapApp
//
//  Created by Arnaldo Baumanis on 4/3/25.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack (spacing: 0) {
            Image (systemName: "map.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(accentColor)
                .font(.headline)
                //.padding(6)
                .scaledToFit()
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(.degrees(180))
                .offset(y: -2)
                .padding(.bottom, 40)
        }
    }
}

#Preview {
    LocationMapAnnotationView()
}
