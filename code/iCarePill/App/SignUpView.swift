//
//  SignUpView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 17/03/2021.
//

import SwiftUI

struct SignUpView: View {
    
    
    
    // MARK: Properties
    
    
    var fbViewModel = FirebaseViewModel()
    @State var alertMsg = ""
    @State var isAlert = false
    
    @Environment(\.presentationMode) var presentationModel
    
    
    
    @State var showImagePicker: Bool = false
    @State var dpImage: UIImage? = UIImage(named: "dp")
    @State  var firstNameTF  = ""
    @State  var lastNameTF  = ""
    @State  var emailTF  = ""
    @State  var passwordTF  = PasswordValidationObj()
    @State  var typeIndex  = 0
    @State  var userTypeTF  = "self"
    @State  var gender  = "male"
    @State  var birthDate  = Date()
    @State  var zipCode  = ""
    
    @State  var isType  = false
    @State  var isExpand  = false
    
    @State  var isMale  = true
    @State  var isFemale  = false
    @State  var isOther  = false
    
    @State private var selectedtype = "Self"
    let type = ["Self", "Caregiver"]
    
    var body: some View {
        
    
            VStack{
                
                HStack(alignment:.center) {
                    Spacer()
                    Text("Create Profile")
                        .font(.custom("Poppins-Medium", size: 18))
                        .foregroundColor(.white)
                    
                    Spacer()
                    Button(action: {
                        presentationModel.wrappedValue.dismiss()
                    }, label: {
                        Text("Skip")
                            .font(.custom("Poppins-Regular", size: 13))
                            .foregroundColor(.white)
                    })
                }
                .padding(.top, 10)
                .padding()
                
                Image(uiImage: dpImage!)
                  .resizable()
                    .scaledToFill()
                  .frame(width: 150, height: 150, alignment: .center)
                  .clipShape(Circle())
                    .zIndex(1)
                    .onTapGesture {
                        showImagePicker.toggle()
                    }
                  
                ScrollView{
                    
                    
                VStack{
                    InputFieldView(imageName: "user", title: "First Name", inputTF: $firstNameTF, PlaceHolder: "FIRST NAME")
                
                    InputFieldView(imageName: "user", title: "Last Name", inputTF: $lastNameTF, PlaceHolder: "LAST NAME")
                    
                    InputFieldView(imageName: "email", title: "Email Address", inputTF: $emailTF, PlaceHolder: "EMAIL ADDRESS")
                    
                    
                    
                    VStack(alignment: .leading) {
                        
                        HStack{
                        Text("Password")
                            .font(.custom("Poppins-Regular", size: 13))
                            .padding(.leading, 10)
                        Spacer()
                        Text(passwordTF.error)
                            .font(.custom("Poppins-Medium", size: 10))
                            .foregroundColor(.red)
                            .padding(.horizontal)
                            
                            
                    }
                        
                        HStack{
                            
                            Image("password")
                               
                                .resizable()
                                .scaledToFill()
                                .foregroundColor(.accentColor)
                                .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            SecureField("PASSWORD", text: $passwordTF.pass)
                                .font(.custom("Poppins-Regular", size: 12))
                                .foregroundColor(.accentColor)
                                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .shadow(radius: 1))
                        
                        .foregroundColor(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
                        
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    
                    
                    
                    VStack(alignment: .leading) {
                        
                        Text("User Type")
                            .font(.custom("Poppins-Regular", size: 13))
                            .padding(.leading, 10)
                        
                        HStack{
                           
                            Image("user")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            

                            DisclosureGroup(selectedtype, isExpanded: $isExpand){
                                
                                VStack{
                                    ForEach(type, id:\.self){ value  in
                                        
                                        Text("\(value)")
                                            .foregroundColor(.accentColor)
                                            .padding(.bottom)
                                            .onTapGesture {
                                                self.selectedtype = value
                                                
                                                withAnimation{
                                                    self.isExpand.toggle()
                                                }
                                           
                                            }
                                        
                                    }
                                }
                            }.foregroundColor(.accentColor)
                            .font(.custom("Poppins-Regular", size: 13))
                           
                            
                            Spacer()
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .shadow(radius: 1)
                                )
                        
                        .foregroundColor(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
                        
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    
                    
                    
                    VStack(alignment: .leading) {
                        
                        Text("Gender")
                            .font(.custom("Poppins-Regular", size: 13))
                            .padding(.leading, 10)
                        
                        HStack{
                           
                            
                            HStack{
                                
                                
                                Button(action: {
                                    isMale = true
                                    isFemale = false
                                    isOther = false
                                    gender = "male"
                                }, label: {
                                ZStack{
                                    Circle()
                                        .stroke(Color(#colorLiteral(red: 0.2117647059, green: 0.3294117647, blue: 0.8156862745, alpha: 1)))
                                     
                                        .frame(width: 15, height: 15, alignment: .center)
                                    
                                    Circle()
                                        .foregroundColor(isMale ? .accentColor : .clear)
                                        .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }
                               
                            
                                    Text("Male")
                                        .font(.custom("Poppins-Regular", size: 13))
                                        .foregroundColor(.accentColor)
                                
                                })
                                    
                            }
                            Spacer()
                            HStack{
                                
                                
                                Button(action: {
                                    isMale = false
                                    isFemale = true
                                    isOther = false
                                    gender = "female"
                                }, label: {
                                ZStack{
                                    Circle()
                                        .stroke(Color(#colorLiteral(red: 0.2117647059, green: 0.3294117647, blue: 0.8156862745, alpha: 1)))
                                     
                                        .frame(width: 15, height: 15, alignment: .center)
                                    
                                    Circle()
                                        .foregroundColor(isFemale ? .accentColor : .clear)
                                        .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }
                               
                            
                                    Text("Female")
                                        .font(.custom("Poppins-Regular", size: 13))
                                        .foregroundColor(.accentColor)
                                
                                })
                                    
                            }
                            Spacer()
                            HStack{
                                
                                
                                Button(action: {
                                    isMale = false
                                    isFemale = false
                                    isOther = true
                                    gender = "other"
                                }, label: {
                                ZStack{
                                    Circle()
                                        .stroke(Color(#colorLiteral(red: 0.2117647059, green: 0.3294117647, blue: 0.8156862745, alpha: 1)))
                                     
                                        .frame(width: 15, height: 15, alignment: .center)
                                    
                                    Circle()
                                        .foregroundColor(isOther ? .accentColor : .clear)
                                        .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                }
                               
                            
                                    Text("Other")
                                        .font(.custom("Poppins-Regular", size: 13))
                                        .foregroundColor(.accentColor)
                                
                                })
                                    
                            }
                            
                        
     
                           
                        }
                        .padding()
                       
                        
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    
                    VStack(alignment: .leading) {
                        
                        Text("Birth Date")
                            .font(.custom("Poppins-Regular", size: 13))
                            .padding(.leading, 10)
                        
                        HStack{
                           
                            Image("calendar")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            

                            DatePicker("", selection: $birthDate, displayedComponents: .date)
                                .padding(.trailing, 100)
                            
                            
                                .foregroundColor(.black)

                           
                            
                            Spacer()
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .shadow(radius: 1)
                                )
                        
                        .foregroundColor(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
                        
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)

                    

                    
                    InputFieldView(imageName: "zip", title: "Zip Code", inputTF: $zipCode, PlaceHolder: "zip code")
                    
                    Button(action: {
                        
                   
                        let Formattor = DateFormatter()
                        Formattor.dateStyle = .medium
                        
                      let dob_string = Formattor.string(from: birthDate)
                        
                       
                        
                        let inputDetail = [ "first": firstNameTF,
                                            "last": lastNameTF,
                                            "type": userTypeTF,
                                            "gender": gender,
                                            "dob": dob_string,
                                            "zip": zipCode,
                                            "dp":dpImage!] as [String : Any] 
                        
                        print(inputDetail)
                        
                        fbViewModel.signUpWithEmail(Email: emailTF, Password: passwordTF.pass, userDetail: inputDetail) { (status, err) in
                            
                            if status{
                                presentationModel.wrappedValue.dismiss()
                            }else{
                                
                                isAlert.toggle()
                                self.alertMsg = err!
                              
                                
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
                        
                    }).alert(isPresented: $isAlert, content: {
                        
                        Alert(title: Text("Error"), message: Text(alertMsg), dismissButton: .default(Text("Dismiss")))
                    })

   
                }
                    
                }
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        
                        .foregroundColor(.white)
                        .frame(height: 700, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .offset(y: -30))
                
               
            }// Main VStack end
            .sheet(isPresented: $showImagePicker) {
                ImagePickerView(sourceType: .photoLibrary) { (getImage) in
                    
                    self.dpImage = getImage
                }
            }

        .background(
            Color.accentColor
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
            .navigationBarHidden(true)
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}


// MARK: Subview
struct InputFieldView: View {
    
    
    var imageName : String
    var title : String
    
    @Binding var inputTF : String
    
    var PlaceHolder : String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(title)
                .font(.custom("Poppins-Regular", size: 13))
                .padding(.leading, 10)
            HStack{
                
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                TextField(PlaceHolder, text: $inputTF)
                    .font(.custom("Poppins-Regular", size: 12))
                    .foregroundColor(.accentColor)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 1))
            
            .foregroundColor(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
            
            
            
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
       
    }
}
