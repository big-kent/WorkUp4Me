//
//  LoginView.swift
//  WorkUp4UI
//
//  Created by Khang Lu Minh on 18/09/2023.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @Binding var currentShowingView: String
    @AppStorage("uid") var userID: String = ""
    
    //Define email and password as an attribute in scope
    @State private var email: String = ""
    @State private var password: String = ""
    
    // Track user login state
    @State private var isUserLoggedIn: Bool = true
    
    //For animation background
    @State private var startAnimation: Bool = false
    
    private func isValidPassword(_ password: String) -> Bool {
        // minimum 6 characters long
        // 1 uppercase character
        // 1 special char
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        return passwordRegex.evaluate(with: password)
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(colors: [Color("Mint"),Color("Purple")],startPoint: startAnimation ? .topLeading : .bottomLeading,endPoint: startAnimation ? .bottomTrailing: .topTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        withAnimation(.linear(duration: 5.0).repeatForever()) {
                            startAnimation.toggle()
                        }
                    }
                
                VStack {
                    HStack {
                        Text("Welcome Heater!")
                            .font(.largeTitle)
                            .bold()
                        
                        Spacer()
                    }
                    .padding()
                    .padding(.top)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "mail")
                        TextField("Email", text: $email)
                        
                        Spacer()
                        
                        if(email.count != 0) {
                            Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(email.isValidEmail() ? .green : .red)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white))
                    .padding()
                    
                    HStack {
                        Image(systemName: "lock")
                        SecureField("Password", text: $password)
                        
                        Spacer()
                        
                        if(password.count != 0) {
                            Image(systemName: isValidPassword(password) ? "checkmark" : "xmark")
                                .fontWeight(.bold)
                                .foregroundColor(isValidPassword(password) ? .green : .red)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.white))
                    .padding()
                    
                    Button(action: {
                        withAnimation {
                            self.currentShowingView = "signup"
                        }
                    }){
                        Text("Don't have an account?")
                            .foregroundColor(.black.opacity(0.7))
                    }
                    
                    Spacer()
                    Spacer()
                    
                    ZStack{
                        Button {
                            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                                if let error = error {
                                    print(error)
                                    return
                                }
                                if let authResult = authResult {
                                    print(authResult.user.uid)
                                    withAnimation {
                                        userID = authResult.user.uid
                                    }
                                }
                            }
                        } label: {
                            Text("Sign In")
                                .foregroundColor(.white)
                                .font(.title3)
                                .bold()
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.black)
                                )
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(currentShowingView: .constant("login"))
    }
}
