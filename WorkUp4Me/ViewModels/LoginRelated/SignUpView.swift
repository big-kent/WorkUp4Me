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
import Firebase

struct SignUpView: View {
    
    @State private var email: String = "" // Stores the user's email
    @State private var password: String = "" // Stores the user's password
    @AppStorage("uid") var userID: String = "" // Stores the user's ID using AppStorage
    @Binding var currentShowingView: String // Tracks the current view being shown
    @State private var startAnimation: Bool = false // For animating the background
    
    // Function to validate the password based on certain criteria
    private func isValidPassword(_ password: String) -> Bool {
        // Password should be at least 6 characters long
        // Should contain at least 1 uppercase character, 1 special character, and 1 number
        let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z])(?=.*\\d).{6,}$")
        return passwordRegex.evaluate(with: password)
    }

    var body: some View {
        ZStack {
            
            // Gradient background with animation
            LinearGradient(colors: [Color("Mint"),Color("Purple")],startPoint: startAnimation ? .topLeading : .bottomLeading,endPoint: startAnimation ? .bottomTrailing: .topTrailing)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    withAnimation(.linear(duration: 5.0).repeatForever()) {
                        startAnimation.toggle()
                    }
                }
            
            VStack {
                HStack {
                    Text("Create an Account!")
                        .foregroundColor(.black)
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
                .foregroundColor(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.black))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black))
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
                .foregroundColor(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.black))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black))
                .padding()
                
                Button(action: {
                    withAnimation {
                        self.currentShowingView = "login"
                    }
                }) {
                    Text("Already have an account?")
                        .foregroundColor(.white)
                }
                
                Spacer()
                Spacer()
                
                Button {
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        if let error = error {
                            print(error)
                            return
                        }
                        if let authResult = authResult {
                            print(authResult.user.uid)
                            userID = authResult.user.uid
                            
                            // Create a reference to the Firestore database
                            let db = Firestore.firestore()
                            
                            // Create a dictionary to store the user's data
                            let userData: [String: Any] = [
                                "email": email,
                                "password": password
                                // Add other user-related data as needed
                            ]
                            
                            // Add the data to Firestore under the "Users" collection using the user's UID as the document ID
                            db.collection("Users").document(userID).setData(userData) { error in
                                if let error = error {
                                    print("Error adding document: \(error)")
                                } else {
                                    print("Document added with ID: \(userID)")
                                    
                                    // Now, save the userID in Firestore Authentication (if needed)
                                    Auth.auth().currentUser?.updateEmail(to: email) { (error) in
                                        if let error = error {
                                            print("Error updating email in Firestore Authentication: \(error)")
                                        }
                                    }
                                }
                            }
                        }
                    }
                } label: {
                    Text("Create New Account")
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(currentShowingView: .constant("signup"))
    }
}
