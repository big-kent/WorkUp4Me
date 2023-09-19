//
//  WelcomeView.swift
//  WorkUp4UI
//
//  Created by Khang Lu Minh on 13/09/2023.
//

import SwiftUI
import FirebaseAuth

struct WelcomeView: View {
    
    @Binding var currentShowingView: String
    @AppStorage("uid") var userID: String = ""
    @State private var isUserLoggedIn: Bool = false // Use this to manage the NavigationLink
    
    var body: some View {
        NavigationView{
            if userID == "" {
                AuthView()
            } else {
                
                Text("Logged In! \nYour user id is \(userID)")
                
                Button(action: {
                    let firebaseAuth = Auth.auth()
                    do {
                        try firebaseAuth.signOut()
                        withAnimation {
                            userID = ""
                            isUserLoggedIn = false // Set isUserLoggedIn to false when signing out
                        }
                    } catch let signOutError as NSError {
                        print("Error signing out: %@", signOutError)
                    }
                }) {
                    Text("Sign Out")
                }
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
