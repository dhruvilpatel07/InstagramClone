//
//  AuthManager.swift
//  InstagramClone
//
//  Created by Dhruvil Patel on 2020-11-20.
//

import FirebaseAuth

public class AuthManager{
    static let shared = AuthManager()
    
    // MARK: - Public
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void){
        // Check if username is available
        // Check if email is available
        DatabaseConnection.shared.canCreateNewUser(with: email, username: username) { success in
            if success{
                // Create account
                // Insert Account to database
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard error == nil, result != nil else {
                        //Firebase auth couldn't create account
                        completion(false)
                        return
                    }
                    
                    //insert into database
                    DatabaseConnection.shared.insertNewUser(with: email, username: username) { insertSuccess in
                        if insertSuccess {
                            completion(true)
                            return
                        }else{
                            //faield to insert into database
                            completion(false)
                            return
                        }
                    }
                }
            }
            else{
                // username or email not available
                completion(false)
            }
        }
        
        
        
        
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void){
        if let email = email{
            // email login
            
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                guard authResult != nil, error == nil else{
                    completion(false)
                    return
                }
                completion(true)
            }
        }else if let username = username{
            // username login
            print(username)
        }
    }
    
    /// Attempt to logOut
    public func logOut(completion: (Bool) -> Void){
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        }catch{
            completion(false)
            return
        }
    }
}
