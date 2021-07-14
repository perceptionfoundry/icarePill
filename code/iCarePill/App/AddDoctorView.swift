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
    @State  var  isAlert = false
    @State  var  isViewDisable = false
    @State  var  isSave = false
    @State  var  alertTitle = ""
    @State  var  alertMessage = ""
    
    let saveImageVM = SaveImageViewModel()
    
    
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
                                .keyboardType(.phonePad)
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
                                .keyboardType(.phonePad)
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
                            isSave = true
                            isViewDisable = true
                            
                            if dpImage != UIImage(named: "dp"){
                                
                                if nameValue.isEmpty == false && specialityValue.isEmpty == false &&
                                mobileNumberValue.isEmpty == false &&
                                officeNumberValue.isEmpty == false &&
                                    locationValue.isEmpty == false{
                                
                                saveImageVM.SaveImage(Title: "Doctor_\(nameValue)", selectedImage: dpImage!) { (imageUrl, status, err) in
                                    
                                    if status{
                                        
                                 
                                            let doctorInfo = Doctor(Name: nameValue, Speciality: specialityValue, Mobile: mobileNumberValue, Office: officeNumberValue, Location: locationValue, ImageURL: imageUrl!)
                                            
                                            let infoDict = doctorInfo.getDict()
                                            
                                            print(infoDict)
                                            
                                            let firebaseVM = FirebaseViewModel()
                                        
                                        firebaseVM.CreateCollection(collectionTitle: "Doctors", subCollectionTitle: "Physicians", uploadData: infoDict) { (status, fb_err) in
                                            
                                            if status{
                                                presentationMode.wrappedValue.dismiss()
                                            }else{
                                                self.alertTitle = "Server Error!"
                                                self.alertMessage = "\(fb_err ?? "unknown error")"
                                                isAlert.toggle()
                                                isSave = false
                                                isViewDisable = false

                                            }
                                        }
//
                                      
                                        
                                    }else{
                                        self.alertTitle = "Upload Image Error!"
                                        self.alertMessage = "\(err ?? "unknown error")"
                                        isAlert.toggle()
                                        isSave = false
                                        isViewDisable = false
                                    }
                                }
                                
                            }
                                
                                
                                else{
                                    self.alertTitle = "Textfield Empty"
                                    self.alertMessage = "Please assure all textfield are filled.."
                                    isAlert.toggle()
                                    isSave = false
                                    isViewDisable = false
                                    
                                }
                                
                            }else{
                                self.alertTitle = "Image Missing"
                                self.alertMessage = "Please add Doctor refers image"
                                isAlert.toggle()
                                isSave = false
                                isViewDisable = false
                                
                            }
                            
                           
                            
                            
                            
                            
                        }, label: {
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color(#colorLiteral(red: 0.2117647059, green: 0.3294117647, blue: 0.8156862745, alpha: 1)))
                                    .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding()
                                
                                Text("Save")
                                    .foregroundColor(.white)
                                    .font(.custom("Poppins-Medium", size: 16))
                                
                            }.overlay(
                                
                                ProgressView()
                                        .colorScheme(.dark)
                                        .padding(.trailing, 30)
                                    .opacity(isSave ? 1 : 0)

                                        , alignment: .trailing)
                            
                        })
        }.padding()
    }
        .allowsHitTesting(!isViewDisable)
        .alert(isPresented: $isAlert, content: {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Dismiss")))
        })
        .preferredColorScheme(.light)
        .background(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
//        .edgesIgnoringSafeArea(.bottom)
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
