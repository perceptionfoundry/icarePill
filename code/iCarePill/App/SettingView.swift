//
//  SettingView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 30/03/2021.
//

import SwiftUI
import Firebase
import StoreKit

struct SettingView: View {
    
    @Environment(\.presentationMode) var presentationMode
   
    
    @State var isGeneral = false
    @State var isPlace = false
    @State var isOpen = false
    @State var isLogin = false
    @State var isPasscode = false
    @State var islogout = false
    @State var isShare = false
    @State var isFeedback = false
    
    
    
    
    @AppStorage("Auth") var isAuth : Bool?
    @AppStorage("UserId") var userId : String?
    var body: some View {
        
        VStack{
           
           
             
            Form{
               
                
                // MARK: - SECTION : Settings
                Section(header: Text("Settings") .font(.custom("Poppins-Bold", size: 18))) {
                  
                    
                    NavigationLink(
                        destination: GeneralSettingView(),
                        isActive: $isGeneral,
                        label: {
                            
                            Button(action: {
                                isGeneral.toggle()
                            }, label: {
                                SettingFormCellView(iconName: "settings_small", title: "General Settings", isForwardIcon: false)
                            })
                        })
                  
                    
                    NavigationLink(
                        destination: Text("Option Up coming"),
                        isActive: $isPlace,
                        label: {
                            
                            Button(action: {
                                isPlace.toggle()
                            }, label: {
                            
                                SettingFormCellView(iconName: "location_small", title: "My Place", isForwardIcon: false)
                            }).disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                           
                        })
                    
                  
                    
                               
                }
                
                .foregroundColor(.accentColor)
                
                
                // MARK: - SECTION : Account
                Section(header: Text("Account") .font(.custom("Poppins-Bold", size: 18))) {
                  
                    
                    NavigationLink(
                        destination: SignUpView(),
                        isActive: $isOpen,
                        label: {
                            
                            Button(action: {
                                isOpen.toggle()
                            }, label: {
                            
                                SettingFormCellView(iconName: "user_small", title: "Open Account", isForwardIcon: false)
                               
                            })
                           
                        })
                    
                    
                    
                    
                    NavigationLink(
                        destination: SignInView(),
                        isActive: $isLogin,
                        label: {
                            
                            Button(action: {
                                isLogin.toggle()
                            }, label: {
                            
                                SettingFormCellView(iconName: "", title: "Log In", isForwardIcon: false)
                            })
                           
                        })
                    
                    
                    NavigationLink(
                        destination: PasscodeView(),
                        isActive: $isPasscode,
                        label: {
                            
                            Button(action: {
                                isPasscode.toggle()
                            }, label: {
                                SettingFormCellView(iconName: "", title: "Passcode", isForwardIcon: false)
                            })
                           
                        })
                    
                    
                               
                }
                .disabled(true)
                
                // MARK: - SECTION : General
                Section(header: Text("General") .font(.custom("Poppins-Bold", size: 18))) {
                  
                    Button(action: {
                        isShare.toggle()
                    }, label: {
                        SettingFormCellView(iconName: "share_small", title: "Share", isForwardIcon: false)
                    })
                   
                    Button(action: {
                        if let scene = UIApplication.shared.connectedScenes.first(where: {$0.activationState == .foregroundActive}) as? UIWindowScene{
                            SKStoreReviewController.requestReview(in: scene)
                        }
                    }, label: {
                        SettingFormCellView(iconName: "", title: "Rate App", isForwardIcon: false)

                    })
                    
                    NavigationLink(
                        destination: FeedbackView(),
                        isActive: $isFeedback,
                        label: {
                            Button(action: {
                                isFeedback.toggle()
                            }, label: {
                                SettingFormCellView(iconName: "", title: "Send Feedback", isForwardIcon: false)
                            })
                        })
                    
                    
                    SettingFormCellView(iconName: "", title: "About", isForwardIcon: false)
                    
                               
                }

               
                
              } .foregroundColor(.accentColor)
                
            
            
            
            //MARK: LOGOUT
            Button(action: {
                do {
                    try Auth.auth().signOut()
                    isAuth = false
                    userId = " "
                    islogout.toggle()
                    
                }catch{
                    print(error.localizedDescription)
                }
                
               
       
            }, label: {
                
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.red)
                        .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                    
                    Text("Log Out")
                        .bold()
                        .foregroundColor(.white)
                        .font(.custom("Poppins-Medium", size: 16))
                    
                }
                
            })
            .foregroundColor(.red)
            .fullScreenCover(isPresented: $islogout, content: {
            SignInView()
        })
              
           
    }
        .sheet(isPresented: $isShare, content: {
            ShareSheet(activityItems: ["App is not published on AppStore"])
        })
        .preferredColorScheme(.light)
        .background(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing:
        
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                   Text("Cancel")
                                }
        
        )
        .navigationBarTitleDisplayMode(.inline)
                .toolbar {
              
                    
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("Settings")
                                .font(.custom("Poppins-Medium", size: 18))
                                .foregroundColor(.accentColor)
                           
                        }
                    }
                }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

struct SettingFormCellView: View {
    
    var iconName:String
    var title : String
    var isForwardIcon : Bool
    
    var body: some View {
        HStack {
            Image(iconName)
                .resizable()
                .scaledToFill()
                .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.trailing)
            Text(title)
                .font(.custom("Poppins-Medium", size: 14))
                .foregroundColor(.black)
            Spacer()
            
            if isForwardIcon{
            Image("forward")
                .resizable()
                .frame(width: 5, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
    }
}
