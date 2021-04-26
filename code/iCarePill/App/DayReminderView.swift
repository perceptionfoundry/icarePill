//
//  DayReminderView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 26/04/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct DayReminderView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var medicineData = [Medicine]()
    @Binding var dateValue : Date
    @State var data : DateType!
    @State var calendarData = [DateType]()
    @State var year = false
    @State  var isNewEntry = false
    @State var count = 0
    @State var selectDate = 0
    @State var selectDay = ""
    @State var morningDrug = [Medicine]()
    @State var afternoonDrug = [Medicine]()
    @State var eveningDrug = [Medicine]()
    @State var nightDrug = [Medicine]()
    
    @State var isMorning = true
    @State var isAfternoon = false
    @State var isEvening = false
    @State var isNight = false
    
    
    
    let tempData = [Medicine]()
    
    @State  var takenStatus = [0]//[Int]()
    @State  var skipStatus =  [1]//[Int]()
    
    
    
    var body: some View {
        
        VStack(spacing: 10){
            
            
            //MARK: TOP PART
            
            VStack{
                HStack{
                    
                    
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("back")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .imageScale(.large)
                    }.padding(.leading, 20)
                    
                    Spacer()
                    Text("Reminders")
                        .foregroundColor(.accentColor)
                        .font(.custom("Poppins-Medium", size: 18))
                    
                    
                    
                    Spacer()
                    
                    
                }
                .padding(.top,60)
                .background(
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
                        .shadow(radius: 6 )
                        .frame(height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .edgesIgnoringSafeArea(.all)
                    
                )
                
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    
                    HStack(spacing: 10){
                        
                        Button(action: {
                            isMorning = true
                            isAfternoon = false
                            isEvening = false
                            isNight = false
                        }, label: {
                            DayTimeView(image: "morning", title: "Morning", isSelected: isMorning)
                        })
                        
                        
                        Button(action: {
                            
                            isMorning = false
                            isAfternoon = true
                            isEvening = false
                            isNight = false
                        }, label: {
                            DayTimeView(image: "sun", title: "Afternoon", isSelected: isAfternoon)
                        })
                        
                        Button(action: {
                            isMorning = false
                            isAfternoon = false
                            isEvening = true
                            isNight = false
                        }, label: {
                            DayTimeView(image: "evening", title: "Evening", isSelected: isEvening)
                        })
                        
                        Button(action: {
                            isMorning = false
                            isAfternoon = false
                            isEvening = false
                            isNight = true
                        }, label: {
                            DayTimeView(image: "moon", title: "Night", isSelected: isNight)
                        })
                        
                    }.padding(.horizontal)
                    .padding(.bottom)
                })
                .padding(.bottom, 30)
            }
            
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                
                
                
                ForEach(0..<medicineData.count, id:\.self){ i in
                    
                    
                    
                    
                    
                    if self.takenStatus.contains(i){
                        HomeCellView(ImageTitle: medicineData[i].Apperance, MedicineTitle: medicineData[i].Title, Dose: "\(medicineData[i].Strength)\(medicineData[i].unit)", Time: "\((medicineData[i].notification.first)!)", status: "taken")
                            .padding(.bottom, 10).tag(medicineData[i].id)
                            .padding(.horizontal)
                    }
                    
                    
                    else if self.skipStatus.contains(i){
                        HomeCellView(ImageTitle: medicineData[i].Apperance, MedicineTitle: medicineData[i].Title, Dose: "\(medicineData[i].Strength)\(medicineData[i].unit)", Time: "\((medicineData[i].notification.first)!)", status: "skip")
                            .padding(.bottom, 10).tag(medicineData[i].id)
                            .padding(.horizontal)
                    }
                    
                    else{
                                                    DayReminderCellView(ImageTitle: medicineData[i].Apperance, MedicineTitle: medicineData[i].Title, Dose: "\(medicineData[i].Strength)\(medicineData[i].unit)", Time: "\((medicineData[i].notification.first)!)", status: "")
//
                        
//
//                        VStack{
//
//                            ZStack{
//
//                                RoundedRectangle(cornerRadius: 12)
//                                    .foregroundColor(.white)
//                                    .frame(height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                                    .shadow(radius: 3)
//
//                                VStack{
//                                    HStack{
//                                        Image(medicineData[i].Apperance)
//                                            .resizable()
//                                            .scaledToFill()
//                                            .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//
//                                        VStack(alignment:.leading){
//                                            Text(medicineData[i].Title)
//                                                .font(.custom("Poppins-Medium", size: 12))
//                                                .foregroundColor(Color(#colorLiteral(red: 0.4979991317, green: 0.4980617762, blue: 0.4979779124, alpha: 1)))
//
//                                            Text("\(medicineData[i].Strength)\(medicineData[i].unit)")
//                                                .font(.custom("Poppins-Medium", size: 10))
//                                                .foregroundColor(Color(#colorLiteral(red: 0.6626930237, green: 0.662774384, blue: 0.6626655459, alpha: 1)))
//
//                                            Text("\((medicineData[i].notification.first)!)")
//                                                .font(.custom("Poppins-Medium", size: 10))
//                                                .foregroundColor(Color(#colorLiteral(red: 0.6626930237, green: 0.662774384, blue: 0.6626655459, alpha: 1)))
//
//
//
//                                        }
//
//                                        Spacer()
//
//                                        Image(status)
//                                    }.padding()
//
//                                    Rectangle()
//                                        .fill(Color.gray)
//                                        .frame(height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                                        .padding(.horizontal)
//
//                                    HStack{
//                                        Spacer()
//                                        Button(action: {
//
//                                        }, label: {
//
//                                            Image("cancel")
//                                            Text("Skip")
//                                                .font(.custom("Poppins-Medium", size: 12))
//                                                .foregroundColor(Color(#colorLiteral(red: 0.9449101686, green: 0.2611962855, blue: 0.2070304751, alpha: 1)))
//                                        })
//                                        Spacer()
//                                        Button(action: {
//
//                                        }, label: {
//
//
//                                            ZStack {
//                                                Circle()
//                                                    .fill(Color(#colorLiteral(red: 0, green: 0.6891491413, blue: 0.6618481874, alpha: 1)))
//                                                    .frame(width: 23, height: 23, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//
//                                                Image(systemName: "alarm")
//                                                    .resizable()
//                                                    .frame(width: 12, height: 12, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                                                    .foregroundColor(.white)
//                                            }
//
//                                            Text("Snooze")
//                                                .font(.custom("Poppins-Medium", size: 12))
//                                                .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6891491413, blue: 0.6618481874, alpha: 1)))
//                                        })
//                                        Spacer()
//
//                                        Button(action: {
//
//                                        }, label: {
//                                            Image("tick")
//                                            Text("Taken")
//                                                .font(.custom("Poppins-Medium", size: 12))
//                                                .foregroundColor(Color(#colorLiteral(red: 0, green: 0.7493677735, blue: 0.08691362292, alpha: 1)))
//
//                                        })
//                                        Spacer()
//                                        Button(action: {
//
//                                        }, label: {
//
//                                            ZStack {
//                                                Circle()
//                                                    .fill(Color(#colorLiteral(red: 1, green: 0.6175212264, blue: 0.04734752327, alpha: 1)))
//                                                    .frame(width: 23, height: 23, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//
//                                                Image(systemName: "alarm")
//                                                    .resizable()
//                                                    .frame(width: 12, height: 12, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                                                    .foregroundColor(.white)
//                                            }
//                                            Text("Reschedule")
//                                                .font(.custom("Poppins-Medium", size: 12))
//                                                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.6175212264, blue: 0.04734752327, alpha: 1)))
//
//                                        })
//
//                                        Spacer()
//                                    }
//                                    Spacer()
//                                }
//
//                            }.padding()
//                        }
//
                        .padding(.bottom, 10).tag(medicineData[i].id)
                    }
                    
                    
                    
                }
                
       
                
                
                
            }
            
            
            
            
            Spacer()
            
        }
        .navigationBarHidden(true)
        .onAppear(perform: {
            
            self.dateValue = Date()
            self.UpdateDate()
            for i in (1 ... 30){
                
                self.count = i
                
                self.newDate()
                
                
                
                let VM = FirebaseViewModel()
                
                
                
                
                //MEDICINE
                VM.GetCollection(collectionTitle: "Medicine", subCollectionTitle: "Stock") { (status, details : [Medicine], err) in
                    
                    if status{
                        
                        
                        medicineData = details
                    }else{
                        print("\(err!)")
                    }
                    
                }
                
                
            }
            
            
            
        })
        
        .background(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
    
    
    //MARK: NewDate
    func newDate(){
        self.dateValue = Calendar.current.date(byAdding: .day, value: 1, to: self.dateValue)!
        self.UpdateDate()
        
        
    }
    
    //MARK: UPDATE
    func UpdateDate(){
        
        
        print(self.dateValue)
        
        let current = Calendar.current
        
        let date = current.component(.day, from: self.dateValue)
        let monthNO = current.component(.month, from: self.dateValue)
        let month = current.monthSymbols[monthNO - 1]
        let year = current.component(.year, from: self.dateValue)
        let weekno = current.component(.weekday, from: self.dateValue)
        let day = current.shortWeekdaySymbols[weekno - 1]
        
        self.data = DateType(id: count, Day: day, Date: "\(date)", Year: "\(year)", Month: month)
        
        
        self.calendarData.append(self.data)
        
        
        if self.selectDay == ""{
            self.selectDay = day
            
            self.displayValue(dayName: self.selectDay)
        }
        
    }
    
    
    
    //MARK: DISPLAY VALUE
    func displayValue(dayName: String){
        
        self.morningDrug.removeAll()
        self.afternoonDrug.removeAll()
        self.eveningDrug.removeAll()
        self.nightDrug.removeAll()
        
        let vm = FirebaseViewModel()
        vm.GetSpecificCollection(collectionTitle: "Medicine", subCollectionTitle: "Stock", specificValue:dayName) { (status, details : [Medicine], err) in
            
            if status{
                
                details.forEach { (value) in
                    
                    print(value.Apperance)
                    
                    if value.giveAt == "Before Breakfast" || value.giveAt == "After Breakfast" {
                        morningDrug.append(value)
                    }else if value.giveAt == "Before Lunch" || value.giveAt == "After lunch" {
                        afternoonDrug.append(value)
                    }else if value.giveAt == "Before Dinner"{
                        eveningDrug.append(value)
                    }else if value.giveAt == "After Dinner"{
                        nightDrug.append(value)
                        
                    }
                }
            }else{
                print(err!)
            }
            
            
            
            
        }
    }
}

