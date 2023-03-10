//
//  AuthService.swift
//  Swifter
//
//  Created by Santos, Dario Ferreira on 08/02/2023.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullName: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    static let shared = AuthService()
    
    func logUserIn(withEmail email: String, password: String, handler: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func registeredUser(credentials: AuthCredentials, completion: @escaping(Error?, DatabaseReference) -> Void) {
        let email = credentials.email
        let password = credentials.password
        let fullName = credentials.fullName
        let username = credentials.username
        
        guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = STORAGE_PROFILE_IMAGES.child(filename)
        
        storageRef.putData(imageData, metadata: nil) { (meta, error) in
            storageRef.downloadURL { (url, error) in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if let error = error {
                        print("DEBUG: Error - \(error.localizedDescription)")
                        return
                    }
                    guard let uid = result?.user.uid else { return }
                    let values = ["email": email, "username": username, "fullname": fullName, "profileImageUrl": profileImageUrl]
                    
                    USERS_REF.child(uid).updateChildValues(values, withCompletionBlock: completion)
                }
            }
            
        }
    }
}
