//
//  iCarePillApp.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 16/03/2021.
//

import SwiftUI
import Firebase

@main
struct iCarePillApp: App {
    
    init(){
        
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SignInView()
//            MainView()
        }
    }
}
