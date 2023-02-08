//
//  UserService.swift
//  Swifter
//
//  Created by Santos, Dario Ferreira on 08/02/2023.
//

import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        USERS_REF.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            
            let user = User(uid: uid, dictionary: dictionary)
            
            print("DEBUG: Username is \(user.username)")
        }
    }
}
