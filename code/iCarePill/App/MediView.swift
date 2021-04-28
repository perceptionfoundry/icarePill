//
//  MediView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 22/03/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct MediView: View {
    
    
    
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
    
    

    
    let tempData = [Medicine]()
    

    
    var body: some View {
        
        VStack(spacing: 10){
   
            if self.data != nil{
            //MARK: TOP PART
          
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
                        Text("Hello, \((userDetail?.first)!)")
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
                   
                }
                .padding(.top,40)
                .background(
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
                        .shadow(radius: 6 )
                        .frame(height: 325, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .edgesIgnoringSafeArea(.all)
                        
                )
               
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                  
                                                  HStack(spacing: 40){
                  
                  
                  
                                                      ForEach(calendarData){ (value) in
                  
                                                          Button(action: {
                  
                                                              selectDate = value.id
                                                            
                                                            print(value.Day)
                                                            
                                                            self.displayValue(dayName: value.Day)
                  
                                                          }, label: {
                                                              MediTopView(DateValue: value.Date, DayValue:  value.Day, isSelected: selectDate == value.id ? true : false)
                                                          })
                  
                                                      }
                  
                                                  }.padding(.horizontal)
                                                  .padding(.bottom)
                                              })
                                              .padding(.bottom, 30)
            }
              
            
            ScrollView{
            //****** Morning
            VStack(alignment:.center){
                
                HStack{
                Image("morning")
                    .resizable()
                    .frame(width: 40, height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .scaledToFill()
                
                    Text("Morning")
                        .foregroundColor(.black)
                        .font(.custom("Poppins-Regular", size: 16))
                }
                
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                LazyVStack{
                    
                    if !morningDrug.isEmpty {
                        ForEach(morningDrug){value in
                            
                            MediCellView(ImageTitle: value.Apperance, MedicineTitle: value.Title, Time: value.giveAt)
                                .padding(.bottom, 10)
                        }
                    }else{
                       
            
                            MediCellView_blank(ImageTitle: "", MedicineTitle: "", Time: "")
                                .padding(.bottom, 10)
                    }
                    
                  

                }
                .padding()
                }
                
            }
            .background(
                Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1))
            )
                
                
                //MARK: ** Afternoon **
                VStack(alignment:.center){
                    
                    HStack{
                    Image("sun")
                        .resizable()
                        .frame(width: 24, height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                    
                        Text("Afternoon")
                            .foregroundColor(.black)
                            .font(.custom("Poppins-Regular", size: 16))
                    }
                    
                    ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                    LazyVStack{
                        
                        if !afternoonDrug.isEmpty {
                            ForEach(afternoonDrug){value in
                                
                                MediCellView(ImageTitle: value.Apperance, MedicineTitle: value.Title, Time: value.giveAt)
                                    .padding(.bottom, 10)
                            }
                        }else{
                           
                
                                MediCellView_blank(ImageTitle: "", MedicineTitle: "", Time: "")
                                    .padding(.bottom, 10)
                        }
                        
                      

                    }
                    .padding()
                    }
                    
                }
                .background(
                    Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1))
                )
                
                
                //MARK: ** EVENING **
                VStack(alignment:.center){
                    
                    HStack{
                    Image("evening")
                        .resizable()
                        .frame(width: 24, height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                    
                        Text("Evening")
                            .foregroundColor(.black)
                            .font(.custom("Poppins-Regular", size: 16))
                    }
                    
                    ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                    LazyVStack{
                        
                        if !eveningDrug.isEmpty {
                            ForEach(eveningDrug){value in
                                
                                MediCellView(ImageTitle: value.Apperance, MedicineTitle: value.Title, Time: value.giveAt)
                                    .padding(.bottom, 10)
                            }
                        }else{
                           
                
                                MediCellView_blank(ImageTitle: "", MedicineTitle: "", Time: "")
                                    .padding(.bottom, 10)
                        }
                        
                      

                    }
                    .padding()
                    }
                    
                }
                .background(
                    Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1))
                )
                
                
                
                //MARK: ** Night **
                VStack(alignment:.center){
                    
                    HStack{
                    Image("moon")
                        .resizable()
                        .frame(width: 24, height: 24, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                    
                        Text("Night")
                            .foregroundColor(.black)
                            .font(.custom("Poppins-Regular", size: 16))
                    }
                    
                    ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                    LazyVStack{
                        
                        if !nightDrug.isEmpty {
                            ForEach(nightDrug){value in
                                
                                MediCellView(ImageTitle: value.Apperance, MedicineTitle: value.Title, Time: value.giveAt)
                                    .padding(.bottom, 10)
                            }
                        }else{
                           
                
                                MediCellView_blank(ImageTitle: "", MedicineTitle: "", Time: "")
                                    .padding(.bottom, 10)
                        }
                        
                      

                    }
                    .padding()
                    }
                    
                }
                .background(
                    Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1))
                )
        }
          
          
            Spacer()
        }
        }
        .navigationBarHidden(true)
        .onAppear(perform: {
            
            self.dateValue = Date()
            self.UpdateDate()
            for i in (1 ... 30){
                
                self.count = i
                
            self.newDate()
                
               
            }
            
           
            
        })
        .preferredColorScheme(.light)
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

