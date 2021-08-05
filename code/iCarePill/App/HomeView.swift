//
//  HomeView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 22/03/2021.
//

import SwiftUI
import SDWebImageSwiftUI
import UserNotifications


var userDetail : User?

struct HomeView: View {
    
    
    @State var medicineData = [Medicine]()
    @State  var isNewEntry = false
    @State  var isDayReminder = false
    @State  var isActiveAlert = false
    @State  var userName = ""
    @State  var selectedIndex = -1
    
    
    
    @State  var takenStatus = [Int]()
    @State  var skipStatus = [Int]()
    
    
    let today = Date()
    let VM = FirebaseViewModel()
    @State var dateString = ""
    @State var weekOfYear = 0
    @State var monthOfYear = 0
    
    @State var selectedTime = "Morning"
    
    
    var body: some View {
        
        
        VStack{
            
            HStack{
                
                let imageurl  = URL(string: userDetail?.dp ?? "")
                
                WebImage(url: imageurl)
                    .placeholder(Image(uiImage: UIImage(named: "dp")!
                    ))
                    .resizable()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                    .clipShape(Circle())
                    .shadow(radius: 3)
                    .padding()
                
                VStack(alignment:.leading){
                    Text("Hello, \(userName)!")
                        .font(.custom("Poppins-Medium", size: 18))
                    
                    
                    
                    Text("Good Morning")
                        .font(.custom("Poppins-Medium", size: 18))
                        .foregroundColor(.accentColor)
                    
                    
                    
                }
                Spacer()
                
                NavigationLink(
                    destination: AddMedicineView(),
                    isActive: $isNewEntry,
                    label: {
                        Button(action: {
                            isNewEntry.toggle()
                        }, label: {
                            Image("add_button")
                                .padding(.trailing)
                        })
                    })
                
            }.background(
                Rectangle()
                    .foregroundColor(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
                    .shadow(radius: 6 )
                    .frame(height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(.all)
                
            )
            .padding(.bottom, 30)
            
            
            
            NavigationLink(
                destination: DayReminderView(dateValue: .constant(Date()), selectedTime: $selectedTime),
                isActive: $isDayReminder,
                label: {
              
                        VStack{
                            
                            HStack{
                                
                                Button(action: {
                                    selectedTime = "Morning"
                                    isDayReminder.toggle()
                                }, label: {
                                HomeCenterButtonView(imageName: "morning", title: " Morning")
                                })
                                
                                Button(action: {
                                    selectedTime = "Afternoon"
                                    isDayReminder.toggle()
                                }, label: {
                                HomeCenterButtonView(imageName: "sun", title: " Afternoon")
                            })
                            }
                            
                            HStack{
                                Button(action: {
                                    selectedTime = "Evening"
                                    isDayReminder.toggle()
                                }, label: {
                                HomeCenterButtonView(imageName: "evening", title: " Evening")
                                })
                                
                                Button(action: {
                                    selectedTime = "Night"
                                    isDayReminder.toggle()
                                }, label: {
                                HomeCenterButtonView(imageName: "moon", title: " Night")
                                })
                                
                            }
                            
                            
                            
                        }
                    
                   
                })
            
            
            
            
            
            VStack(alignment:.leading){
                
                Text("My Medicines")
                    .font(.custom("Poppins-Medium", size: 18))
                    .foregroundColor(.black)
                    .padding()
                
                
                
                
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                    LazyVStack{
                        ForEach(0..<medicineData.count, id:\.self){ i in
                            
                            
                            Button(action: {
                                isActiveAlert.toggle()
                                
                                self.selectedIndex = i
                                
                            }, label: {
                                
                                
                                
                                if self.takenStatus.contains(i){
                                    HomeCellView(ImageTitle: medicineData[i].Apperance, MedicineTitle: medicineData[i].Title, Dose: "\(medicineData[i].Strength)\(medicineData[i].unit)", Time: "\((medicineData[i].notification.first)!)", status: "taken")
                                        .padding(.bottom, 10).tag(medicineData[i].id)
                                }
                                
                                
                                else if self.skipStatus.contains(i){
                                    HomeCellView(ImageTitle: medicineData[i].Apperance, MedicineTitle: medicineData[i].Title, Dose: "\(medicineData[i].Strength)\(medicineData[i].unit)", Time: "\((medicineData[i].notification.first)!)", status: "skip")
                                        .padding(.bottom, 10).tag(medicineData[i].id)
                                }
                                
                                else{
                                    HomeCellView(ImageTitle: medicineData[i].Apperance, MedicineTitle: medicineData[i].Title, Dose: "\(medicineData[i].Strength)\(medicineData[i].unit)", Time: "\((medicineData[i].notification.first)!)", status: "")
                                        .padding(.bottom, 10).tag(medicineData[i].id)
                                }
                            })
                            
                            
                            
                        }
                        
                    }
                    .padding()
                }
                
            }
            .background(
                Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1))
            )
            Spacer()
        }.navigationBarHidden(true)
        .onAppear(){
            
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
            
            
            //USER
            VM.GetUser(collectionTitle: "Users") { (status, details, err) in
                
                if status{
                    userDetail = details
                    
                    
                    userName = (details!.first)!
                }else{
                    print("\(err!)")
                }
                
            }
            
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
            
            
            self.medicineNotification()
            
        }
        
        .actionSheet(isPresented: $isActiveAlert) { () -> ActionSheet in
            
            let takenButton = ActionSheet.Button.default(Text("Taken")) {
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
            let skipButton = ActionSheet.Button.default(Text("Skip")) {
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
            
            
            let cancelButton = ActionSheet.Button.cancel()
            return ActionSheet(title: Text("Action"), message: nil, buttons: [takenButton, skipButton, cancelButton])
            
            
        }
        
        
        
    }
    
    func medicineNotification(){
        
        //********** 1. User Permission
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { status, err in
        }
        
        //************ 2. Create the notification Content
        let content = UNMutableNotificationContent()
        content.title = "iCarePill Remind"
        content.body = "Welcome"
        
        //************* 3. Trigger
        let date = Date().addingTimeInterval(20)
        
        let dateComponent = Calendar.current.dateComponents([.month,.day,.hour,.minute], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        
        //********* 4. Create Request
        
        let uuidString = UUID().uuidString
        let request  = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // 5. register Notification
        
        center.add(request) { (err) in
            // Check the error
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HomeCenterButtonView: View {
    
    var imageName : String
    var title : String
    
    var body: some View {
        
        VStack{
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
                    .frame(width: 150, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 1 )
                
                VStack{
                    Image(imageName)
                    Text(title)
                        .font(.custom("Poppins-Medium", size: 18))
                        .foregroundColor(.black)
                }
                
            }
            
            
        }
        .padding()
    }
}

struct HomeCellView: View {
    
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
                    .frame(height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 3)
                
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
                
                
            }
        }.preferredColorScheme(.light)
    }
}
