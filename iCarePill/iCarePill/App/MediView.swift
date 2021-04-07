//
//  MediView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 22/03/2021.
//

import SwiftUI

struct MediView: View {
    
    
    
    @Binding var dateValue : Date
    @State var data : DateType!
    @State var calendarData = [DateType]()
    @State var year = false
    @State  var isNewEntry = false
    @State var count = 0
    @State var selectDate = 0
    
    
    let tempData = [Medicine(id: "jsfjks", Title: "Aspirin", Condition: "normal", Apperance: "capsule", Strength: 5, unit: "mg", DoE: "1/1/2000", Stock: 10, reminder: false, dosage: "", giveAt: "", days: [], notification: []),
                    Medicine(id: "wrtrewt", Title: "DEXA", Condition: "normal", Apperance: "syrup", Strength: 50, unit: "ml", DoE: "1/10/2000", Stock: 5, reminder: false, dosage: "", giveAt: "", days: [], notification: []),
                    Medicine(id: "dddsds", Title: "histop", Condition: "normal", Apperance: "tablet", Strength: 2.5, unit: "mg", DoE: "1/1/2000", Stock: 10, reminder: false,dosage: "", giveAt: "", days: [], notification: [])]
    

    
    var body: some View {
        
        VStack(spacing: 10){
   
            if self.data != nil{
            //MARK: TOP PART
          
                VStack{
                HStack{
                    
                    Image("sample")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .clipShape(Circle())
                        .shadow(radius: 3)
                        .padding()
                    
                    VStack(alignment:.leading){
                        Text("Hello, Shahrukh!")
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
                    
                    
                    ForEach(tempData){value in
                        
                        MediCellView(ImageTitle: value.Apperance, MedicineTitle: value.Title, Time: "08:00 am")
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
                        
                        
                        ForEach(tempData){value in
                            
                            MediCellView(ImageTitle: value.Apperance, MedicineTitle: value.Title, Time: "08:00 am")
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
                        
                        
                        ForEach(tempData){value in
                            
                            MediCellView(ImageTitle: value.Apperance, MedicineTitle: value.Title, Time: "08:00 am")
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
                        
                        
                        ForEach(tempData){value in
                            
                            MediCellView(ImageTitle: value.Apperance, MedicineTitle: value.Title, Time: "08:00 am")
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
        
        .background(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
    
    
    
    func newDate(){
        self.dateValue = Calendar.current.date(byAdding: .day, value: 1, to: self.dateValue)!
        self.UpdateDate()

    }

    
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



        print(self.calendarData)
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




struct DateType: Identifiable {
    
    var id : Int
    var Day : String
    var Date : String
    var Year : String
    var Month : String
}
