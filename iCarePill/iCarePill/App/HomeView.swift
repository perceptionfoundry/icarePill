//
//  HomeView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 22/03/2021.
//

import SwiftUI

struct HomeView: View {
    
    
    let tempData = [Medicine(id: "jsfjks", Title: "Aspirin", Condition: "normal", Apperance: "capsule", Strength: 5, unit: "mg", DoE: "1/1/2000", Stock: 10, reminder: false, status: "taken"),
                    Medicine(id: "wrtrewt", Title: "DEXA", Condition: "normal", Apperance: "injection", Strength: 50, unit: "ml", DoE: "1/10/2000", Stock: 5, reminder: false, status: "skip"),
                    Medicine(id: "dddsds", Title: "histop", Condition: "normal", Apperance: "tablet", Strength: 2.5, unit: "mg", DoE: "1/1/2000", Stock: 10, reminder: false, status: "taken")]
    
    
    
        @State  var isNewEntry = false
    

    
    var body: some View {
        
        
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
                   
                }.background(
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
                        .shadow(radius: 6 )
                        .frame(height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .edgesIgnoringSafeArea(.all)
                        
                )
                .padding(.bottom, 30)
               
                
       
            
        
        VStack{
            
            
            HStack{
                HomeCenterButtonView(imageName: "morning", title: " Morning")
                  
                
                HomeCenterButtonView(imageName: "sun", title: " Afternoon")
                                    }

            HStack{
                HomeCenterButtonView(imageName: "evening", title: " Evening")
                   
                
                HomeCenterButtonView(imageName: "moon", title: " Night")
                    
            }
            
    
                
        }
    
          
                VStack(alignment:.leading){
                    
                    Text("My Medicines")
                        .font(.custom("Poppins-Medium", size: 18))
                        .foregroundColor(.black)
                        .padding()
                    
                    
                    ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                    LazyVStack{
                        
                        
                        ForEach(tempData){value in
                            
                            HomeCellView(ImageTitle: value.Apperance, MedicineTitle: value.Title, Dose: "\(value.Strength)\(value.unit)", Time: "08:00", status: value.status)
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
    }.navigationBarHidden(true)
            
        
        
       
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
        }
    }
}
