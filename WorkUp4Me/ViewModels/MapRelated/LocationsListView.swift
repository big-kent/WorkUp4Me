//
//  LocationsListView.swift
//  WorkUp4Me
//
//  Created by Võ Phúc Duy Nhật on 21/09/2023.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            // Iterate through the list of locations and create a button for each
            ForEach(vm.locations) { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    // Call a helper function to create the list row view
                    listRowView(location: location)
                }
                .padding(.vertical, 4) // Add vertical padding to the button
                .listRowBackground(Color.clear) // Set the background color of the list row to clear
            }
        }
        .listStyle(PlainListStyle()) // Use plain list style for the List view
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationsViewModel()) // Inject the LocationsViewModel as an environment object
    }
}

extension LocationsListView {
    
    // Helper function to create a custom list row view for a location
    private func listRowView(location: Location) -> some View {
        HStack {
            // Display the location's image if available
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10) // Apply a corner radius to the image
            }
            
            // Display the location's name and city name
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline) // Use a headline font style for the location name
                Text(location.cityName)
                    .font(.subheadline) // Use a subheadline font style for the city name
            }
            .frame(maxWidth: .infinity, alignment: .leading) // Expand the VStack to fill the available width
        }
    }
    
}
