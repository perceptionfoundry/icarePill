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
    @State var conditionValue = ""
    @State var isQRScanning = false
    @State private var selectedStrength = "1"
    let strengthValue = ["1", "2.5","5","7.5"]
    @State private var selectedUnit = "mg"
    let UnitValue = ["mg","g","IU","mcg","mcg/hr","mcg/ml","mEq","mg/cm2","mg/g","mL"]
    @State var DoE = Date()
    @State var stockValue = ""
    @State var reminderStatus = false
    @State var formType = ""

    let pub_tablet = NotificationCenter.default.publisher(for: .tablet)
    let pub_capsule = NotificationCenter.default.publisher(for: .capsule)
    let pub_injection = NotificationCenter.default.publisher(for: .injection)
    
    @State var isSearchBar = false
    @State  var isTablet  = false
    @State  var isCapsule  = true
    @State  var isSyrup  = false
    
    @State  var isExpand  = false
    @State  var isExpand2  = false
    @State  var  isNext = false
    
    @State  var  isAlert = false
    
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
    
                                Button( action:{
                                    isSearchBar.toggle()
                                }, label:{
                                    HStack {
                                        Image("medi_tab")
                                        
                                        Text(MedicationTitle)
                                            .font(.custom("Poppins-Medium", size: 14))
                                            .foregroundColor(.accentColor)
                                            
                                        Spacer()
                                    }
                                })
                                .padding()
                                .sheet(isPresented: $isSearchBar, content: {
                                    SearchbarView(selection: $MedicationTitle, strengthValue:$selectedStrength, unitValue:$selectedUnit, form: $formType)
                                })
                                

                    }
                     
                        
                        
                        
                        Button(action: {
                            isQRScanning.toggle()
                        }, label: {
                            Image("qrcode")
                        })
                        
                    }
                }
              

            
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
                    
                  
                        TextField("Condition", text: $conditionValue)
                            .foregroundColor(.accentColor)
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
                        isCapsule = true
                        isTablet = false
                        isSyrup = false
                        
                    }, label: {
                        
                        AppearanceButtonView(imageTitle: "capsule", isTick: isCapsule)
                    })
                    
                    
                    Button(action: {
                        isCapsule = false
                        isTablet = true
                        isSyrup = false
                    }, label: {
                        
                        AppearanceButtonView(imageTitle: "tablet", isTick: isTablet)
                    })
                    
                    Button(action: {
                        isCapsule = false
                        isTablet = false
                        isSyrup = true
                    }, label: {
                        
                        AppearanceButtonView(imageTitle: "syrup", isTick: isSyrup)
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

                        
                        VStack{
                        DisclosureGroup(selectedStrength, isExpanded: $isExpand) {
                            
                            VStack{
                                ForEach(strengthValue, id:\.self){ value  in
                                    
                                    Text("\(value)")
                                        .foregroundColor(.accentColor)
                                        .padding(.bottom)
                                        .onTapGesture {
                                            self.selectedStrength = value
                                            
                                            withAnimation{
                                                self.isExpand.toggle()
                                            }
                                       
                                        }
                                    
                                }
                            }
                        }.foregroundColor(.accentColor)
                        .font(.custom("Poppins-Medium", size: 13))
                        .padding()
                        .background(
                            Rectangle()
//                                .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                                .shadow(radius: 4)
                        )
                  
                    }


                }
                
                .padding(.trailing, 15)
                }
                
                VStack(alignment: .leading){
                    Text("Unit")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(.accentColor)
                   
                    HStack{

                        
                        VStack{
                            DisclosureGroup(selectedUnit, isExpanded: $isExpand2) {
                            
                            VStack{
                                ForEach(UnitValue, id:\.self){ value  in
                                    
                                    Text("\(value)")
                                        .foregroundColor(.accentColor)
                                        .padding(.bottom)
                                        .onTapGesture {
                                            self.selectedUnit = value
                                            
                                            withAnimation{
                                                self.isExpand2.toggle()
                                            }
                                       
                                        }
                                    
                                }
                            }
                        }.foregroundColor(.accentColor)
                        .font(.custom("Poppins-Medium", size: 13))
                        .padding()
                  
                    }
                        .background(
                            Rectangle()
//                                .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                                .shadow(radius: 4)
                        )

                }
                
                .padding(.trailing, 15)
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

                    HStack{
                        
                    DatePicker("", selection: $DoE, displayedComponents: .date)
                        .padding(.trailing, 100)
                    
                  
                    }
                   
                    
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
                    
                  
                        TextField("1", text: $stockValue)
                            .font(.custom("Poppins-Medium", size: 14))
                            .foregroundColor(.accentColor)
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
            
                
                //MARK: Next Button
                
                NavigationLink(
                    destination: ScheduleView(),
                    isActive: $isNext,
                    label: {
                        Button(action: {
                            
                            var appearanceValue = ""
                            
                            if isSyrup{
                                appearanceValue = "syrup"
                            } else if isTablet {
                                appearanceValue = "tablet"
                            }else if isCapsule{
                                appearanceValue = "capsule"
                            }
                            
                            
                            
                            let formattor = DateFormatter()
                            
                            formattor.dateFormat = "dd/MM/yyyy"
                           let dateString = formattor.string(from: DoE)
                            
                            
                            if MedicationTitle.isEmpty == false,conditionValue.isEmpty == false,stockValue.isEmpty == false{
                                
                                previousMediValue = Medicine(id: "", Title: MedicationTitle, Condition: conditionValue, Apperance: appearanceValue, Strength: Double(selectedStrength)!, unit: selectedUnit, DoE: dateString, Stock: Int(stockValue)!, reminder: reminderStatus, dosage: "", giveAt: "", days: [""], notification: [""])
                                
                            }else{
                                isAlert.toggle()
                            }
                            
                          
                            
                            
                            isNext.toggle()

                            
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
                    })
               
            
            
            Spacer()
            }
            .sheet(isPresented: $isQRScanning, content: {
//                QRCodeReaderView(qrCodeValue: $MedicationTitle)
                ScanDocumentView(recognizedText: self.$MedicationTitle, strengthValue:$selectedStrength, unitValue:$selectedUnit, form: $formType)
            })
            .padding()
            
            .alert(isPresented: $isAlert, content: {
                Alert(title: Text("Textfield Empty"), message: Text(" Please assure all fields are filled"), dismissButton: .default(Text("Dismiss")))
                
            })
            
            .onReceive(pub_tablet, perform: { _ in
                isCapsule = false
                isTablet = true
                isSyrup = false
            })
            .onReceive(pub_capsule, perform: { _ in
                isCapsule = true
                isTablet = false
                isSyrup = false
            })
            .onReceive(pub_injection, perform: { _ in
                isCapsule = false
                isTablet = false
                isSyrup = true
            })
          
    }
        .preferredColorScheme(.light)
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
    var isTick : Bool
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .shadow(radius: 4)
            
            
            Image(imageTitle)
            
        }.overlay(
        Image(isTick ? "tick" : "")
            .padding(.vertical, 5)
            .padding(.horizontal, 5)
            ,alignment: .topTrailing
        )
    }
}


extension Notification.Name{
    static let tablet = Notification.Name("tablet")
    static let capsule = Notification.Name("capsule")
    static let injection = Notification.Name("injection")
}
