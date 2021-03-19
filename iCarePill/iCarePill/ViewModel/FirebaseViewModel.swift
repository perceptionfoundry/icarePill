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
    
    func signUp(){
        
        let colletionID = dbRef.collection("Users").document().documentID
        
        
        print(colletionID)
        
        
        
    }
    
}

