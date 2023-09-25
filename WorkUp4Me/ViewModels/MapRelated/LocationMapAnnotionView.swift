//
//  LocationMapAnnotionView.swift
//  WorkUp4Me
//
//  Created by Khang Lu Minh on 21/09/2023.
//



// LocationMapAnnotionView is a SwiftUI view used to display a location map annotation.
// It consists of two images: a map icon and a triangle below it, both styled with an accent color.
import SwiftUI

struct LocationMapAnnotionView: View {
    
    // Define the accent color to be used for the view
    let accentColor = Color("accentColor")
    
    var body: some View {
        // Create a vertical stack to hold the map icon and triangle
        VStack(spacing: 0) {
            // Map icon represented as an image
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(36) // Round the corners of the background
            
            // Triangle icon represented as an image, positioned below the map icon
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180)) // Rotate the triangle icon 180 degrees
                .offset(y: -3) // Adjust the vertical position of the triangle
                .padding(.bottom, 40) // Add some padding at the bottom of the stack
        }
    }
}

struct LocationMapAnnotionView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a preview with a black background and display the LocationMapAnnotionView
        ZStack {
            Color.black.ignoresSafeArea()
            LocationMapAnnotionView()
        }
    }
}

