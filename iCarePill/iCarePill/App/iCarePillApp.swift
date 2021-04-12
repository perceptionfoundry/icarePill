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
    
    
    @AppStorage("Auth") var isAuth = false
    @AppStorage("UserId") var userId = ""
    
    
    var body: some Scene {
        WindowGroup {
            
            if !isAuth{
                SignInView()
                    .preferredColorScheme(.light)
                    .environment(\.colorScheme, .light)
            }else{
                MainView()
                    .onAppear(){
                        print(userId)
                    }
                    .preferredColorScheme(.light)
                    .environment(\.colorScheme, .light)
            }
            
//            AddAppointmentView()
                

        }
        
    }
}
