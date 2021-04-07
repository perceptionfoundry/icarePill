//
//  ScheduleView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 24/03/2021.
//

import SwiftUI


var previousMediValue : Medicine?

struct ScheduleView: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
   
    @State var dosageValue = ""
    @State var pillConditionValue = ""
    @State var selectedDays = [String]()
    
    
    @State var DaysValue = [String]()
    @State var isEveryDay = false
    @State var isMonday = false
    @State var isTuesday = false
    @State var isWednesday = false
    @State var isThursday = false
    @State var isFriday = false
    @State var isSaturday = false
    @State var isSunday = false
    
    
    @State private var selectedGiveTime =  "After Breakfast, "
    let strengthValue = ["Before Breakfast", "After Breakfast",
                         "Before Lunch", "After lunch",
                         "Before Dinner", "After Dinner,"]
    @State  var isExpand  = false
    
    @State var selectedDate = Date()
    
    @State var notificationValue = [String]()
    
    
    @State var isNext = false

//    static let formatter: DateFormatter = {
//           let formatter = DateFormatter()
//        formatter.dateFormat = "hh:mm a"
//
//           return formatter
//       }()
    
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20){
        
            //MARK: Dosage
            VStack(alignment: .leading){
                Text("Dosage")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.accentColor)
               
                HStack{
                ZStack{
                    Rectangle()
                        .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                    
                  
                        TextField("Number of Pills", text: $dosageValue)
                            .foregroundColor(.accentColor)
                            .font(.custom("Poppins-Medium", size: 14))
                            .padding()

                }
                 
               
                    
                }
            }
            
            //MARK: Pill Condition
            VStack(alignment: .leading){
                Text("Pill Condition ")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.accentColor)
               
                HStack{

                    
                    VStack{
                    DisclosureGroup(selectedGiveTime, isExpanded: $isExpand) {
                        
                        VStack{
                            ForEach(strengthValue, id:\.self){ value  in
                                
                                Text("\(value)")
                                    .foregroundColor(.accentColor)
                                    .padding(.bottom)
                                    .onTapGesture {
                                        self.selectedGiveTime = value
                                        
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
            
            //MARK: Pill Condition
            VStack(alignment: .leading){
                Text("Days in Week")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.accentColor)
               
           

                    ScrollView(.horizontal, showsIndicators: false){
                        
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 25){

                            Button(action: {
                                
                                
                                if isEveryDay{
                                    
                                   let index =  DaysValue.firstIndex(of: "Everyday")
                                    DaysValue.remove(at: index!)
                                    
                                    isEveryDay = false
                                    isMonday = false
                                    isTuesday = false
                                    isWednesday = false
                                    isThursday = false
                                    isFriday = false
                                    isSaturday = false
                                    isSunday = false
                                    
                                    DaysValue.removeAll()
                                    
                                }else{
                                    self.DaysValue.append("Everyday")
                                    isEveryDay.toggle()
                                    
                                    isMonday = true
                                    isTuesday = true
                                    isWednesday = true
                                    isThursday = true
                                    isFriday = true
                                    isSaturday = true
                                    isSunday = true
                                    
                                    DaysValue.removeAll()
                                    DaysValue = ["Everyday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Satursday", "Sunday"]
                                    
                                }
                                
                            }, label: {
                                DaysView(dayTitle: "Everyday", isSelected: isEveryDay)
                                
                            })
                       
                            
                            
                            Button(action: {
                               
                                
                                if isMonday{
                                    
                                   let index =  DaysValue.firstIndex(of: "Monday")
                                    DaysValue.remove(at: index!)
                                    
                                    isMonday = false
                                    isEveryDay = false
                                    
                                }else{
                                    self.DaysValue.append("Monday")
                                    isMonday.toggle()
                                }
                                
                            }, label: {
                                DaysView(dayTitle: "Monday", isSelected: isMonday)
                            })
                       
                            
                            
                            Button(action: {
                                
                                
                                if isTuesday{
                                    
                                   let index =  DaysValue.firstIndex(of: "Tuesday")
                                    DaysValue.remove(at: index!)
                                    
                                    isTuesday = false
                                    isEveryDay = false
                                }else{
                                    self.DaysValue.append("Tuesday")
                                    isTuesday.toggle()
                                }
                                
                            }, label: {
                                DaysView(dayTitle: "Tuesday", isSelected: isTuesday)
                            })
                       
                            
                            Button(action: {
                                
                                
                                if isWednesday{
                                    
                                   let index =  DaysValue.firstIndex(of: "Wednesday")
                                    DaysValue.remove(at: index!)
                                    
                                    isWednesday = false
                                    isEveryDay = false
                                }else{
                                    self.DaysValue.append("Wednesday")
                                    isWednesday.toggle()
                                }
                                
                            }, label: {
                                DaysView(dayTitle: "Wednesday", isSelected: isWednesday)
                            })
                       
                            
                            Button(action: {
                                
                                
                                if isThursday{
                                    
                                   let index =  DaysValue.firstIndex(of: "Thursday")
                                    DaysValue.remove(at: index!)
                                    
                                    isThursday = false
                                    isEveryDay = false
                                }else{
                                    self.DaysValue.append("Thursday")
                                    isThursday.toggle()
                                }
                                
                            }, label: {
                                DaysView(dayTitle: "Thursday", isSelected: isThursday)
                            })
                       

                            
                            Button(action: {
                                
                                
                                if isFriday{
                                    
                                   let index =  DaysValue.firstIndex(of: "Friday")
                                    DaysValue.remove(at: index!)
                                    
                                    isFriday = false
                                    
                                }else{
                                    self.DaysValue.append("Friday")
                                    isFriday.toggle()
                                    isEveryDay = false
                                }
                                
                            }, label: {
                                DaysView(dayTitle: "Friday", isSelected: isFriday)
                            })
                       
                            
                            
                            Button(action: {
                                
                                
                                if isSaturday{
                                    
                                   let index =  DaysValue.firstIndex(of: "Satursday")
                                    DaysValue.remove(at: index!)
                                    
                                    isSaturday = false
                                    isEveryDay = false
                                    
                                }else{
                                    self.DaysValue.append("Satursday")
                                    isSaturday.toggle()
                                }
                                
                            }, label: {
                                DaysView(dayTitle: "Satursday", isSelected: isSaturday)
                            })
                       
                            
                            
                            
                            Button(action: {
                                
                                
                                if isSunday{
                                    
                                   let index =  DaysValue.firstIndex(of: "Sunday")
                                    DaysValue.remove(at: index!)
                                    
                                    isSunday = false
                                    isEveryDay = false
                                    
                                }else{
                                    self.DaysValue.append("Sunday")
                                    isSunday.toggle()
                                }
                                
                            }, label: {
                                DaysView(dayTitle: "Sunday", isSelected: isSunday)
                                
                            })
                       

                        }
                        .padding(.horizontal)
                        .padding(.vertical)
                  
                    }
            }
            
            
            //MARK: Pill Condition
            VStack(alignment: .leading){
                Text("Notification")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.accentColor)
               
                HStack{
                    
                    LazyVStack{
                        
                        ForEach(notificationValue, id: \.self){ v in
                            NotificatioView(time: "\(v)")
                        }
                        
                                                
                    
                    
                    }
                    
                    Button(action: {
                        self.showDatePickerAlert()
                    }, label: {
                        Image("add_light")
                    })
                    
     
                    }
           
                
            }
            
            
            Spacer()
            //MARK: Done Button
            
            
                    Button(action: {
                        
                        
                        let dict = ["id" : "",
                                    "Title" : previousMediValue?.Title,
                                    "Condition" : previousMediValue?.Condition,
                                    "Apperance" : previousMediValue?.Apperance,
                                    "Strength" : previousMediValue?.Strength,
                                    "unit" : previousMediValue?.unit,
                                    "DoE" : previousMediValue?.DoE,
                                    "Stock" : previousMediValue?.Stock,
                                    "reminder" : previousMediValue?.reminder,
                         "dosage" : dosageValue,
                         "giveAt" : selectedGiveTime,
                         "days" : DaysValue,
                         "notification" : notificationValue
                        ] as [String : Any]
                        
                        
//                        isNext.toggle()

                        
                    }, label: {
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundColor(.accentColor)
                                .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding()
                            
                            Text("Done")
                                .foregroundColor(.white)
                                .font(.custom("Poppins-Medium", size: 16))
                            
                        }
                        
                    })
               .foregroundColor(.blue)
                .fullScreenCover(isPresented: $isNext, content: {
                    MainView()
                })
        }
        .onAppear(){
            print("check")
        }
        .padding()
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
                        Text("Schedule")
                            .font(.custom("Poppins-Medium", size: 18))
                            .foregroundColor(.accentColor)
                       
                    }
                }
            }
    }
    
    
    
    func showDatePickerAlert() {
        let alertVC = UIAlertController(title: "\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .alert)
            let datePicker: UIDatePicker = UIDatePicker()
            datePicker.datePickerMode = .time
            datePicker.preferredDatePickerStyle = .wheels
        
            alertVC.view.addSubview(datePicker)

            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.selectedDate = datePicker.date
                
                
                let formattor = DateFormatter()
                formattor.dateFormat = "hh:mm a"
                
                notificationValue.append(formattor.string(from: selectedDate))
            }
            alertVC.addAction(okAction)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alertVC.addAction(cancelAction)

            if let viewController = UIApplication.shared.windows.first?.rootViewController {
                viewController.present(alertVC, animated: true, completion: nil)
            }
        }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}



//MARK: *** SUBVIEWS ***
struct DaysView: View {
    
    var dayTitle : String
    var isSelected : Bool
    
    var body: some View {
        VStack{
            Text(dayTitle)
                .foregroundColor(isSelected ? .white : .accentColor)
                
            
        }
        .font(.custom("Poppins-Medium", size: 13))
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(isSelected ?  .accentColor : .white)
                .shadow(radius: 2)
        )
    }
}

struct NotificatioView: View {
    
    var time : String
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .shadow(radius: 2)
            
            HStack {
                Image("blue_bell")
                
                Text(time)
                    .font(.custom("Poppins-Medium", size: 14))
                    .foregroundColor(.accentColor)
                
                Spacer()
                
            }
            .padding()
            
            
            
        }
    }
    
    
    
    
}
