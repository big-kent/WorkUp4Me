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

class SettingViewModel:ObservableObject{
    
    @Published var errorMessage = ""
    @Published var user: Users?

    private var db = Firestore.firestore()
    init() {
        fetchCurrentUser()
    }
    private func fetchCurrentUser(){
//
//        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
//            self.errorMessage = "Could not find current user uid"
//            return
//        }
        guard let uid = Auth.auth().currentUser?.uid else{
            self.errorMessage = "Could not find currentuser uid "
            return
        }
        self.errorMessage = uid
        db.collection("Users").document(uid).getDocument { snapshot, error in
            if let error = error{
                print("Failed to fetch current user:",error)
                return
            }
            
            guard let data = snapshot?.data() else {
                self.errorMessage = "No Data Found"
                return
            }
            print(data)
            self.errorMessage = "Data: \(data.description)"
            let uid = data["uID"] as? String ?? ""
            let email = data["email"] as? String ?? ""
            let passWord = data["password"] as? String ?? ""
            let fullname = data["fullname"] as? String ?? ""
            let displayName = data["displayname"] as? String ?? ""
            let dOB = data["dOB"] as? String ?? ""
            let gender = data["gender"] as? String ?? ""
            let address = data["address"] as? String ?? ""
            let phoneNo = data["phoneNo"] as? String ?? ""
            
            self.user = Users(uId: uid, email: email, password: passWord, fullName: fullname, displayName: displayName, dOB: dOB, gender: gender, address: address, phoneNo: phoneNo)
        }
    }
    
}

struct SettingView: View {
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var phoneNo: String = ""
    @State private var address: String = ""
    @State private var disName: String = ""
    @State private var birthDate: Date = Date()
    @State private var gender: String = ""
    @State private var isAboutUs: Bool = false
    @State private var isUserLoggedIn: Bool = true
    @AppStorage("uid") var userID: String = ""
//    @StateObject private var userViewModel = UsersViewModel()
    let genders = ["Male", "Female", "Prefer Not To Say"]
    
    @ObservedObject var vm = SettingViewModel()
    
    func StringtoDate(string :String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        guard let date = dateFormatter.date(from: string) else { return Date.now }
        return date
    }
    init(){
        birthDate = StringtoDate(string: vm.user?.dOB ?? "")
        gender = vm.user?.gender ?? ""
    }
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Email")
                    Spacer()
                    TextField("\(vm.user?.email ?? "")", text: $email)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Password")
                    Spacer()
                    SecureField("\(vm.user?.password ?? "")", text: $password)
                        .multilineTextAlignment(.trailing)
                }

            } header: {
                Text("Account")
            }
            
            Section {
                HStack {
                    Text("Fullname")
                    Spacer()
                    TextField("\(vm.user?.fullName ?? "")", text: $fullName)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Display Name")
                    Spacer()
                    TextField("\(vm.user?.displayName ?? "")", text: $disName)
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
                HStack {
                    Text("Address")
                    Spacer()
                    TextField("\(vm.user?.address ?? "")", text: $address)
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Phone Number")
                    Spacer()
                    TextField("\(vm.user?.phoneNo ?? "")", text: $phoneNo)
                        .multilineTextAlignment(.trailing)
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
