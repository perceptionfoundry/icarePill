//
//  FirebaseViewModel.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 19/03/2021.
//

import SwiftUI
import Firebase

class FirebaseViewModel{
    
    private var dbRef = Firestore.firestore()
    
    func signUpWithEmail(Email: String, Password:String, userDetail: [String:Any], completion: @escaping(_ status : Bool, _ error: String?)->()){
        
        
        //MARK: Sign up with Email
        
        Auth.auth().createUser(withEmail: Email, password: Password) { (result, err) in
            
            if err == nil{
                
                var uploadData = userDetail
                
                let userID = (result?.user.uid)!
                let imageDetail = uploadData["dp"] as! UIImage
                
                SaveImageViewModel().SaveImage(Title: "dp_\(userID)", selectedImage: imageDetail ) { (imageURL, status, upload_err) in
                    
                    
                    if status{
                        
                        uploadData["id"] = userID
                        uploadData["dp"] = imageURL
                        
                        print(uploadData)
                        
                   
                     self.dbRef.collection("Users").document((result?.user.uid)!).setData(uploadData) { (err) in
                            
                            if err != nil{
                                completion(false, err?.localizedDescription)
                            }else{
                                completion(true, nil)
                            }
                            
                        }
                    
                    }
                    
                    
                }
                
                completion(true, nil)
            }else{
                completion(false, err?.localizedDescription)
            }
        }
        
      
        
        
        
    }
    
    
    
    func signInWithEmail(Email: String, Password:String,completion: @escaping(_ status : Bool, _ error: String?)->()){
        
        
        Auth.auth().signIn(withEmail: Email, password: Password) { (authResult, err) in
            
            if err == nil{
                completion(true, nil)
            }else{
                completion(false,err?.localizedDescription)
            }
        }
        
        
    }
}

