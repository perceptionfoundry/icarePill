//
//  ContentView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 16/03/2021.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var emailTF = EmailValidationObj()
    @ObservedObject var passwordTF = PasswordValidationObj()
    
    @State var isSignUp = false
    
    var body: some View {
        
        NavigationView{
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
        VStack(alignment:.center){
            
            HStack{
                
                VStack(alignment:.leading,spacing: 10){
                    Text("Welcome,")
                        .font(.custom("Poppins-SemiBold", size: 24))
                       
                    Text("Sign in to Continue!")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(Color(#colorLiteral(red: 0.5418370366, green: 0.5419180989, blue: 0.5418193936, alpha: 1)))
                }
                
                
                Spacer()
            } // HStack End ( welcome part)
            .padding()
            .padding(.horizontal)
            
            
            
            VStack{
                TF_View(isSecure: false, title: "Email ID", placeHolder: "Your Email Address", tf_value: $emailTF.email, err_msg: $emailTF.error)
                
                TF_View(isSecure: true, title: "Password", placeHolder: "Your Password", tf_value: $passwordTF.pass, err_msg: $passwordTF.error)
                    .padding(.top, 5)
                
                
                Button(action: {
                    
                }, label: {
                    Text("Forget Password?")
                        .font(.custom("Poppins-Medium", size: 12))
                        .foregroundColor(.accentColor)
                        .padding(.top)
                })
                
            }
            .padding(.top, 40)
            
            //MARK: SIGN IN BUTTON
            Button(action: {
                
            }, label: {
                
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding()
                    
                    Text("Sign In")
                        .foregroundColor(.white)
                        .font(.custom("Poppins-Medium", size: 16))
                    
                }
                
            })
            
            
            //MARK: SIGN UP BUTTON
            HStack{
                
                Text("I'm a new user,")
                    .font(.custom("Poppins-SemiBold", size: 13))
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
//
                NavigationLink(
                    destination: SignUpView(),
                    isActive: $isSignUp,
                    label: {
                        
                        Button(action: {
                            isSignUp.toggle()
                        }, label: {
                            Text("Sign Up")
                                .font(.custom("Poppins-SemiBold", size: 13))
                                .foregroundColor(.accentColor)
                        })
                        
                    })
             
                
                
            }.padding(.bottom, 40)
            
            //MARK: FACEBOOK BUTTON
            Button(action: {
                
            }, label: {
                
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(#colorLiteral(red: 0.9557608962, green: 0.9558982253, blue: 0.9557310939, alpha: 1)))
                        .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal)
                    
                    HStack {
                        
                        Image("facebook")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.trailing,10)
                    Text("Connect with Facebook")
                        .foregroundColor(.black)
                        .font(.custom("Poppins-Medium", size: 16))
                }
                    
                }
                
            })
            
            //MARK: GOOGLE BUTTON
            Button(action: {
                
            }, label: {
                
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(#colorLiteral(red: 0.9557608962, green: 0.9558982253, blue: 0.9557310939, alpha: 1)))
                        .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal)
                    
                    HStack {
                        
                        Image("google")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(.trailing,10)
                        Text("Connect with Google")
                            .foregroundColor(.black)
                            .font(.custom("Poppins-Medium", size: 16))
                    }
                    
                }
                
            })
            
            Spacer()
        }// Main VStack End
    }// ScrollView
        .padding(.horizontal)
        }
    }
}

//MARK: EMAIL VALIDATION
class EmailValidationObj: ObservableObject {
    @Published var email = "" {
        didSet {
            if self.email.isEmpty {
                self.error = "Required"
            } else if !self.email.isValidEmail() {
                self.error = "Invalid email"
            } else {
                self.error = ""
            }
        }
    }
    
    @Published var error = ""
}

//MARK: PASSWORD VALIDATION
class PasswordValidationObj: ObservableObject {
    @Published var pass = "" {
        didSet {
            self.isValidPassword()
        }
    }
    
    @Published var error = ""
    
    private func isValidPassword() {
        guard !self.pass.isEmpty else {
            self.error = "Required"
            return
        }
        
        let setPassError = self.pass.isPassword() == false
        
        if setPassError {
            if self.pass.count < 6 {
                self.error = "Must be at least 6 characters"
            } else if !self.pass.isUpperCase() {
                self.error = "Must contain at least one uppercase."
            } else if !self.pass.isLowerCase() {
                self.error = "Must contain at least one lowercase"
            } else if !self.pass.containsCharacter() {
                self.error = "Must contain at least one special character"
            } else if !self.pass.containsDigit() {
                self.error = "Must contain at least one digit"
            }
        } else {
            self.error = ""
        }
    }
}


//MARK: STRING EXTENSION
extension String {
    // TODO: Test cases
    func isValidEmail() -> Bool {
        let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}"
            + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
            + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
            + "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
            + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
            + "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
            + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"

        let emailValidation = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailValidation.evaluate(with: self)
    }
    
    
    
    
    func isPassword() -> Bool {
        let passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<]{6,}$"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        return passwordPred.evaluate(with: self)
    }
    
    func isUpperCase() -> Bool {
        let uppercaseReqRegex = ".*[A-Z]+.*"
        return NSPredicate(format:"SELF MATCHES %@", uppercaseReqRegex).evaluate(with: self)
    }
    
    func isLowerCase() -> Bool {
        let lowercaseReqRegex = ".*[a-z]+.*"
        return NSPredicate(format:"SELF MATCHES %@", lowercaseReqRegex).evaluate(with: self)
    }
    
    func containsCharacter() -> Bool {
        let characterReqRegex = ".*[!@#$%^&*()\\-_=+{}|?>.<]+.*"
        return NSPredicate(format:"SELF MATCHES %@", characterReqRegex).evaluate(with: self)
    }
    
    func containsDigit() -> Bool {
        let digitReqRegex = ".*[0-9]+.*"
        return NSPredicate(format:"SELF MATCHES %@", digitReqRegex).evaluate(with: self)
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}




struct TF_View: View {
    
    var isSecure : Bool
    var  title : String
    var  placeHolder : String
    @Binding var tf_value : String
    @Binding  var err_msg : String
    
    var body: some View {
        VStack(alignment:.leading){
            
            HStack {
                Text(title)
                    .font(.custom("Poppins-Medium", size: 12))
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                Spacer()
                Text(err_msg)
                    .font(.custom("Poppins-Medium", size: 10))
                    .foregroundColor(.red)
                    .padding(.horizontal)
            }
            
            
            VStack{
                
                if !isSecure{
                TextField(placeHolder, text: $tf_value)
                    .font(.custom("Poppins-Medium", size: 14))
                    .padding()
                    .padding(.horizontal)
                }else{
                    SecureField(placeHolder, text: $tf_value)
                        .font(.custom("Poppins-Medium", size: 14))
                        .padding()
                        .padding(.horizontal)
                }
                
                
                
            }.background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(#colorLiteral(red: 0.9180622697, green: 0.918194294, blue: 0.918033421, alpha: 1)))
                    .frame(height: 55, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.clear)
                
            )
            
        }
        .padding(.horizontal, 20)
    }
}