struct DayReminderView_Previews: PreviewProvider {
    static var previews: some View {
        DayReminderView(dateValue: .constant(Date()))
    }
}

struct DayTimeView: View {
    
    var image: String
    var title: String
    var isSelected : Bool
    
    var body: some View {
        
        
        VStack {
            Image(image)
                .resizable()
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .scaledToFit()
            Text(title)
                .foregroundColor(isSelected ? .accentColor : Color.gray)
            
            Rectangle()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(isSelected ? .accentColor : Color.clear)
        }
    }
}



struct DayReminderCellView: View {

    var ImageTitle: String
    var MedicineTitle : String
    var Dose : String
    var Time : String
    var status : String




    var body: some View {
        VStack{

            ZStack{

                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                    .frame(height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 3)

                VStack{
                    HStack{
                        Image(ImageTitle)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                        VStack(alignment:.leading){
                            Text(MedicineTitle)
                                .font(.custom("Poppins-Medium", size: 12))
                                .foregroundColor(Color(#colorLiteral(red: 0.4979991317, green: 0.4980617762, blue: 0.4979779124, alpha: 1)))

                            Text(Dose)
                                .font(.custom("Poppins-Medium", size: 10))
                                .foregroundColor(Color(#colorLiteral(red: 0.6626930237, green: 0.662774384, blue: 0.6626655459, alpha: 1)))

                            Text(Time)
                                .font(.custom("Poppins-Medium", size: 10))
                                .foregroundColor(Color(#colorLiteral(red: 0.6626930237, green: 0.662774384, blue: 0.6626655459, alpha: 1)))



                        }

                        Spacer()

                        Image(status)
                    }.padding()

                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 1, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal)

                    HStack{
                        Spacer()
                        Button(action: {

                        }, label: {

                            Image("cancel")
                            Text("Skip")
                                .font(.custom("Poppins-Medium", size: 12))
                                .foregroundColor(Color(#colorLiteral(red: 0.9449101686, green: 0.2611962855, blue: 0.2070304751, alpha: 1)))
                        })
                        Spacer()
                        Button(action: {

                        }, label: {


                            ZStack {
                                Circle()
                                    .fill(Color(#colorLiteral(red: 0, green: 0.6891491413, blue: 0.6618481874, alpha: 1)))
                                    .frame(width: 23, height: 23, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                                Image(systemName: "alarm")
                                    .resizable()
                                    .frame(width: 12, height: 12, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.white)
                            }

                            Text("Snooze")
                                .font(.custom("Poppins-Medium", size: 12))
                                .foregroundColor(Color(#colorLiteral(red: 0, green: 0.6891491413, blue: 0.6618481874, alpha: 1)))
                        })
                        Spacer()

                        Button(action: {

                        }, label: {
                            Image("tick")
                            Text("Taken")
                                .font(.custom("Poppins-Medium", size: 12))
                                .foregroundColor(Color(#colorLiteral(red: 0, green: 0.7493677735, blue: 0.08691362292, alpha: 1)))

                        })
                        Spacer()
                        Button(action: {

                        }, label: {

                            ZStack {
                                Circle()
                                    .fill(Color(#colorLiteral(red: 1, green: 0.6175212264, blue: 0.04734752327, alpha: 1)))
                                    .frame(width: 23, height: 23, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                                Image(systemName: "alarm")
                                    .resizable()
                                    .frame(width: 12, height: 12, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.white)
                            }
                            Text("Reschedule")
                                .font(.custom("Poppins-Medium", size: 12))
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.6175212264, blue: 0.04734752327, alpha: 1)))

                        })

                        Spacer()
                    }
                    Spacer()
                }

            }.padding()
        }
    }
}
