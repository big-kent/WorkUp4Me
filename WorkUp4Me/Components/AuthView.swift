//
//  LoginView.swift
//  WorkUp4IAM
//
//  Created by Khang Lu Minh on 12/09/2023.
//
// Source:  https://github.com/DerekHsiehDev/SwiftUI-FirebaseAuth
// Youtube: https://www.youtube.com/watch?v=OTg_yZp3T34
//          https://www.youtube.com/watch?v=6b2WAePdiqA
//          https://www.youtube.com/watch?v=GiCTgsH0dtk
//

import SwiftUI
import FirebaseAuth

struct AuthView: View {
    @State private var currentViewShowing: String = "login" // login or signup
    @State private var startAnimation: Bool = false // for animation background
    
    var body: some View {
        ZStack{
            if(currentViewShowing == "login") {
                LoginView(currentShowingView: $currentViewShowing)
                    .preferredColorScheme(.light)
            } else {
                SignUpView(currentShowingView: $currentViewShowing)
                    .preferredColorScheme(.dark)
                    .transition(.move(edge: .bottom))
            }
        }
    }
}
struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

