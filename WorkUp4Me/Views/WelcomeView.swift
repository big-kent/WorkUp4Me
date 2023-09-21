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

struct WelcomeView: View {
    
    @Binding var currentShowingView: String
    @AppStorage("uid") var userID: String = ""
    @State private var isUserLoggedIn: Bool = true // Use this to manage the NavigationLink
    @State private var startAnimation: Bool = false
   
    var body: some View {
        ZStack{
            
            if userID == "" {
                AuthView()
            } else {
                HomeView()
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    @State static var currentShowingView: String = "" // You can set an initial value here

    static var previews: some View {
        WelcomeView(currentShowingView: $currentShowingView)
    }
}
