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
import FirebaseStorage

   

struct SettingView: View {
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var phoneNo: String = ""
    @State private var address: String = ""
    @State private var disName: String = ""
    @State private var birthDate: Date = Date()
    @State private var gender: String = ""
    @State private var isDOB: Bool = false
    @State private var isAboutUs: Bool = false
    @State private var isUserLoggedIn: Bool = true
    @State private var isDisabled: Bool = true
    @State private var isChangeProfile = false
    @State private var isFaceID: Bool = false
    @State private var image = UIImage()
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    @AppStorage("uid") var userID: String = ""
    //    @StateObject private var userViewModel = UsersViewModel()
    let genders = ["","Male", "Female", "Prefer Not To Say"]
    
    @ObservedObject var vm = SettingViewModel()
    
    func DatetoString(date :Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.string(from: date)
        return date
    }
    
    func StringtoDate(string :String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        guard let date = dateFormatter.date(from: string) else { return Date() }
        return date
    }
    
    var body: some View {
        ZStack{
            List {
                HStack{
                    Image(uiImage: self.image)
                        .resizable()
                        .cornerRadius(22)
                        .padding(.all, 4)
                        .frame(width: 100, height: 100)
                        .background(Color.black.opacity(0.2))
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .onTapGesture {
                            isChangeProfile.toggle()
                        }
                    Text("Welcome \(vm.user?.displayName ?? "")")
                        .font(.title3)
                        .bold()
                }
                Section {
                    HStack {
                        Text("Email")
                        Spacer()
                        Text("\(vm.user?.email ?? "")")
                            .multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Password")
                        Spacer()
                        SecureField("**********", text: $password)
                            .multilineTextAlignment(.trailing)
                            .disabled(isDisabled)
                    }
                    
                } header: {
                    Text("Account")
                }
                
                Section {
                    HStack {
                        Text("Full Name")
                        Spacer()
                        TextField("\(vm.user?.fullName ?? "")", text: $fullName)
                            .multilineTextAlignment(.trailing)
                            .disabled(isDisabled)
                    }
                    HStack {
                        Text("Display Name")
                        Spacer()
                        TextField("\(vm.user?.displayName ?? "")", text: $disName)
                            .multilineTextAlignment(.trailing)
                            .disabled(isDisabled)
                    }
                    HStack{
                        if isDisabled == true{
                            Text("Date of Birth")
                            Spacer()
                            Text("\(vm.user?.dOB ?? "")")
                        } else{
                            DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                                Text("Date of Birth")
                            }
                        }
                    }
                    HStack{
                        if isDisabled == true{
                            Text("Gender")
                            Spacer()
                            Text("\(vm.user?.gender ?? "")")
                        } else{
                            Picker("Gender", selection: $gender) {
                                ForEach(genders, id: \.self) {
                                    Text($0)
                                }
                            }
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
                    if isDisabled == true{
                        Text("Edit")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                isDisabled.toggle()
                            }
                    } else{
                        Text("Save changes")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                isDisabled.toggle()
                                SettingViewModel().updateCurrentUser(fullName: fullName, displayName: disName, dOB: DatetoString(date: birthDate),gender: gender,address: address,phoneNo: phoneNo )
                                vm.fetchCurrentUser()
                                vm.changePassword(passWord: password)
                                vm.saveImageUrl(profileImage: image)

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
                            Text("COSC2659 - Assignment 3: WorkUp4ME")
                        }
                    HStack{
                        Text("FaceID")
                        Spacer()
                        Toggle(isOn: $isFaceID){
                            Text("")
                        }
                    }
                    HStack {
                        Text("Dark Mode")
                        Spacer()
                        Toggle(isOn: $isDarkMode) {
                            Text("")
                        }
                        .toggleStyle(SwitchToggleStyle(tint: .blue)) // Use a switch-style toggle with blue tint
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
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundColor(.red)
                        }
                    } else {
                        Text(">.< You not logged yet baka 👉🏼👈🏼" )
                    }
                    
                
                } header: {
                    Text("Application")
                }
                
            }
            .padding(.bottom, 80)
            .edgesIgnoringSafeArea(.bottom) // Ignore safe area for full-width background
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(
                NavigationBar(title: "Setting")
            )
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .fullScreenCover(isPresented: $isChangeProfile) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
    }
}
    
struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}


