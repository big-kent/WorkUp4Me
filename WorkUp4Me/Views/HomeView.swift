/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 3
  Author: Lu Minh khang, Trinh Xuan Khanh, Nguyen Viet Quan, Vo Phuc Duy Nhat, Duong Khoi
  ID: s3863969,
  Created  date: 10/09/2023
  Last modified: 23/09/2023
  Acknowledgement: None
*/

import SwiftUI

struct HomeView: View {
    
    @State private var startAnimation: Bool = false
    
    var body: some View {
        ZStack{
            
            LinearGradient(colors: [Color("Mint"),Color("Purple")],startPoint: startAnimation ? .topLeading : .bottomLeading,endPoint: startAnimation ? .bottomTrailing: .topTrailing)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    withAnimation(.linear(duration: 5.0).repeatForever()) {
                        startAnimation.toggle()
                    }
                }
            
            TabView {
                TrainingView()
                    .tabItem {
                        Image(systemName: "bolt.fill")
                            .padding(.bottom, 20)
                        Text("Training")
                    }
                
                CourseView()
                    .tabItem {
                        Image(systemName: "book.fill")
                        Text("Course")
                    }
                
                MapView()
                
                    .tabItem {
                        Image(systemName: "map.fill")
                        Text("Map")
                            .padding(.bottom, 2)
                    }
                
                SettingView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Settings")
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
