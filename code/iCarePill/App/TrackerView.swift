//
//  trackerView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 22/03/2021.
//

import SwiftUI

struct TrackerView: View {
    
    @State var percent : CGFloat = 0.0
    @State var isWeek = true
    @State var isMonth = false
    @State var isAllTime = false
    
    @State var medicineData = [Medicine]()
    @State var displayData = [Medicine]()
    let today = Date()
    let VM = FirebaseViewModel()
    @State var dateString = ""
    @State var rangeString = ""
    @State var rangeDisplayTitle = "Weekly Details"
    
    
    @State  var takenStatus = [Int]()
    @State  var skipStatus = [Int]()
    
    @State var weekOfYear = 0
    @State var monthOfYear = 0
    @State var dayOfMonth = 0
    
    
    var body: some View {
       
        VStack(spacing: 10){
   
            
            //MARK: TOP PART
            VStack{
                Rectangle()
                    .foregroundColor(.accentColor)
                    .frame(height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                
                    .overlay(
                        VStack{
                        Text("Tracker")
                            .font(.custom("Poppins-Medium", size: 18))
                            .foregroundColor(.white)
                            .padding(.bottom, 15)
                            
                            
                            HStack(spacing: 20){
                                Spacer()
                                Button(action: {
                                    
                                    isWeek = true
                                    isMonth = false
                                    isAllTime = false
                                    
                                    self.displayValue()
                                    rangeDisplayTitle = "Weekly Details"
                                    
                                }, label: {
                                   
                                    Text("This week")
                                        .font(.custom("Poppins-Medium", size: 14))
                                        .foregroundColor(.white )
                                        .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(isWeek  ? Color.white : Color.clear)
                                            .foregroundColor(isWeek ? .white: .accentColor)
                                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        )
                                        
                                })
                                Spacer()
                                Button(action: {
                                    isWeek = false
                                    isMonth = true
                                    isAllTime = false
                                    
                                    self.displayValue()
                                    rangeDisplayTitle = "Monthly Details"
                                }, label: {
                                   
                                    Text("This Month")
                                        .font(.custom("Poppins-Medium", size: 14))
                                        .foregroundColor(.white)
                                        .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(isMonth  ? Color.white : Color.clear)
                                            .foregroundColor(isMonth ? .white: .accentColor)
                                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            
                                        )
                                        
                                })
                                Spacer()
                                Button(action: {
                                    isWeek = false
                                    isMonth = false
                                    isAllTime = true
                                    
                                    self.displayValue()
                                    rangeDisplayTitle = "All-Time Details"
                                }, label: {
                                   
                                    Text("All Time")
                                        .font(.custom("Poppins-Medium", size: 14))
                                        .foregroundColor(.white)
                                        .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(isAllTime  ? Color.white : Color.clear)
                                            .foregroundColor(.white)
                                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        )
                                        
                                })
                                Spacer()
                            }
          
                        }, alignment: .center)
                    
                
        }
            .onAppear(){
                
            }
          
          
            ScrollView{
                VStack{
            //MARK: GROUPBOX
            GroupBox{
                DisclosureGroup(
                    "All Medication")
                    {
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velesse cillumdolore eu fugiat nulla pariatur. Excepteur sint.")
                            .font(.custom("Poppins-Regular", size: 12))
                        
                    }
                
            }
            .padding()
            .font(.custom("Poppins-Medium", size: 16))
            .foregroundColor(.accentColor)
            
            //CIRCULAR PART
            
            HStack{
          
                VStack{
                    
                    ZStack{
                    
                        Circle()
                            .trim(from: 0.0, to: CGFloat(1))
                            .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color(#colorLiteral(red: 0.7022312284, green: 0.8690876365, blue: 0.7566004992, alpha: 1)))
                            .frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .shadow(color: Color("Button_Color"), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                            
                            .opacity(0.8)
                        
                        
      
                        Circle()
                            .trim(from: 0.0, to: CGFloat(self.percent))
                            .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.7959628105, blue: 0, alpha: 1)))
                            .frame(width: 120, height: 120, alignment: .top)
                            .rotationEffect(.degrees(-90))
                           
                        
                        
                      
                       let value = String(format: "%.2f", self.percent * 100)
                        
                        VStack{
                            Text("\(value)%")
                                .font(.custom("Poppins-Medium", size: 16))
                                .foregroundColor(Color(#colorLiteral(red: 0, green: 0.7959628105, blue: 0, alpha: 1)))
                            
                            
                            Text("Total Score")
                                .font(.custom("Poppins-Medium", size: 12))
                                .foregroundColor(Color(#colorLiteral(red: 0, green: 0.7959628105, blue: 0, alpha: 1)))
                        }
                   
                        
                        
                        
                    }
                    
                    
                    
                    Text("Excellent")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0.7959591746, blue: 0, alpha: 1)))
                    
                    Text("Keep going")
                        .font(.custom("Poppins-Medium", size: 10))
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                }
                .padding()
                
                Spacer()
                
                VStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.6525524259, blue: 0.1507192552, alpha: 1)))
                        .overlay(Text("On Time")
                                    .font(.custom("Poppins-Medium", size: 13))
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                    .padding(.leading)
                                    .padding(.top, 5),
                                 alignment: .topLeading)
                        .overlay(
                            HStack{
                                Text("\(takenCount)")
                                    .font(.custom("Poppins-Medium", size: 18))
                                
                            Text("/\(totalStock)")
                                .padding(.trailing, 10)
                                }
                                    .font(.custom("Poppins-Medium", size: 13))
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                    
                                    .padding(.bottom, 5),
                                 alignment: .bottomTrailing)
                        
