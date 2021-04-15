//
//  FirebaseViewModel.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 19/03/2021.
//

import SwiftUI
import Firebase
import CodableFirebase

class FirebaseViewModel: ObservableObject{
    
    private var dbRef = Firestore.firestore()
    
    
    @AppStorage("Auth") var isAuth : Bool?
    @AppStorage("UserId") var userId : String?
    
    
    @Published var isSocialAuth : Bool = false
    
    
    //MARK: SIGN UP
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
    
    
    
    func SocialNetworkAuth(credential: AuthCredential, completion: @escaping(_ Status : Bool)->()){
        
        
        //MARK: Sign up with Email
        
        Auth.auth().signIn(with: credential) { (userInfo, error) in
            if let error = error {
                // ...
                print(error.localizedDescription)
            }
            
            print("Google Sign IN Successfully")
            let userID = (userInfo?.user.uid)!
            
            
            
            
            self.dbRef.collection("Users").whereField("userUID", isEqualTo: userID).getDocuments { (checkResult, checkErr) in
                
                let checkCount = (checkResult?.count)!
                
                
                if checkCount == 0{
                    
                    let collectionRef =  self.dbRef.collection("Users").document((userInfo?.user.uid)!)
                    
          
                    
                    let initialData = ["id": userID,
                        "first": (userInfo?.user.displayName ?? ""),
                                        "last": "-",
                                        "type": "Self",
                                        "gender": "-",
                                        "dob": "01/01/1970",
                                        "zip": "-",
                                        "dp":"-"] 
                    
                    print(initialData)
                    
                    
                    collectionRef.setData(initialData)
                    self.isAuth = true
                    self.userId = userID
                    
                    self.isSocialAuth = true
                    completion(true)
                                          
                
                }
                    
                else{
                    self.isAuth = true
                    self.userId = userID
                    
                    completion(false)
                    
                }
            }
            
            
        }
        
      
        
        
        
    }
    
    //MARK: SIGN IN VIA EMAIL
    func signInWithEmail(Email: String, Password:String,completion: @escaping(_ status : Bool, _ error: String?)->()){
        
        
        Auth.auth().signIn(withEmail: Email, password: Password) { [self] (authResult, err) in
            
            if err == nil{
                
                
                
                isAuth = true
                userId = authResult?.user.uid
                
                completion(true, nil)
            }else{
                isAuth = false
                completion(false,err?.localizedDescription)
            }
        }
        
        
    }
    
    //MARK: CREATE COLLECTION
    
    func CreateCollection(collectionTitle: String, subCollectionTitle: String, uploadData: [String:Any], completion: @escaping(_ status : Bool, _ err : String?)->() ){
        
        
        let collectionRef = dbRef.collection(collectionTitle).document(userId!).collection(subCollectionTitle).document()
        
        var temp = uploadData
        
        temp["id"] = collectionRef.documentID
        
        
        collectionRef.setData(temp) { (err) in
            
            if err == nil{
                
                completion(true, nil)
            }else{
                completion(false, err?.localizedDescription)
            }
        }
    
        
    }
    
    
    
    //MARK: GET USER
    
    func GetUser(collectionTitle: String, completion: @escaping(_ status : Bool,_ getData : User? ,_ err : String?)->() ){
        
        
       
            
            
         
            
            dbRef.collection(collectionTitle).document(userId!).getDocument { (snapShot, err) in
                
                if err == nil{
                    
                    guard let value = snapShot?.data() else{return}
                    
                    
                    
                    let fetchData = try! FirestoreDecoder().decode(User.self, from: value)
                    
                   
                    

                    
                    
                    completion(true, fetchData, nil)
                    
                    
                }else{
                    completion(false, nil, err?.localizedDescription)
                }
            }
            
        
        
        
        
        
        
    }

    
    
    //MARK: GET COLLECTION
    
    func GetCollection<T: Decodable>(collectionTitle: String, subCollectionTitle: String, completion: @escaping(_ status : Bool,_ getData : [T] ,_ err : String?)->() ){
        
        
        if subCollectionTitle !=  ""{
            
            
            var fetchData = [T]()
            
            dbRef.collection(collectionTitle).document(userId!).collection(subCollectionTitle).getDocuments { (snapShot, err) in
                
                if err == nil{
                    
                    guard let data = snapShot?.documents else{return}
                    
                    
                    data.forEach { (value) in
                        
                        let temp = try! FirestoreDecoder().decode(T.self, from: value.data())
                        fetchData.append(temp)
                    }
                    

                    
                    
                    completion(true, fetchData, nil)
                    
                    
                }else{
                    completion(false, [], err?.localizedDescription)
                }
            }
            
        }else{
            dbRef.collection(collectionTitle).document(userId!).getDocument { (snapShot, err) in
                
                if err == nil{
                    
                    guard let data = snapShot?.data() else{return}

                    let fetchData = try! FirestoreDecoder().decode(T.self, from: data)
                    
                    completion(true, fetchData as! [T], nil)
                    
                    
                }else{
                    completion(false, [], err?.localizedDescription)
                }
            }
            

        }
        
        
        
        
        
    }
}

