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
    
    
//
//    let tempData = [Medicine]()
    @State  var selectedIndex = -1
    @State  var takenStatus = [Int]()
    @State  var skipStatus =  [Int]()
    
    let today = Date()
    let VM = FirebaseViewModel()
    @State var dateString = ""
    @State var weekOfYear = 0
    @State var monthOfYear = 0
    
    var body: some View {
        
        VStack(spacing: 10){
            
            
            //MARK: TOP PART
            
            Group{
            VStack{
                HStack{
                    
                    
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("back")
                            .imageScale(.large)
                            .padding()
                        
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
                            DayTimeView_Rect(image: "morning", title: "Morning", isSelected: isMorning)
                            
//                            VStack {
//                                Image("morning")
//                                    .resizable()
//                                    .frame(width: 50, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                                    .scaledToFit()
//                                Text(title)
//                                    .foregroundColor(isMorning ? .accentColor : Color.gray)
//
//                                Rectangle()
//                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                                    .foregroundColor(isSelected ? .accentColor : Color.clear)
//                            }
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
            }
            
            
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                
                
                
                ForEach(0..<medicineData.count, id:\.self){ i in
                    
                    
                    
                    
                    
                    if self.takenStatus.contains(i){
                        
                        DayReminderCellView(ImageTitle: medicineData[i].Apperance, MedicineTitle: medicineData[i].Title, Dose: "\(medicineData[i].Strength)\(medicineData[i].unit)", Time: "\((medicineData[i].notification.first)!)", status: "taken")
                            .shadow(radius: 3)
                            .padding(.bottom, 10).tag(medicineData[i].id)
                            .padding(.horizontal)

                    }
                    
                    
                    else if self.skipStatus.contains(i){

                        DayReminderCellView(ImageTitle: medicineData[i].Apperance, MedicineTitle: medicineData[i].Title, Dose: "\(medicineData[i].Strength)\(medicineData[i].unit)", Time: "\((medicineData[i].notification.first)!)", status: "skip")
                            .shadow(radius: 3)
                            .padding(.bottom, 10).tag(medicineData[i].id)
                            .padding(.horizontal)

                    }
                    
                    else{

                        ZStack{
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.white)
                                .frame(height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .shadow(radius: 2)
                            
                            VStack{
                            DayReminderCellView(ImageTitle: medicineData[i].Apperance, MedicineTitle: medicineData[i].Title, Dose: "\(medicineData[i].Strength)\(medicineData[i].unit)", Time: "\((medicineData[i].notification.first)!)", status: "")
                                .padding(.bottom, 10).tag(medicineData[i].id)
                                .padding(.horizontal)
                                
                                
                                Rectangle()
                                    .fill(Color.gray)
                                    .frame(height:1)
                                Spacer()
                                
                                HStack{
                                    Button(action:{
                                        self.selectedIndex = i
                                        self.skipAction()
                                    }, label:{
                                        Image("skip_1")
                                            .resizable()
                                            .frame(width: 70, height: 36, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    })
                                    Button(action:{
                                        self.selectedIndex = i
                                        self.takenAction()
                                    }, label:{
                                        Image("take")
                                            .resizable()
                                            .frame(width: 70, height: 26, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    })
                                    Button(action:{}, label:{
                                        Image("snooze")
                                            .resizable()
                                            .frame(width: 70, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    })
                                    Button(action:{}, label:{
                                        Image("reschedule")
                                            .resizable()
                                            .frame(width: 100, height: 26, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    })
                                }
                            }
                        }.padding(.horizontal)
                        .padding(.bottom, 10)
                        
                       
                        
                        
                      
                    }
                    
                    
                    
                }
  
            }
            
         
            Spacer()
            
        }
        .navigationBarHidden(true)
        .onAppear(perform: {
            
            let d_Formattor = DateFormatter()
            d_Formattor.dateFormat = "dd-MMM"
//            d_Formattor.dateStyle = .short
            self.dateString = d_Formattor.string(from: today)
            
            let calendar = Calendar.current
            let week = calendar.component(.weekOfYear, from: Date.init(timeIntervalSinceNow: 0))
            let month = calendar.component(.month, from: Date.init(timeIntervalSinceNow: 0))
            
            print(week)
            print(month)
            
            weekOfYear = week
            monthOfYear = month
            
          
            
            print(self.dateString)
            
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
                        

                        
                        print(totalStock)
                        //DOSE
                        
                        VM.GetDoseStatus { (status, Detail:[Dose], err )in
                            
                            if status{
                                Detail.forEach { Dose in
                                    
                                    
                           
                                    
                                    print("taken:\(takenCount)")
                                    print("Skip:\(skipCount)")
                                    
                                    if Dose.dateInfo == self.dateString{
                                    if Dose.status == "Taken"{
                                        
                                        let Index = self.medicineData.firstIndex { Medicine in
                                            
                                            
                                            if Medicine.id == Dose.MedicineID!{
                                                print("found")
                                                todayTakenCount += 1
                                                return true
                                            }else{
                                                return false
                                            }
                                        }
                                        
                                        
                                        
                                        if let value = Index  {
                                            self.takenStatus.append(value)
                                        }
                                        
                                    }
                                    
                                    else  if Dose.status == "Skip"{
                                        
                                        let Index = self.medicineData.firstIndex { Medicine in
                                            
                                            
                                            if Medicine.id == Dose.MedicineID!{
                                                print("found")
                                                todaySkipCount += 1
                                                return true
                                            }else{
                                                return false
                                            }
                                        }
                                        
                                        
                                        
                                        if let value = Index  {
                                            self.skipStatus.append(value)
                                        }
                                        
                                    }
                                    
                                }
                                }
                            }
                        }
                        
                    }else{
                        print("\(err!)")
                    }
                    
                }
                
                
            }
   
        })
        .preferredColorScheme(.light)
        .background(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
    
    
    
    //MARK: TAKEN ACTION
    func takenAction(){
        print("TAKEN")
        
        print(medicineData[self.selectedIndex].Title)
        
        
        //*SKIP*
        let skipIndex = self.takenStatus.firstIndex(of: self.selectedIndex)
        
        print(skipIndex)
        
        if let value = skipIndex{
            print("remove \(value)")
            
            self.skipStatus.remove(at: value)
        }
        
        
        //*TAKEN*
        let takenIndex = self.takenStatus.firstIndex(of: self.selectedIndex)
        
        print(takenIndex)
        
        if let value = takenIndex{
            print("remove \(value)")
            
            self.takenStatus.remove(at: value)
        }else{
            print("added")
            self.takenStatus.append(self.selectedIndex)
        }
   
        let dict  = [ "id" : "\(self.dateString)-taken-\(medicineData[self.selectedIndex].id)",
         "MedicineID" : medicineData[self.selectedIndex].id,
         "dateInfo" : self.dateString,
        "status" : "Taken",
        "week":weekOfYear,
        "month":monthOfYear]  as [String: Any]
        
        VM.CreateDoseStatus(docName: "\(self.dateString)-Taken-\(medicineData[self.selectedIndex].id)", docName_del: "\(self.dateString)-Skip-\(medicineData[self.selectedIndex].id)", uploadData: dict) { status, err in
            
            if status{
                
            }else{
                print(err!)
            }
        }
        
        
        
    }
    
    
    //MARK: SKIP ACTION
    func skipAction(){
        print("SKIP")
        
        let TakenIndex = self.takenStatus.firstIndex(of: self.selectedIndex)
        
        print(TakenIndex ?? -1)
        
        if let value = TakenIndex{
            print("remove \(value)")
            
            self.takenStatus.remove(at: value)
        }
        
        
        //*TAKEN*
        let skipIndex = self.takenStatus.firstIndex(of: self.selectedIndex)
        
        print(skipIndex ?? -1)
        
        if let value = skipIndex{
            print("remove \(value)")
            
            self.skipStatus.remove(at: value)
        }else{
            print("added")
            self.skipStatus.append(self.selectedIndex)
        }
        
        let dict  = [ "id" : "\(self.dateString)-Skip-\(medicineData[self.selectedIndex].id)",
         "MedicineID" : medicineData[self.selectedIndex].id,
         "dateInfo" : self.dateString,
        "status" : "Skip",
        "week":weekOfYear,
        "month":monthOfYear]  as [String: Any]
        
        VM.CreateDoseStatus(docName: "\(self.dateString)-Skip-\(medicineData[self.selectedIndex].id)", docName_del: "\(self.dateString)-Taken-\(medicineData[self.selectedIndex].id)", uploadData: dict) { status, err in
            
            if status{
                
            }else{
                print(err!)
            }
        }
        
    }
    
    
    //MARK: TAKEN ACTION
    func snoozeAction(){}
    
    
    //MARK: TAKEN ACTION
    func rescheduleAction(){}
    
    
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
                .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .scaledToFit()
            Text(title)
                .foregroundColor(isSelected ? .accentColor : Color.gray)
            
            Rectangle()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(isSelected ? .accentColor : Color.clear)
        }
    }
}


struct DayTimeView_Rect: View {
    
    var image: String
    var title: String
    var isSelected : Bool
    
    var body: some View {
        
        
        VStack {
            Image(image)
                .resizable()
                .frame(width: 50, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .scaledToFit()
            Text(title)
                .foregroundColor(isSelected ? .accentColor : Color.gray)
            
            Rectangle()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(isSelected ? .accentColor : Color.clear)
        }
    }
}


