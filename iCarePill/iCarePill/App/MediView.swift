//
//  MediView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 22/03/2021.
//

import SwiftUI

struct MediView: View {
    
    @State  var isNewEntry = false
    
    let tempData = [Medicine(id: "jsfjks", Title: "Aspirin", Condition: "normal", Apperance: "capsule", Strength: 5, unit: "mg", DoE: "1/1/2000", Stock: 10, reminder: false, status: "taken"),
                    Medicine(id: "wrtrewt", Title: "DEXA", Condition: "normal", Apperance: "syrup", Strength: 50, unit: "ml", DoE: "1/10/2000", Stock: 5, reminder: false, status: "skip"),
                    Medicine(id: "dddsds", Title: "histop", Condition: "normal", Apperance: "tablet", Strength: 2.5, unit: "mg", DoE: "1/1/2000", Stock: 10, reminder: false, status: "taken")]
    
    var body: some View {
        
        VStack(spacing: 10){
   
            
            //MARK: TOP PART
            VStack{
                Rectangle()
                    .foregroundColor(Color(#colorLiteral(red: 0.9489468932, green: 0.9490606189, blue: 0.9489082694, alpha: 1)))
                    .frame(height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                
                    .overlay(
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
                        .padding(.top, 20)
                       
                            HStack{
                               
                                ReportTopView(icon: "user_smallest", Category: "Age", Value: "37 y")
                                    
                                    .padding(.trailing, 30)
                                ReportTopView(icon: "blood", Category: "Blood", Value: "B+")
                                    .padding(.trailing, 30)
                                ReportTopView(icon: "height", Category: "Height", Value: "150 cm")
                                    .padding(.trailing, 30)
                                ReportTopView(icon: "weighing", Category: "Weight", Value: "68 kg")
                                    
                               
                            }
                      
                           
                    }, alignment: .center)
                  
                
              
                    
                
        }
          
            VStack(alignment:.leading){
                
                Text("medication expiration in 10 days")
                    .font(.custom("Poppins-Medium", size: 14))
                    .foregroundColor(.black)
                    .padding()
                
                
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                LazyVStack{
                    
                    
                    ForEach(tempData){value in
                        
                        ReportCellView(ImageTitle: value.Apperance, MedicineTitle: value.Title, Time: "5 days")
                            .padding(.bottom, 10)
                    }

                }
                .padding()
                }
                
            }
            .background(
                Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1))
            )
          
          
            Spacer()
            
        }
        
        .background(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct MediView_Previews: PreviewProvider {
    static var previews: some View {
        MediView()
    }
}
