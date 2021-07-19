//
//  GeneralSettingView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 30/03/2021.
//

import SwiftUI
import AudioToolbox.AudioServices

struct GeneralSettingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var isSound = false
    @State var isVibrate = false
    @State var isZone = false
    
    @State var isExpand = false
    @State var isExpand1 = false
    @State var isExpand2 = false
    @State var isExpand3 = false
    @State var isExpand4 = false
    
    let reminderValue = ["Snooze times", "popup","Snooze times","Snooze times, popup, max alarms"]
    @State var selectedReminder = "Snooze times, popup, max alarms"
    @State var selectedMorningReminder = "Snooze times, popup, max alarms"
    @State var selectedEveningReminder = "Snooze times, popup, max alarms"
    @State var selectedWeeklyReminder = "Snooze times, popup, max alarms"
    @State var selectedWeekendReminder = "Snooze times, popup, max alarms"
    
    
    
    var body: some View {
        
        VStack{
            
            
            
            Form{
                // MARK: - SECTION : Reminder
                Section(header: Text("Reminders") .font(.custom("Poppins-Bold", size: 18))) {
                    
                    
                    
                    //********** MEDIATION ***********
                    Button(action: {
                        
                    }, label: {
                        
                        HStack {
                            Image("alarm")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(.trailing)
                            
                            VStack(alignment:.leading){
                                Text("Medication Reminders")
                                    .font(.custom("Poppins-Medium", size: 14))
                                    .foregroundColor(.black)
                                
                                DisclosureGroup(selectedReminder, isExpanded: $isExpand) {
                                    
                                    VStack{
                                        ForEach(reminderValue, id:\.self){ value  in
                                            
                                            Text("\(value)")
                                                .foregroundColor(.accentColor)
                                                .font(.custom("Poppins-Medium", size: 14))
                                                .padding(.bottom)
                                                .onTapGesture {
                                                    self.selectedReminder = value
                                                    
                                                    let dict = ["Medication":selectedReminder,
                                                                "Morning": selectedMorningReminder,
                                                                "Evening":selectedEveningReminder,
                                                                "Weekly":selectedWeeklyReminder,
                                                                "Weekend":selectedWeekendReminder]
                                                    UserDefaults.standard.set(dict, forKey: "Reminder")
                                                    
                                                    withAnimation{
                                                        self.isExpand.toggle()
                                                    }
                                                    
                                                }
                                            
                                        }
                                    }
                                }
                                .font(.custom("Poppins-Medium", size: 10))
                                .foregroundColor(Color(.lightGray))
                                .padding(.bottom, 5)
                                
                            }
                            Spacer()
                            
                        }
                        
                    })
                    
                    
                    
                    
                    
                    //********** Morning ***********
                    Button(action: {
                        
                    }, label: {
                        
                        HStack {
                            Image("alarm")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(.trailing)
                            
                            VStack(alignment:.leading){
                                Text("Morning Reminders")
                                    .font(.custom("Poppins-Medium", size: 14))
                                    .foregroundColor(.black)
                                
                                DisclosureGroup(selectedMorningReminder, isExpanded: $isExpand1) {
                                    
                                    VStack{
                                        ForEach(reminderValue, id:\.self){ value  in
                                            
                                            Text("\(value)")
                                                .foregroundColor(.accentColor)
                                                .font(.custom("Poppins-Medium", size: 14))
                                                .padding(.bottom)
                                                .onTapGesture {
                                                    self.selectedMorningReminder = value
                                                    let dict = ["Medication":selectedReminder,
                                                                "Morning": selectedMorningReminder,
                                                                "Evening":selectedEveningReminder,
                                                                "Weekly":selectedWeeklyReminder,
                                                                "Weekend":selectedWeekendReminder]
                                                    UserDefaults.standard.set(dict, forKey: "Reminder")
                                                    
                                                    withAnimation{
                                                        self.isExpand1.toggle()
                                                    }
                                                    
                                                }
                                            
                                        }
                                    }
                                }
                                .font(.custom("Poppins-Medium", size: 10))
                                .foregroundColor(Color(.lightGray))
                                .padding(.bottom, 5)
                            }
                            Spacer()
                            
                        }
                        
                    })
                    
                    
                    
                    //********** Evening ***********
                    Button(action: {
                        
                    }, label: {
                        
                        HStack {
                            Image("alarm")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(.trailing)
                            
                            VStack(alignment:.leading){
                                Text("Evening Reminders")
                                    .font(.custom("Poppins-Medium", size: 14))
                                    .foregroundColor(.black)
                                
                                DisclosureGroup(selectedEveningReminder, isExpanded: $isExpand2) {
                                    
                                    VStack{
                                        ForEach(reminderValue, id:\.self){ value  in
                                            
                                            Text("\(value)")
                                                .foregroundColor(.accentColor)
                                                .font(.custom("Poppins-Medium", size: 14))
                                                .padding(.bottom)
                                                .onTapGesture {
                                                    self.selectedEveningReminder = value
                                                    let dict = ["Medication":selectedReminder,
                                                                "Morning": selectedMorningReminder,
                                                                "Evening":selectedEveningReminder,
                                                                "Weekly":selectedWeeklyReminder,
                                                                "Weekend":selectedWeekendReminder]
                                                    UserDefaults.standard.set(dict, forKey: "Reminder")
                                                    
                                                    withAnimation{
                                                        self.isExpand2.toggle()
                                                    }
                                                    
                                                }
                                            
                                        }
                                    }
                                }
                                .font(.custom("Poppins-Medium", size: 10))
                                .foregroundColor(Color(.lightGray))
                                .padding(.bottom, 5)
                            }
                            Spacer()
                            
                        }
                        
                    })
                    
                    
                    
                    //********** Weekly ***********
                    Button(action: {
                        
                    }, label: {
                        
                        HStack {
                            Image("alarm")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(.trailing)
                            
                            VStack(alignment:.leading){
                                Text("Weekly Summary")
                                    .font(.custom("Poppins-Medium", size: 14))
                                    .foregroundColor(.black)
                                
                                DisclosureGroup(selectedWeeklyReminder, isExpanded: $isExpand3) {
                                    
                                    VStack{
                                        ForEach(reminderValue, id:\.self){ value  in
                                            
                                            Text("\(value)")
                                                .foregroundColor(.accentColor)
                                                .font(.custom("Poppins-Medium", size: 14))
                                                .padding(.bottom)
                                                .onTapGesture {
                                                    self.selectedWeeklyReminder = value
                                                    let dict = ["Medication":selectedReminder,
                                                                "Morning": selectedMorningReminder,
                                                                "Evening":selectedEveningReminder,
                                                                "Weekly":selectedWeeklyReminder,
                                                                "Weekend":selectedWeekendReminder]
                                                    UserDefaults.standard.set(dict, forKey: "Reminder")
                                                    withAnimation{
                                                        self.isExpand3.toggle()
                                                    }
                                                    
                                                }
                                            
                                        }
                                    }
                                }
                                .font(.custom("Poppins-Medium", size: 10))
                                .foregroundColor(Color(.lightGray))
                                .padding(.bottom, 5)
                            }
                            Spacer()
                            
                        }
                        
                    })
                    
                    
                    
                    
                    //********** Weekend ***********
                    Button(action: {
                        
                    }, label: {
                        
                        HStack {
                            Image("alarm")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding(.trailing)
                            
                            VStack(alignment:.leading){
                                Text("Weekend Mode")
                                    .font(.custom("Poppins-Medium", size: 14))
                                    .foregroundColor(.black)
                                
                                DisclosureGroup(selectedWeekendReminder, isExpanded: $isExpand4) {
                                    
                                    VStack{
                                        ForEach(reminderValue, id:\.self){ value  in
                                            
                                            Text("\(value)")
                                                .foregroundColor(.accentColor)
                                                .font(.custom("Poppins-Medium", size: 14))
                                                .padding(.bottom)
                                                .onTapGesture {
                                                    self.selectedWeekendReminder = value
                                                    
                                                    let dict = ["Medication":selectedReminder,
                                                                "Morning": selectedMorningReminder,
                                                                "Evening":selectedEveningReminder,
                                                                "Weekly":selectedWeeklyReminder,
                                                                "Weekend":selectedWeekendReminder]
                                                    UserDefaults.standard.set(dict, forKey: "Reminder")
                                                    withAnimation{
                                                        self.isExpand4.toggle()
                                                    }
                                                    
                                                }
                                            
                                        }
                                    }
                                }
                                .font(.custom("Poppins-Medium", size: 10))
                                .foregroundColor(Color(.lightGray))
                                .padding(.bottom, 5)
                            }
                            Spacer()
                            
                        }
                        
                    })
                    
                    
                }
                .foregroundColor(.accentColor)
                
                
                
                
                // MARK: - SECTION : Notification
                Section(header: Text("Notification") .font(.custom("Poppins-Bold", size: 18))) {
                    
                    //********** Sound  ***********
                    Button(action: {
                        isSound.toggle()
                        let dict = ["sound":isSound,
                                    "vibrate": isVibrate,
                                    "zone":isZone,
                                    ]
                        UserDefaults.standard.set(dict, forKey: "Action")
                    }, label: {
                        
                        HStack {
                            
                            
                            Text("Sound")
                                .font(.custom("Poppins-Medium", size: 14))
                                .foregroundColor(.black)
                            Spacer()
                            
                            ZStack{
                                Rectangle()
                                    .stroke(Color(#colorLiteral(red: 0.2128868997, green: 0.3307233751, blue: 0.8132392764, alpha: 1)))
                                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Image(isSound ? "tick_selected" : "")
                                    .resizable()
                                    .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            }
                            
                        }
                        
                    })
                    
                    
                    //********** Sound  ***********
                    Button(action: {
                        isVibrate.toggle()
                        
                        let dict = ["sound":isSound,
                                    "vibrate": isVibrate,
                                    "zone":isZone,
                                    ]
                        UserDefaults.standard.set(dict, forKey: "Action")
                        
                        if isVibrate{
                            let tapticFeedback = UINotificationFeedbackGenerator()
                            tapticFeedback.notificationOccurred(.success)
//                            let generator = UIImpactFeedbackGenerator(style: .heavy)
//                                       generator.impactOccurred()
                          
                        }
                       
                    }, label: {
                        
                        HStack {
                            
                            
                            Text("Vibration")
                                .font(.custom("Poppins-Medium", size: 14))
                                .foregroundColor(.black)
                            Spacer()
                            
                            ZStack{
                                Rectangle()
                                    .stroke(Color(#colorLiteral(red: 0.2128868997, green: 0.3307233751, blue: 0.8132392764, alpha: 1)))
                                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Image(isVibrate ? "tick_selected" : "")
                                    .resizable()
                                    .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            }
                            
                        }
                        
                    })
                    
                    
                }
                .foregroundColor(.accentColor)
                
                
                
                
                // MARK: - SECTION : Time Zone Settings
                Section(header: Text("Time Zone Setting") .font(.custom("Poppins-Bold", size: 18))) {
                    
                    
                    
                    //********** Sound  ***********
                    Button(action: {
                        isZone.toggle()
                        let dict = ["sound":isSound,
                                    "vibrate": isVibrate,
                                    "zone":isZone,
                                    ]
                        UserDefaults.standard.set(dict, forKey: "Action")
                    }, label: {
                        
                        HStack {
                            
                            
                            Text("Automatic time zone selection")
                                .font(.custom("Poppins-Medium", size: 14))
                                .foregroundColor(.black)
                            Spacer()
                            
                            ZStack{
                                Rectangle()
                                    .stroke(Color(#colorLiteral(red: 0.2128868997, green: 0.3307233751, blue: 0.8132392764, alpha: 1)))
                                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Image(isZone ? "tick_selected" : "")
                                    .resizable()
                                    .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            }
                            
                        }
                        
                    })
                    
                    
                }
                .foregroundColor(.accentColor)
                
                
                // MARK: - SECTION : Measurements
                Section(header: Text("Measurements") .font(.custom("Poppins-Bold", size: 18))) {
                    
                    
                    
                    //********** Unit  ***********
                    Button(action: {
                        
                    }, label: {
                        
                        HStack {
                            
                            
                            Text("Unit")
                                .font(.custom("Poppins-Medium", size: 14))
                                .foregroundColor(.black)
                            Spacer()
                            
                            
                        }
                        
                    })
                    
                    
                    
                    
                    
                    
                    
                }
                .foregroundColor(.accentColor)
                
                
                
                
                
                
                
                
            } .foregroundColor(.accentColor)
            
            
        }
        .onAppear(){
            let temp = UserDefaults.standard.dictionary(forKey: "Reminder")
            
            guard let value = temp else{return}
            print(value)
            selectedReminder = value["Medication"] as! String
            selectedMorningReminder = value["Morning"] as! String
            selectedEveningReminder = value["Evening"] as! String
            selectedWeeklyReminder = value["Weekly"] as! String
            selectedWeekendReminder = value["Weekend"] as! String
            //
            
            let temp_action = UserDefaults.standard.dictionary(forKey: "Action")
            
            guard let value_action = temp_action else{return}
            
            isZone = value_action["zone"] as! Bool
            isSound = value_action["sound"] as! Bool
            isVibrate = value_action["vibrate"] as! Bool
            
        }
        .preferredColorScheme(.light)
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
                    Text("General Settings")
                        .font(.custom("Poppins-Medium", size: 18))
                        .foregroundColor(.accentColor)
                    
                }
            }
        }
        
    }
}

struct GeneralSettingView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingView()
    }
}
