//
//  SignUpView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 17/03/2021.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.presentationMode) var presentationModel
    
    @State  var firstNameTF  = ""
    @State  var lastNameTF  = ""
    @State  var typeIndex  = 0
    @State  var userTypeTF  = "US"
    @State  var gender  = ""
    @State  var birthDate  = ""
    @State  var zipCode  = ""
    
    @State  var isType  = false
    @State  var isExpand  = false
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
                        
                    }, label: {
                        Text("Skip")
                            .font(.custom("Poppins-Regular", size: 13))
                            .foregroundColor(.white)
                    })
                }
                .padding(.top, 10)
                .padding()
                
                Image("dp")
                  .resizable()
                  .frame(width: 150, height: 150, alignment: .center)
                  .clipShape(Circle())
                    .zIndex(1)
                    
                  
                ScrollView{
                    
                    
                VStack{
                    InputFieldView(imageName: "user", title: "First Name", inputTF: firstNameTF, PlaceHolder: "FIRST NAME")
                
                    InputFieldView(imageName: "user", title: "Last Name", inputTF: lastNameTF, PlaceHolder: "LAST NAME")
                    
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
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .shadow(radius: 1)
                                )
                        
                        .foregroundColor(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
                        
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    
                    
                    InputFieldView(imageName: "calendar", title: "Birth Date", inputTF: lastNameTF, PlaceHolder: "date")
                    
                    InputFieldView(imageName: "zip", title: "Zip Code", inputTF: lastNameTF, PlaceHolder: "zip code")
                    
                    Button(action: {
                        
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
                    
                }
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        
                        .foregroundColor(.white)
                        .frame(height: 700, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .offset(y: -30))
                
               
            }// Main VStack end
   
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

struct InputFieldView: View {
    
    
    var imageName : String
    var title : String
    @State var inputTF : String
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
                
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 1))
            
            .foregroundColor(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
            
            
            
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
       
    }
}
