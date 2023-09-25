/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2023B
 Assessment: Assignment 3
 Author: Lu Minh Khang, Trinh Xuan Khanh, Nguyen Viet Quan, Vo Phuc Duy Nhat, Duong Khoi
 ID: s3863969,
 Created date: 10/09/2023
 Last modified: 23/09/2023
 Acknowledgement: None
*/

import SwiftUI

struct HomeView: View {
    
    @State private var startAnimation: Bool = false // Flag to control animation
    @EnvironmentObject private var vm: LocationsViewModel // Access the LocationsViewModel
    
    var body: some View {
        ZStack {
            VStack {
                // TabView for different sections of the app
                TabView {
                    TrainingView() // Display the TrainingView in a tab
                        .tabItem {
                            Image(systemName: "bolt.fill")
                                .padding(.bottom, 20)
                            Text("Training")
                        }
                    
                    CourseView() // Display the CourseView in a tab
                        .tabItem {
                            Image(systemName: "book.fill")
                            Text("Course")
                        }
                    
                    MapView() // Display the MapView in a tab
                        .environmentObject(LocationsViewModel()) // Provide LocationsViewModel as an environment object for MapView
                        .tabItem {
                            Image(systemName: "map.fill")
                            Text("Map")
                                .padding(.bottom, 2)
                        }
                    
                    SettingView() // Display the SettingView in a tab
                        .tabItem {
                            Image(systemName: "person")
                            Text("Setting")
                        }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(LocationsViewModel()) // Provide LocationsViewModel as an environment object

    }
}
