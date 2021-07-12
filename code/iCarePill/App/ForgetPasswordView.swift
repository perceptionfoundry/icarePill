//
//  ForgetPasswordView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 12/07/2021.
//

import SwiftUI

struct ForgetPasswordView: View {
    
    
    
    // MARK: Properties
    
    @Environment(\.presentationMode) var presetationMode
    var fbViewModel = FirebaseViewModel()
    @State var alertMsg = ""
    @State var isAlert = false
    @State var isSuccess = false
    
    @Environment(\.presentationMode) var presentationModel
    
    
    
 
    @State  var emailTF  = ""
  
    var body: some View {

                VStack{
               
                    VStack{
                    InputFieldView(imageName: "email", title: "Email Address", inputTF: $emailTF, PlaceHolder: "EMAIL ADDRESS")
                    
                   
                    Button(action: {
                      
                        FirebaseViewModel().ForgetPassword(Email: emailTF) { status, err in
                            
                            if status{
                                alertMsg = "Please check your inbox for reset step"
                                isSuccess = true
                               isAlert = true
                            }else{
                                alertMsg = err!
                               isAlert = true
                            }
                            
                        }
                        
                    }, label: {
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 240, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding()
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.custom("Poppins-Medium", size: 16))
                            
                        }
                        
                    })
                }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white)
                                    .frame(width: UIScreen.main.bounds.width * 0.95))
                    .alert(isPresented: $isAlert, content: {
                        
                        if isSuccess{
                            return Alert(title: Text("Success"), message: Text(alertMsg), dismissButton: .default(Text("OK"), action: {
                                presetationMode.wrappedValue.dismiss()
                            }))
                        }else{
                            return Alert(title: Text("Error"), message: Text(alertMsg), dismissButton: .default(Text("Dismiss")))
                        }
                        
               
                    })

   
                }
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        
                        .foregroundColor(.accentColor)
                        .frame(height: UIScreen.main.bounds.height * 1.125, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .offset(y: 0))
                
               
            }// Main VStack end
          
        
        
        
    }

struct ForgetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordView()
    }
}
