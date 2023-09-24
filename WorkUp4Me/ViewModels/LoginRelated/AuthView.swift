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
    @State private var currentViewShowing: String = "login" // login or signup
    @State private var startAnimation: Bool = false // for animation background
    
    var body: some View {
        if(currentViewShowing == "login") {
            LoginView(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.light)
        } else {
            SignUpView(currentShowingView: $currentViewShowing)
                .preferredColorScheme(.dark)
                .transition(.move(edge: .bottom))
        }
        
        if currentViewShowing == "login" {
            LoginView(currentShowingView: $currentViewShowing)
        } else if currentViewShowing == "home" {
            HomeView()
        }
    }
}
struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

