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
import FirebaseAuth

struct AuthView: View {
    @State private var currentViewShowing: String = "login" // Indicates whether to show the login or signup view
    @State private var startAnimation: Bool = false // Used for animating the background
    
    var body: some View {
        if(currentViewShowing == "login") {
            LoginView(currentShowingView: $currentViewShowing) // Display the login view
                .preferredColorScheme(.light) // Use the light color scheme
        } else {
            SignUpView(currentShowingView: $currentViewShowing) // Display the signup view
                .preferredColorScheme(.dark) // Use the dark color scheme
                .transition(.move(edge: .bottom)) // Add a transition effect when switching to this view
        }
        
        if currentViewShowing == "login" {
            LoginView(currentShowingView: $currentViewShowing) // Display the login view again
        } else if currentViewShowing == "home" {
            HomeView() // Display the home view if the currentViewShowing is "home"
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView() // Preview the AuthView
    }
}
