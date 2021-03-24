//
//  AddMedicineView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 23/03/2021.
//

import SwiftUI

struct AddMedicineView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var MedicationTitle = ""
    @State var isQRScanning = false
    var body: some View {
        
        ScrollView{
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20){
            
            //MARK: Medicine Title
                VStack(alignment: .leading){
                    Text("Medicine Name")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(.accentColor)
                   
                    HStack{
                    ZStack{
                        Rectangle()
                            .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                        
                        HStack {
                            Image("medi_tab")
                            
                            TextField("Medication Name", text: $MedicationTitle)
                                .font(.custom("Poppins-Medium", size: 14))

                        }
                        .padding()
                        
                       
                        
                    }
                     
                        Button(action: {
                            isQRScanning.toggle()
                        }, label: {
                            Image("qrcode")
                        })
                        
                    }
                }
                .sheet(isPresented: $isQRScanning, content: {
                    QRCodeReaderView(qrCodeValue: $MedicationTitle)
                })
            
            //MARK: Condition
            VStack(alignment: .leading){
                Text("What are you taking it for ? ")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.accentColor)
               
                HStack{
                ZStack{
                    Rectangle()
                        .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                    
                  
                        TextField("Condition", text: $MedicationTitle)
                            .font(.custom("Poppins-Medium", size: 14))
                            .padding()
                  
                    
                   
                    
                }
                 
               
                    
                }
            }
            
            
                
                //MARK: Appearance
                VStack(alignment: .leading){
                    
                    Text("Appearance")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(.accentColor)
                HStack{
                   
                    
                        
                    Button(action: {
                        
                    }, label: {
                        
                        AppearanceButtonView(imageTitle: "capsule")
                    })
                    
                    
                    Button(action: {
                        
                    }, label: {
                        
                        AppearanceButtonView(imageTitle: "tablet")
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        
                        AppearanceButtonView(imageTitle: "injection")
                    })
                            
                 
                         
                       
                            
                   
                    Spacer()
                }
                }
                
                
                
            //MARK: Strength & Unit
            HStack{
                VStack(alignment: .leading){
                    Text("Strength ")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(.accentColor)
                   
                    HStack{
                    ZStack{
                        Rectangle()
                            .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                        
                      
                            TextField("1", text: $MedicationTitle)
                                .font(.custom("Poppins-Medium", size: 14))
                                .padding()
                      
                        
                       
                        
                    }
                     
                   
                        
                    }
                }
                .padding(.trailing, 15)
                
                
                
                VStack(alignment: .leading){
                    Text("Unit")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(.accentColor)
                   
                    HStack{
                    ZStack{
                        Rectangle()
                            .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                        
                      
                            TextField("mg", text: $MedicationTitle)
                                .font(.custom("Poppins-Medium", size: 14))
                                .padding()
                      
                        
                       
                        
                    }
                     
                   
                        
                    }
                }
            }
        
    
            //MARK: DoE
            VStack(alignment: .leading){
                Text("DoE (Date of Expiration) ")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.accentColor)
               
                HStack{
                ZStack{
                    Rectangle()
                        .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                    
                  
                        TextField("Condition", text: $MedicationTitle)
                            .font(.custom("Poppins-Medium", size: 14))
                            .padding()
                  
                    
                   
                    
                }
                 
               
                    
                }
            }
            .padding(.bottom, 15)
            
            //MARK: Stock
            VStack(alignment: .leading){
                Text("Pill in stock ")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.accentColor)
               
                HStack{
                ZStack{
                    Rectangle()
                        .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                    
                  
                        TextField("1", text: $MedicationTitle)
                            .font(.custom("Poppins-Medium", size: 14))
                            .padding()
                  
                    
                   
                    
                }
                 
               
                    
                }
            }
            
            
            //MARK: Reminder
            VStack(alignment: .leading){
               
               
                HStack{
                ZStack{
                    Rectangle()
                        .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                    
                  
                       
                            
                    Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        Text("Refill Reminder")
                            .font(.custom("Poppins-Medium", size: 14))
                            .foregroundColor(.accentColor)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                    .padding()
                  
                    
                   
                    
                }
                 
               
                    
                }
            }
            
                Button(action: {
                    
               

                    
                }, label: {
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 30)
                            .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.custom("Poppins-Medium", size: 16))
                        
                    }
                    
                })
            
            
            Spacer()
        }.padding()
    }
        .background(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
        
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Image("back")
                                        .imageScale(.large)
                                }
        
        )
        .navigationBarTitleDisplayMode(.inline)
                .toolbar {
              
                    
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("Add Medicine")
                                .font(.custom("Poppins-Medium", size: 18))
                                .foregroundColor(.accentColor)
                           
                        }
                    }
                }
    }
    
}

struct AddMedicineView_Previews: PreviewProvider {
    static var previews: some View {
        AddMedicineView()
    }
}

struct AppearanceButtonView: View {
    
    var imageTitle: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .shadow(radius: 4)
            
            
            Image(imageTitle)
            
        }
    }
}
