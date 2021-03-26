//
//  AddAppointmentView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 26/03/2021.
//

import SwiftUI

struct AddAppointmentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var appointmentTitle = ""
    @State var conditionValue = ""
    @State var isQRScanning = false
    @State var timeValue = Date()
    @State var timeValue_String = "hh:mm"
    @State var dateValue = Date()
    @State var dateValue_String = "yyyy/mm/dd"
    
    
    @State var locationValue = ""
    @State var NoteValue = ""
    @State var calendarStatus = false

    
    
    @State  var isTablet  = false
    @State  var isCapsule  = true
    @State  var isSyrup  = false
    
    @State  var isExpand  = false
    @State  var isExpand2  = false
    @State  var  isNext = false
    
    
    
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20){
            
            //MARK: Medicine Title
                VStack(alignment: .leading){
                    Text("Title")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(.accentColor)
                   
                    HStack{
                    ZStack{
                        Rectangle()
                            .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                        
                        HStack {
                            
                            
                            TextField("Appoitment Title", text: $appointmentTitle)
                                .font(.custom("Poppins-Medium", size: 14))
                                .foregroundColor(.accentColor)

                        }
                        .padding()
                        
                       
                        
                    }
                     
                      
                        
                    }
                }
                .sheet(isPresented: $isQRScanning, content: {
                    QRCodeReaderView(qrCodeValue: $appointmentTitle)
                })
            
            //MARK: Select Doctor
            VStack(alignment: .leading){
                Text("Select Doctor")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.accentColor)
               
                HStack{
                ZStack{
                    Rectangle()
                        .frame(height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                    
                  
                    HStack {
                        
                        Image("sample")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .padding(.leading)
                        Text("Condition")
                                .foregroundColor(.accentColor)
                                .font(.custom("Poppins-Medium", size: 14))
                            .padding()
                        Spacer()
                        Image("arrow_next")
                            .padding(.trailing)
                    }
                  
                    
                   
                    
                }
                 
               
                    
                }
            }
            
                //MARK: Add to Calendar
                VStack(alignment: .leading){
                   
                   
                    HStack{
                    ZStack{
                        Rectangle()
                            .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                        
                      
                           
                                
                        Toggle(isOn: $calendarStatus) {
                            Text("Refill Reminder")
                                .font(.custom("Poppins-Medium", size: 14))
                                .foregroundColor(.accentColor)
                            
                            
                        }
                        .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                        .padding()
                      
                        
                       
                        
                    }
                     
                   
                        
                    }
                }
                
    
                
                
                
            //MARK: Date & Time
            HStack{
                
                //DATE
                
                Button(action: {
                    let vm = ShowDateOrTimeViewModel(time: $timeValue, time_String: $timeValue_String, date: $dateValue, date_String: $dateValue_String)
                    
                    vm.showDatePickerAlert()
                }, label: {
                    VStack(alignment: .leading){
                        Text("Date")
                            .font(.custom("Poppins-Medium", size: 16))
                            .foregroundColor(.accentColor)
                       
                        HStack{
                            ZStack{
                                Rectangle()
                                    .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.white)
                                    .shadow(radius: 4)
                                
                                HStack{
                                    Image("calendar_bold")
                                        .padding(.leading)
                                    Text(dateValue_String)
                                        .foregroundColor(.accentColor)
                                        .font(.custom("Poppins-Medium", size: 14))
                                        .padding()
                                }
                                
                               
                                
                            }
                             
                           
                                
                            }
                    
                    .padding(.trailing, 15)
                    }
                })
              
                
                
                
                //TIME
                
                Button(action: {
                    let vm = ShowDateOrTimeViewModel(time: $timeValue, time_String: $timeValue_String, date: $dateValue, date_String: $dateValue_String)
                    
                    vm.showTimePickerAlert()
                }, label: {
                    VStack(alignment: .leading){
                        Text("Time")
                            .font(.custom("Poppins-Medium", size: 16))
                            .foregroundColor(.accentColor)
                       
                                HStack{
                                    ZStack{
                                        Rectangle()
                                            .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .foregroundColor(.white)
                                            .shadow(radius: 4)
                                        
                                      
                                        HStack{
                                            Image("alarm")
                                                .padding(.leading)
                                            Text(timeValue_String)
                                                .foregroundColor(.accentColor)
                                                .font(.custom("Poppins-Medium", size: 14))
                                                .padding()
                                            Spacer()
                                        }
                                      
                                        
                                       
                                        
                                    }
                                     
                                   
                                        
                                    }
                            
                        
                    
                    .padding(.trailing, 15)
                    }
                })
               
               
            }
        
    
                
            //MARK: DoE
            VStack(alignment: .leading){
                Text("Add Location")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.accentColor)
               
                HStack{
                    ZStack{
                    Rectangle()
                        .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                    
                  
//                        TextField("Condition", text: $MedicationTitle)
//                            .font(.custom("Poppins-Medium", size: 14))
//                            .padding()
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
            
            //MARK:  NOTE
            VStack(alignment: .leading){
                Text("Add Notes ")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.accentColor)
               
                HStack{
                ZStack{
                    Rectangle()
                        .frame(height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                    
                  
                        TextField("Add Notes", text: $NoteValue)
                            .frame(height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .lineLimit(4)
                            .multilineTextAlignment(.leading)
                            .font(.custom("Poppins-Medium", size: 14))
                            .foregroundColor(.accentColor)
                            .padding()
                  
                    
                   
                    
                }
                 
               
                    
                }
            }
            
            
            
            
                
                //MARK: Next Button
                
              
                        Button(action: {
                            
                            
                            presentationMode.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color(#colorLiteral(red: 0.2117647059, green: 0.3294117647, blue: 0.8156862745, alpha: 1)))
                                    .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding()
                                
                                Text("Done")
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
                            Text("Add Appointment")
                                .font(.custom("Poppins-Medium", size: 18))
                                .foregroundColor(.accentColor)
                           
                        }
                    }
                }
    }
    
}

struct AddAppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAppointmentView()
    }
}
