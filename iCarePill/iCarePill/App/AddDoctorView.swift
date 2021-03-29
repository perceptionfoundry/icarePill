//
//  AddDoctorView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 29/03/2021.
//

import SwiftUI

struct AddDoctorView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var dpImage: UIImage? = UIImage(named: "dp")
    @State var showImagePicker: Bool = false
    @State var nameValue = ""
    @State var specialityValue = ""
    @State var mobileNumberValue = ""
    @State var officeNumberValue = ""
    @State var locationValue = ""
  
    @State  var  isNext = false
    
    
    
    
    var body: some View {
        
        ScrollView{
            VStack{
            
       
                
                Image(uiImage:dpImage!)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 5 )
                
                Button("Edit") {
                    showImagePicker.toggle()
                }
                
                .font(.custom("Poppins-Medium", size: 16))
                .foregroundColor(.accentColor)
                .sheet(isPresented: $showImagePicker) {
                    ImagePickerView(sourceType: .photoLibrary) { (getImage) in
                        
                        self.dpImage = getImage
                    }
                }
                
                
            //MARK: NAME
            VStack(alignment: .leading){
                Text("Name")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.accentColor)
               
                HStack{
                    ZStack{
                    Rectangle()
                        .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                    
                  

                    HStack{
                        
                        TextField("Name", text: $nameValue)
                            .font(.custom("Poppins-Medium", size: 14))
                            .foregroundColor(.accentColor)
                            .padding()
                    
                  
                    }
                   
                    
                }
  
                    
                }
            }
            .padding(.bottom, 15)
            
         
            
            
                //MARK: SPECIALITY
                VStack(alignment: .leading){
                    Text("Speciality")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(.accentColor)
                   
                    HStack{
                        ZStack{
                        Rectangle()
                            .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                        
                      

                        HStack{
                            
                            TextField("Speciality", text: $specialityValue)
                                .font(.custom("Poppins-Medium", size: 14))
                                .foregroundColor(.accentColor)
                                .padding()
                        
                      
                        }
                       
                        
                    }
      
                        
                    }
                }
                .padding(.bottom, 15)
            
            
                //MARK: MOBILE NUMBER
                VStack(alignment: .leading){
                    Text("Mobile Number")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(.accentColor)
                   
                    HStack{
                        ZStack{
                        Rectangle()
                            .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                        
                      

                        HStack{
                            
                            TextField("Mobile Number", text: $mobileNumberValue)
                                .font(.custom("Poppins-Medium", size: 14))
                                .foregroundColor(.accentColor)
                                .padding()
                        
                      
                        }
                       
                        
                    }
      
                        
                    }
                }
                .padding(.bottom, 15)
               
                
                
                //MARK: OFFICE NUMBER
                VStack(alignment: .leading){
                    Text("Office Number")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(.accentColor)
                   
                    HStack{
                        ZStack{
                        Rectangle()
                            .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                        
                      

                        HStack{
                            
                            TextField("Office Number", text: $officeNumberValue)
                                .font(.custom("Poppins-Medium", size: 14))
                                .foregroundColor(.accentColor)
                                .padding()
                        
                      
                        }
                       
                        
                    }
      
                        
                    }
                }
                .padding(.bottom, 15)
                
                
                //MARK: LOCATION
                VStack(alignment: .leading){
                    Text("Location")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(.accentColor)
                   
                    HStack{
                        ZStack{
                        Rectangle()
                            .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                        
                      

                        HStack{
                            
                            TextField("location", text: $locationValue)
                                .font(.custom("Poppins-Medium", size: 14))
                                .foregroundColor(.accentColor)
                                .padding()
                        
                      
                        }
                       
                        
                    }
      
                        
                    }
                }
                .padding(.bottom, 15)
            
            Spacer()
                
                //MARK: Next Button
                
              
                        Button(action: {
                            
                            
                            presentationMode.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color(#colorLiteral(red: 0.2117647059, green: 0.3294117647, blue: 0.8156862745, alpha: 1)))
                                    .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding()
                                
                                Text("Save")
                                    .foregroundColor(.white)
                                    .font(.custom("Poppins-Medium", size: 16))
                                
                            }
                            
                        })
        }.padding()
    }
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
                            Text("Add Doctor")
                                .font(.custom("Poppins-Medium", size: 18))
                                .foregroundColor(.accentColor)
                           
                        }
                    }
                }
    }
    
}

struct AddDoctorView_Previews: PreviewProvider {
    static var previews: some View {
        AddDoctorView()
    }
}