                        .padding(.bottom)
                        
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.2723872066, blue: 0.4027544558, alpha: 1)))
                        .overlay(Text("Late")
                                    .font(.custom("Poppins-Medium", size: 13))
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                    .padding(.leading)
                                    .padding(.top, 5),
                                 alignment: .topLeading)
                    
                        .overlay(
                            HStack{
                                Text("\(skipCount)")
                                    .font(.custom("Poppins-Medium", size: 18))
                                
                            Text("/\(totalStock)")
                                .padding(.trailing, 10)
                                }
                                    .font(.custom("Poppins-Medium", size: 13))
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                    
                                    .padding(.bottom, 5),
                                 alignment: .bottomTrailing)
                    
                    
                }.padding()
               
            }
            .padding(.leading)
            .padding()
            
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(#colorLiteral(red: 0.9528681636, green: 0.9529824853, blue: 0.9528294206, alpha: 1)))
                    .padding(.horizontal)
                    .shadow(radius: 1) )
            
                    
                    
                    //MARK: PILL QUANTITY DETAIL
            HStack{
                Spacer()
                VStack{
                    Text("Total Pills")
                        .font(.custom("Poppins-Medium", size: 14))
                        .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                    HStack{
                        Circle()
                            .foregroundColor(Color(#colorLiteral(red: 0.1926886439, green: 0.3166190386, blue: 0.846487999, alpha: 1)))
                            .frame(width:10, height:10,alignment:.center)
                        
                        Text("\(totalStock)")
                            .foregroundColor(Color(#colorLiteral(red: 0.1926886439, green: 0.3166190386, blue: 0.846487999, alpha: 1)))
                    }
                }
                Spacer()
                VStack{
                    Text("Pills Taken")
                        .font(.custom("Poppins-Medium", size: 14))
                        .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                    HStack{
                        Circle()
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.8439942002, blue: 0, alpha: 1)))
                            .frame(width:10, height:10,alignment:.center)
                        
                        Text("\(takenCount)")
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.8439942002, blue: 0, alpha: 1)))
                    }
                }
                Spacer()
                VStack{
                    Text("Pills Missed")
                        .font(.custom("Poppins-Medium", size: 14))
                        .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                    HStack{
                        Circle()
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)))
                            .frame(width:10, height:10,alignment:.center)
                        
                        Text("\(skipCount)")
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)))
                    }
                }
                Spacer()
            }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(#colorLiteral(red: 0.9528681636, green: 0.9529824853, blue: 0.9528294206, alpha: 1)))
                        .padding(.horizontal)
                        .shadow(radius: 1) )
                    
                    //MARK:DURATION
                    HStack{
                    VStack(alignment:.leading){
                        Text(rangeDisplayTitle)
                            .font(.custom("Poppins-Medium", size: 14))
                        Text(rangeString)
                            .font(.custom("Poppins-Medium", size: 10))
                            .foregroundColor(Color(#colorLiteral(red: 0.1926886439, green: 0.3166190386, blue: 0.846487999, alpha: 1)))
                    }
                    Spacer()
                        
                    }.padding()
                    
                    Divider()
                    
                    
                    //MARK: SPECIFIC DATE
                    
                    
                    HStack{
                        
                        VStack(alignment:.leading){
                            Text(dateString)
                                .font(.custom("Poppins-Medium", size: 14))
                            
                            Text("Missed (\(takenCount))")
                                .font(.custom("Poppins-Medium", size: 12))
                                .foregroundColor(.gray)
                            
                            Text("Taken (\(skipCount))")
                                .font(.custom("Poppins-Medium", size: 12))
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                    }.padding(.horizontal)
                    

                    ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                    LazyVStack{
                        ForEach(0..<displayData.count, id:\.self){ i in
            
                       
                                if self.takenStatus.contains(i){

                                    
                                    
                                    TrackerMediView(statusImage: "tick",mediType:displayData[i].Apperance, mediTitle:displayData[i].Title, status: "Taken")
                                }
                             
                                
                                else if self.skipStatus.contains(i){

                                    
                                    TrackerMediView(statusImage: "cancel",mediType:displayData[i].Apperance, mediTitle:displayData[i].Title, status: "Skip")
                                }
                                
                                else{

                                    TrackerMediView(statusImage: "",mediType:displayData[i].Apperance, mediTitle:displayData[i].Title, status: "")
                            }
      
                        }
    
                    }
                    .padding()
                    }
                   

                    
                }
        }
            
            Spacer()
            
        }
        .padding(.bottom)
        .onAppear(){
            
            
            let currentDate = Date()
            var dateComponent = DateComponents()
            dateComponent.day = -7
            let pastDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
            
            print(currentDate)
            print(pastDate!)
            
            
            let calendar_Formattor = DateFormatter()
            calendar_Formattor.dateFormat = "dd-MMM-yyyy"
            
            
            let c = calendar_Formattor.string(from: currentDate)
            let p = calendar_Formattor.string(from: pastDate!)
            
            print(c)
            print(p)
            
            self.rangeString = "\(p) TO \(c)"
            
          
            
            
            let calendar = Calendar.current
            let week = calendar.component(.weekOfYear, from: Date.init(timeIntervalSinceNow: 0))
            let month = calendar.component(.month, from: Date.init(timeIntervalSinceNow: 0))
            let day = calendar.component(.day, from: Date.init(timeIntervalSinceNow: 0))
            
            self.dayOfMonth = day
            
            weekOfYear = week
            monthOfYear = month
            
            let d_Formattor = DateFormatter()
            d_Formattor.dateFormat = "dd-MMM"
//            d_Formattor.dateStyle = .short
            
            self.dateString = d_Formattor.string(from: today)
            
            print(self.dateString)
            
         
            
            //MEDICINE
            VM.GetCollection(collectionTitle: "Medicine", subCollectionTitle: "Stock") { (status, details : [Medicine], err) in
                
                if status{
                    medicineData = details
                    
                    details.forEach { medi in
                        
                        totalStock += medi.Stock
                        
                    }
                    
                    print(totalStock)
                    //DOSE
                    
                    VM.GetTrack(Field: "week", Value: weekOfYear) { (status, Detail:[Dose], err )in
                        
                        if status{
                            
                            
                            Detail.forEach { Dose in
                                
                                let _ = medicineData.firstIndex { Medicine in
                                    
                                    if Medicine.id == Dose.MedicineID{
                                        
                                        self.displayData.append(Medicine)
                                        return true
                                    }
                                    else{
                                        return false
                                    }
                                }
                                
                                
                                
                                if Dose.status == "Taken" {
                                    takenCount += 1
                                }else if Dose.status == "Skip" {
                                    skipCount += 1
                                }
                                
                                print("taken:\(takenCount)")
                                print("Skip:\(skipCount)")
                                
                                
                              
                                
                                if Dose.status == "Taken"{
             
                                    let Index = self.medicineData.firstIndex { Medicine in
                                        
                                        
                                        if Medicine.id == Dose.MedicineID!{
                                            print("found")
                                           
                                            
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
                            
                        
                            
                            print(takenCount)
                            print(totalStock)
                            let cal = Double(takenCount) / Double(totalStock)
                            print(cal)
                            self.percent = CGFloat(cal)

                        }
                    }
                    
                }else{
                    print("\(err!)")
                }
                
            }
            
            
        }
        .preferredColorScheme(.light)
        .navigationBarHidden(true)
        .background(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
        
        
      
    }
    
    func displayValue(){
        
        totalStock = 0
        takenCount = 0
        skipCount = 0
        
        self.displayData.removeAll()
        
        if isWeek{
            
            let currentDate = Date()
            var dateComponent = DateComponents()
            dateComponent.day = -7
            let pastDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
            
            print(currentDate)
            print(pastDate!)
            
            
            let calendar_Formattor = DateFormatter()
            calendar_Formattor.dateFormat = "dd-MMM-yyyy"
            
            
            let c = calendar_Formattor.string(from: currentDate)
            let p = calendar_Formattor.string(from: pastDate!)
            
            print(c)
            print(p)
            
            self.rangeString = "\(p) TO \(c)"
       
            
            VM.GetCollection(collectionTitle: "Medicine", subCollectionTitle: "Stock")  { (status, details : [Medicine], err) in
                
                if status{
                    medicineData = details
                    
                    details.forEach { medi in
                        
                        totalStock += medi.Stock
                        
                    }
                    
                    print(totalStock)
                    //DOSE
                    
                    VM.GetTrack(Field: "week", Value: weekOfYear) { (status, Detail:[Dose], err )in
                        
                        if status{
                            
                            
                            Detail.forEach { Dose in
                                
                                let _ = medicineData.firstIndex { Medicine in
                                    
                                    if Medicine.id == Dose.MedicineID{
                                        
                                        self.displayData.append(Medicine)
                                        return true
                                    }
                                    else{
                                        return false
                                    }
                                }
                                
                                
                                
                                if Dose.status == "Taken" {
                                    takenCount += 1
                                }else if Dose.status == "Skip" {
                                    skipCount += 1
                                }
                                
                                print("taken:\(takenCount)")
                                print("Skip:\(skipCount)")
                                
                                
                              
                                
                                if Dose.status == "Taken"{
             
                                    let Index = self.medicineData.firstIndex { Medicine in
                                        
                                        
                                        if Medicine.id == Dose.MedicineID!{
                                            print("found")
                                           
                                            
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
                            print(takenCount)
                            print(totalStock)
                            let cal = Double(takenCount) / Double(totalStock)
                            print(cal)
                            self.percent = CGFloat(cal)

                        }
                    }
                    
                }else{
                    print("\(err!)")
                }
                
            }
            
        }
        else if isMonth{
            
            
            let currentDate = Date()
            var dateComponent = DateComponents()
            dateComponent.day = -dayOfMonth
            let pastDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
            
            print(currentDate)
            print(pastDate!)
            
            
            let calendar_Formattor = DateFormatter()
            calendar_Formattor.dateFormat = "dd-MMM-yyyy"
            
            
            let c = calendar_Formattor.string(from: currentDate)
            let p = calendar_Formattor.string(from: pastDate!)
            
            print(c)
            print(p)
            
            self.rangeString = "\(p) TO \(c)"
            
            VM.GetCollection(collectionTitle: "Medicine", subCollectionTitle: "Stock")  { (status, details : [Medicine], err) in
                
                if status{
                    medicineData = details
                    
                    details.forEach { medi in

                        totalStock += medi.Stock

                    }
                    
                    print(totalStock)
                    //DOSE
                    
                    VM.GetTrack(Field: "month", Value: monthOfYear) { (status, Detail:[Dose], err )in
                        
                        if status{
                            
                            
                            Detail.forEach { Dose in
                                
                                let _ = medicineData.firstIndex { Medicine in
                                    
                                    if Medicine.id == Dose.MedicineID{
                                        
                                        self.displayData.append(Medicine)
                                        return true
                                    }
                                    else{
                                        return false
                                    }
                                }
                                
                                
                                
                                if Dose.status == "Taken" {
                                    takenCount += 1
                                }else if Dose.status == "Skip" {
                                    skipCount += 1
                                }
                                
                                print("taken:\(takenCount)")
                                print("Skip:\(skipCount)")
                                
                                
                              
                                
                                if Dose.status == "Taken"{
             
                                    let Index = self.medicineData.firstIndex { Medicine in
                                        
                                        
                                        if Medicine.id == Dose.MedicineID!{
                                            print("found")
                                           
                                            
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
                            print(takenCount)
                            print(totalStock)
                            let cal = Double(takenCount) / Double(totalStock)
                            print(cal)
                            self.percent = CGFloat(cal)

                        }
                    }
                    
                }else{
                    print("\(err!)")
                }
                
            }
            
        }
        
        
        else{
            
            let currentDate = Date()
            print(currentDate)
       
            
            
            let calendar_Formattor = DateFormatter()
            calendar_Formattor.dateFormat = "dd-MMM-yyyy"
            
            
            let c = calendar_Formattor.string(from: currentDate)
           
            
            print(c)
            
            self.rangeString = "Till \(c)"
            
            VM.GetCollection(collectionTitle: "Medicine", subCollectionTitle: "Stock") { (status, details : [Medicine], err) in
                
                if status{
                    displayData = details
                    
                    details.forEach { medi in
                        
                        totalStock += medi.Stock
                        
                    }

                    
                    print(totalStock)
                    //DOSE
                    
                    VM.GetDoseStatus { (status, Detail:[Dose], err )in
                        
                        if status{
                            Detail.forEach { Dose in
                                
                                
                                if Dose.status == "Taken" {
                                    takenCount += 1
                                }else if Dose.status == "Skip" {
                                    skipCount += 1
                                }
                       
                                
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
                            
                            print(takenCount)
                            print(totalStock)
                            let cal = Double(takenCount) / Double(totalStock)
                            print(cal)
                            self.percent = CGFloat(cal)
                        }
                    }
                    
                }else{
                    print("\(err!)")
                }
                
            }
        }
    }
}

struct trackerView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView()
    }
}

struct TrackerMediView: View {
    
    var statusImage: String
    var mediType: String
    var mediTitle : String
    var status: String
    @State var isStatus = false
    
    var body: some View {
        HStack{
            Image(statusImage)
                .resizable()
                .frame(width: 20, height: 20, alignment: .center)
                .scaledToFill()
            Image(mediType)
                .resizable()
                .frame(width:25, height:26)
                .scaledToFill()
            Text(mediTitle)
                .font(.custom("Poppins-Medium", size: 16))
                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
            
            Spacer()
            Text(status)
                .font(.custom("Poppins-Medium", size: 10))
                .foregroundColor(isStatus ? Color(#colorLiteral(red: 0.01960825361, green: 0.7933595777, blue: 0.009918640368, alpha: 1)) : Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)))
        }.padding(.horizontal)
        .padding(.bottom, 8)
        .onAppear(){
            if status == "Taken"{
                isStatus = true
            }
        }
    }
}



extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
