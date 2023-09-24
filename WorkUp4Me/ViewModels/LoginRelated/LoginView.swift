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
import LocalAuthentication

struct LoginView: View {
    
    @Binding var currentShowingView: String
    @AppStorage("uid") var userID: String = ""
    
    //Define email and password as an attribute in scope
    @State private var email: String = ""
    @State private var password: String = ""
    
    //For Face ID
    @State private var isFaceIDAvailable = false
    
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
                    
                    Button(action: {
                        let context = LAContext()
                        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {context
                            .evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Authenticate with Face ID") { success, error in
                                if success {
                                    // Authentication succeeded
                                    print("Face ID authentication successful")
                                    DispatchQueue.main.async {
                                        // Update the currentShowingView to move to HomeView
                                        self.currentShowingView = "home"}
                                } else {
                                    // Authentication failed
                                    print("Face ID authentication failed: \(error?.localizedDescription ?? "Unknown error")")
                                }
                                
                            }
                        } else {
                            // Face ID not available on this device
                            print("Face ID not available")
                        }
                    }) {
                        Image(systemName: "faceid")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
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
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(currentShowingView: .constant("login"))
    }
}
