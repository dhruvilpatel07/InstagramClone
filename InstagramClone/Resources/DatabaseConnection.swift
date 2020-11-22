//
//  DatabaseConnection.swift
//  InstagramClone
//
//  Created by Dhruvil Patel on 2020-11-20.
//

import FirebaseDatabase

public class DatabaseConnection{
    static let shared = DatabaseConnection()
    private let db = Database.database().reference()
    // MARK: - Public
    
    ///Check if username and email is available
    /// - Parameters
    ///     - email: String representing email
    ///     - username: String representing username 
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void){
        completion(true)
    }
    ///Inserts new user to database
    /// - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    ///     - completion: Asyn callback for result if database entery succeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void){
        
        db.child(email.safeDatabaseKEy()).setValue(["username": username]) { (err, _) in
            if err == nil{
                //successfully added
                completion(true)
                return
            }else{
                //failed
                completion(false)
                return
            }
        }
    }
}
