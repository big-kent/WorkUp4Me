//
//  SettingViewModel.swift
//  WorkUp4Me
//
//  Created by Khoi Duong on 25/09/2023.
//

import Foundation
import Firebase
import FirebaseStorage

class SettingViewModel:ObservableObject{
    
    @Published var errorMessage = ""
    @Published var user: Users?

    private var db = Firestore.firestore()
    init() {
        fetchCurrentUser()
    }
    func fetchCurrentUser(){
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
            //print(data)
            self.errorMessage = "Data: \(data.description)"
            let uid = data["uID"] as? String ?? ""
            let email = data["email"] as? String ?? ""
            let passWord = data["password"] as? String ?? ""
            let fullname = data["fullName"] as? String ?? ""
            let displayName = data["displayName"] as? String ?? ""
            let dOB = data["dOB"] as? String ?? ""
            let gender = data["Gender"] as? String ?? ""
            let address = data["address"] as? String ?? ""
            let phoneNo = data["phoneNo"] as? String ?? ""
            let profileImageURL = data["profileImageURL"] as? String ?? ""
            
            
            print(displayName)
            
            self.user = Users(uId: uid, email: email, password: passWord, fullName: fullname, displayName: displayName, dOB: dOB, gender: gender, address: address, phoneNo: phoneNo, profileImageURL: profileImageURL)
        }
    }
    
    public func saveImageUrl(profileImage: UIImage){
        guard let uid = Auth.auth().currentUser?.uid else{
            self.errorMessage = "Could not find currentuser uid "
            return
        }
        let ref = Storage.storage().reference(withPath: uid)
        
        guard let imageData = profileImage.jpegData(compressionQuality: 0.5) else {
            self.errorMessage = "Could not compress"
            return
        }
        
        ref.putData(imageData,metadata: nil) { metadata, err in
            if let err = err {
                self.errorMessage = "Failed to upload \(err)"
                return
            }
        }
        
        ref.downloadURL { url, err in
            if let err = err {
                self.errorMessage = "Failed to download url \(err)"
                return
            }
            print(url?.absoluteString ?? "")
        }
       
    }
    
    func DatetoString(date :Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.string(from: date)
        return date
    }
    
    public func updateCurrentUser(fullName: String, displayName: String, dOB: String, gender: String, address: String, phoneNo: String){
            
            guard let uid = Auth.auth().currentUser?.uid else{
                self.errorMessage = "Could not find currentuser uid "
                return
            }
            if fullName != ""{
                db.collection("Users").document(uid).updateData(["fullName": fullName])
            }
            if displayName != ""{
                db.collection("Users").document(uid).updateData(["displayName": displayName])
            }
            if dOB != DatetoString(date: Date()){
                db.collection("Users").document(uid).updateData(["dOB": dOB])
            }
            if gender != ""{
                db.collection("Users").document(uid).updateData(["Gender": gender])
            }
            if address != ""{
                db.collection("Users").document(uid).updateData(["address": address])
            }
            if phoneNo != ""{
                db.collection("Users").document(uid).updateData(["phoneNo": phoneNo])
            }
        }
    
    public func changePassword(passWord: String){
        if passWord != ""{
            Auth.auth().currentUser?.updatePassword(to: passWord){error in
                if let error = error{
                    print("Failed to update password:",error)
                    return
                }
            }
        }
    }
}
 