struct MediView_Previews: PreviewProvider {
    
   
    static var previews: some View {
        MediView(dateValue: .constant(Date()))
    }
}




struct MediTopView: View {
    
   
    var DateValue: String
    var DayValue:String
    var isSelected:Bool
    
    var body: some View {

           
            VStack(alignment:.center){
                Text(DateValue)
                
                Text(DayValue)
            }
            .foregroundColor(isSelected ? .white : Color(#colorLiteral(red: 0.4156521559, green: 0.4157054424, blue: 0.4156340361, alpha: 1)))
            .font(.custom("Poppins-Regular", size: 12))
            .padding(.vertical)
            
        .background(RoundedRectangle(cornerRadius: 5)
                        .frame(width: 50, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(isSelected ? .accentColor :Color(#colorLiteral(red: 0.8469936252, green: 0.8470956683, blue: 0.8469588161, alpha: 1)))
                        
                        
        )
    }

}


struct MediCellView: View {
    
    var ImageTitle: String
    var MedicineTitle : String
    var Time : String
    
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
                            .font(.custom("Poppins-Medium", size: 15))
                            .foregroundColor(.accentColor)
                        
                        
                        Text(MedicineTitle)
                            .font(.custom("Poppins-Regular", size: 14))
                            .foregroundColor(Color(#colorLiteral(red: 0.4979991317, green: 0.4980617762, blue: 0.4979779124, alpha: 1)))
                        
                    
                        
                    }
                    
                    Spacer()
                    
                    VStack{
                    
                    Text(Time)
                        .font(.custom("Poppins-Regular", size: 12))
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                        
                        Spacer()
                        
                    }
                    
                }.padding()
                
                
            }
        }
    }
}


struct MediCellView_blank: View {
    
    var ImageTitle: String
    var MedicineTitle : String
    var Time : String
    
    var body: some View {
        VStack{
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
                    .frame(height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                HStack{
                    Image(ImageTitle)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment:.leading){
                        Text(MedicineTitle)
                            .font(.custom("Poppins-Medium", size: 15))
                            .foregroundColor(.accentColor)
                        
                        
                        Text(MedicineTitle)
                            .font(.custom("Poppins-Regular", size: 14))
                            .foregroundColor(Color(#colorLiteral(red: 0.4979991317, green: 0.4980617762, blue: 0.4979779124, alpha: 1)))
                        
                    
                        
                    }
                    
                    Spacer()
                    
                    VStack{
                    
                    Text(Time)
                        .font(.custom("Poppins-Regular", size: 12))
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                        
                        Spacer()
                        
                    }
                    
                }.padding()
                
                
            }
        }
    }
}



struct DateType: Identifiable {
    
    var id : Int
    var Day : String
    var Date : String
    var Year : String
    var Month : String
}
