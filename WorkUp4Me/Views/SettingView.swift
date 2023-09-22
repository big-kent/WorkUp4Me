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
import FirebaseFirestore

struct SettingView: View {
    
    //Use userDault to store data from LoginView and display it here
    @State private var userEmail: String = UserDefaults.standard.string(forKey: "userEmail") ?? ""
    @State private var userPassword: String = UserDefaults.standard.string(forKey: "userPassword") ?? ""
    @State private var userID: String = ""
    
    //Other data to store
    @State private var username: String = ""
    @State private var disName: String = "Display name"
    @State private var birthDate: Date = Date()
    @State private var gender: String = ""
    @State private var isAboutUs: Bool = false
    @EnvironmentObject var userDataManager: UserDataManager
    
    //Some side design UI
    @State private var isUserLoggedIn: Bool = true
    @State private var startAnimation: Bool = false
    
    //Use for dark mode
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    let genders = ["Male", "Female", "Prefer Not To Say"]
    
    
    var body: some View {
        ZStack{
            Form {
                Section {
                    HStack {
                        Text("User Password: ")
                        Spacer()
                        Text(userPassword)
                    }
                    
                    HStack {
                        Text("User Email: ")
                        Spacer()
                        Text(userEmail)
                    }
                } header: {
                    Text("Account")
                }
                
                Section {
                    HStack {
                        Text("Full Name")
                        Spacer()
                        TextField("Full Name", text: $username)
                            .multilineTextAlignment(.trailing)
                    }
                    
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
                    Toggle("Dark Mode", isOn: $isDarkMode) // Dark mode switch
                    Text("About us")
                        .onTapGesture {
                            isAboutUs.toggle()
                        }
                        .alert("About Us", isPresented: $isAboutUs) {
                            Button("OK", role: .cancel) {}
                        } message: {
                            Text("Email us")
                        }
                    
                    Button(action: {
                        // Update user information in Firestore
                        userDataManager.updateUserInfo(username: username, disName: disName) { error in
                            if let error = error {
                                print("Error updating user information: \(error.localizedDescription)")
                            } else {
                                print("User information updated successfully")
                            }
                        }
                    }) {
                        Text("Save Changes")
                            .foregroundColor(.blue)
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
            .environment(\.colorScheme, isDarkMode ? .dark : .light)
            .edgesIgnoringSafeArea(.bottom) // Ignore safe area for full-width background
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Training")
            )
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
