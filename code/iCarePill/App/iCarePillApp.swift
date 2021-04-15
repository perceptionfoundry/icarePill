//
//  iCarePillApp.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 16/03/2021.
//

import SwiftUI
import Firebase
import GoogleSignIn
import FBSDKCoreKit

@main
struct iCarePillApp: App {
    
    
    
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    class AppDelegate: NSObject, UIApplicationDelegate, GIDSignInDelegate, ObservableObject {
        
        
        
     
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            print("Your code here")
            
            GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
            GIDSignIn.sharedInstance().delegate = self
            return true
        }
        
        
        
        
        @available(iOS 9.0, *)
        func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
          -> Bool {
            
            let google = GIDSignIn.sharedInstance().handle(url)
            
            let facebook =  ApplicationDelegate.shared.application(
                UIApplication.shared,
                open: url,
                sourceApplication: nil,
                annotation: [UIApplication.OpenURLOptionsKey.annotation]
            )
            
          return  google || facebook
        }
        
        
        func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
            // ...
            
          
            
            if  error == nil {
                // ...
                guard let authentication = user.authentication else { return }
                
                let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                               accessToken: authentication.accessToken)
                
                let VM = FirebaseViewModel()
                
                VM.SocialNetworkAuth(credential: credential) { (status) in
                    
                    if status{
                        
                    }else{
                        
                    }
                }
                
                
            }
                
            else{
               
                
            }
            
        }
    }
    
    
    
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
