//
//  AddAppointmentView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 26/03/2021.
//

import SwiftUI
import SDWebImageSwiftUI


var selectedDocInfo : Doctor?

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
    @State var reminderStatus = false

    @State var isDoctorSelector = false
    
    @State  var isTablet  = false
    @State  var isCapsule  = true
    @State  var isSyrup  = false
    
    @State  var isExpand  = false
    @State  var isExpand2  = false
    @State  var  isNext = false
    
   
    @State  var  isAlert = false
    @State  var  alertTitle = ""
    @State  var  alertMessage = ""
    
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
                            
                            
                            TextField("Appointment Title", text: $appointmentTitle)
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
                    
                    
                    NavigationLink(
                        destination: DoctorsView(),
                        isActive: $isDoctorSelector,
                        label: {
                            
                            Button(action: {
                                isDoctorSelector.toggle()
                            }, label: {
                                HStack {
                                    
                                    WebImage(url: (URL(string: selectedDocInfo?.image ?? "")))
                                        .placeholder(Image(uiImage: UIImage(named: "dp")!
                                        ))
                                        .resizable()
                                        .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                        .padding(.leading)
                                    Text(selectedDocInfo?.name ?? "")
                                            .foregroundColor(.accentColor)
                                            .font(.custom("Poppins-Medium", size: 14))
                                        .padding()
                                    Spacer()
                                    Image("arrow_next")
                                        .padding(.trailing)
                                }
                            })
                        })
                  
                    
                   
                  
                    
                   
                    
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
                        
                      
                           
                                
                        Toggle(isOn: $reminderStatus) {
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
        
    
                
            //MARK: Location
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
                        .frame(height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                    
                  
//                    
                        TextEditor(text: $NoteValue)
                            .foregroundColor(.accentColor)
                            .font(.custom("Poppins-Medium", size: 14))
                            .foregroundColor(.accentColor)
                            .padding()
                  
                    
                   
                    
                }
                 
               
                    
                }
            }
            
            
            
            
                
                //MARK: Next Button
                
              
                        Button(action: {
                            
                            
                            
                            if appointmentTitle.isEmpty == false && selectedDocInfo?.name.isEmpty == false &&  dateValue_String != "yyyy/mm/dd" && timeValue_String != "hh:mm" && locationValue.isEmpty == false && NoteValue.isEmpty == false{

                                let appointmentInfo = Appointment(Title: appointmentTitle, DoctorName: (selectedDocInfo?.name)!, DoctorID: (selectedDocInfo?.id)!, DoctorSpecialize: (selectedDocInfo?.speciality)!, DoctorImage:(selectedDocInfo?.image)!,Date: dateValue_String, Time: timeValue_String, Location: locationValue, Note: NoteValue, Reminder: reminderStatus)
                                let appointmentDict = appointmentInfo.getDict()

                                let firebaseVM = FirebaseViewModel()

                                firebaseVM.CreateCollection(collectionTitle: "Appointments", subCollectionTitle: "lists", uploadData: appointmentDict) { (status, err) in

                                    if status{

                                        presentationMode.wrappedValue.dismiss()
                                    }
                                    else{
                                        self.alertTitle = "Server Error!"
                                        self.alertMessage = "\(err ?? "unknown error")"
                                        isAlert.toggle()
                                    }
                                }
                            }else{

                                self.alertTitle = "Textfield Empty"
                                self.alertMessage = "Please assure all textfield are filled.."
                                isAlert.toggle()
                            }

                            
                            
                            
                            
                            
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
        
        .alert(isPresented: $isAlert, content: {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Dismiss")))
        })
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


