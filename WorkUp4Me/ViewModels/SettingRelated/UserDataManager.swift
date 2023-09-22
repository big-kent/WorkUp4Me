//
//  UserDataManager.swift
//  WorkUp4Me
//
//  Created by Khang Lu Minh on 22/09/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class UserDataManager: ObservableObject {
    func updateUserInfo(username: String, disName: String, completion: @escaping (Error?) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {
            // Handle user not being logged in
            return
        }
        
        let db = Firestore.firestore()
        let userRef = db.collection("User Information").document(uid)
        
        let updatedData: [String: Any] = [
            "Full Name": username,
            "Display Name": disName,
            // Add other fields as needed
        ]
        
        userRef.updateData(updatedData) { error in
            completion(error)
        }
    }
}
