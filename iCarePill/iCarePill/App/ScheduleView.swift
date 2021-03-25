//
//  ScheduleView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 24/03/2021.
//

import SwiftUI

struct ScheduleView: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var dosageValue = ""
    @State var pillConditionValue = ""
    @State var selectedDays = [String]()
    var Days = ["Everyday", "Monday","Tuesday"]
    
    @State private var selectedStrength =  "After Breakfast, "
    let strengthValue = ["Before Breakfast", "After Breakfast",
                         "Before Lunch", "After lunch",
                         "Before Dinner", "After Dinner,"]
    @State  var isExpand  = false
    
    @State var selectedDate = Date()
    
    @State var value = [String]()
    
    
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
            
            //MARK: Pill Condition
            VStack(alignment: .leading){
                Text("Days in Week")
                    .font(.custom("Poppins-Medium", size: 16))
                    .foregroundColor(.accentColor)
               
           

                    ScrollView(.horizontal, showsIndicators: false){
                        
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 25){

                        DaysView(dayTitle: "Everyday", isSelected: true)

                        DaysView(dayTitle: "Monday", isSelected: false)

                        DaysView(dayTitle: "Tuesday", isSelected: false)

                        DaysView(dayTitle: "Wednesday", isSelected: true)

                        DaysView(dayTitle: "Thursday", isSelected: true)

                        DaysView(dayTitle: "Friday", isSelected: false)

                        DaysView(dayTitle: "Saturday", isSelected: true)

                        DaysView(dayTitle: "Sunday", isSelected: false)

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
                        
                        ForEach(value, id: \.self){ v in
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
                        
                        isNext.toggle()

                        
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
                
                value.append(formattor.string(from: selectedDate))
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
