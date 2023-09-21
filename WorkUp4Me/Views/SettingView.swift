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
import Firebase

struct SettingView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var email: String = "email@gmail.com"
    @State private var disName: String = "Display name"
    @State private var birthDate: Date = Date()
    @State private var gender: String = ""
    @State private var isAboutUs: Bool = false
    @State private var isUserLoggedIn: Bool = true
    @AppStorage("uid") var userID: String = ""
    
    let genders = ["Male", "Female", "Prefer Not To Say"]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Form {
            Section {
                HStack {
                    Text("Username")
                    Spacer()
                    TextField("\(username)", text: $username)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Password")
                    Spacer()
                    SecureField("\(password)", text: $password)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Email")
                    Spacer()
                    TextField("\(email)", text: $email)
                        .multilineTextAlignment(.trailing)
                }
            } header: {
                Text("Account")
            }
            
            Section {
                HStack {
                    Text("Display Name")
                    Spacer()
                    TextField("\(disName)", text: $disName)
                        .multilineTextAlignment(.trailing)
                }
                DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                    Text("Date of Birth")
                }
                Picker("Gender", selection: $gender) {
                    ForEach(genders, id: \.self) {
                        Text($0)
                    }
                }
            } header: {
                Text("Profile")
            }
            
            Section {
                Text("About us")
                    .onTapGesture {
                        isAboutUs.toggle()
                    }.alert("About Us", isPresented: $isAboutUs) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text("Email us")
                    }
                
                if isUserLoggedIn {
                    Button(action: {
                        let firebaseAuth = Auth.auth()
                        do {
                            try firebaseAuth.signOut()
                            withAnimation {
                                userID = ""
                                isUserLoggedIn = false
                            }
                        } catch let signOutError as NSError {
                            print("Error signing out: %@", signOutError)
                        }
                    }) {
                        Text("Sign Out")
                            .foregroundColor(.red)
                    }
                } else {
                    Text(">.< You not logged yet baka 👉🏼👈🏼" )
                }
            } header: {
                Text("Application")
            }
        }
        .edgesIgnoringSafeArea(.bottom) // Ignore safe area for full-width background
        .safeAreaInset(edge: .top, content: {
            Color.clear.frame(height: 70)
        })
        .overlay(
            NavigationBar(title: "Training")
        )
    }
}
    
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
