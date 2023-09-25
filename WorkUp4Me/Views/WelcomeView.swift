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
import FirebaseAuth

struct WelcomeView: View {
    
    @Binding var currentShowingView: String // Keeps track of the current view being shown
    @AppStorage("uid") var userID: String = "" // Stores the user's ID using AppStorage
    @State private var isUserLoggedIn: Bool = true // Use this to manage the NavigationLink
    @State private var startAnimation: Bool = false // For animation background
   
    var body: some View {
        ZStack{
            // Check if the user is logged in using their ID
            if userID == "" {
                AuthView() // Show the authentication view if the user is not logged in
            } else {
                HomeView() // Show the home view if the user is logged in
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    @State static var currentShowingView: String = "" // You can set an initial value here

    static var previews: some View {
        WelcomeView(currentShowingView: $currentShowingView) // Preview the WelcomeView with a binding to currentShowingView
    }
}

