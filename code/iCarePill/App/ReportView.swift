//
//  ReportView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 22/03/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReportView: View {
    
    @State  var isNewEntry = false
    
    let tempData = [Medicine(id: "jsfjks", Title: "Aspirin", Condition: "normal", Apperance: "capsule", Strength: 5, unit: "mg", DoE: "1/1/2000", Stock: 10, reminder: false, dosage: "", giveAt: "", days: [], notification: []),
                    Medicine(id: "wrtrewt", Title: "DEXA", Condition: "normal", Apperance: "syrup", Strength: 50, unit: "ml", DoE: "1/10/2000", Stock: 5, reminder: false, dosage: "", giveAt: "", days: [], notification: []),
                    Medicine(id: "dddsds", Title: "histop", Condition: "normal", Apperance: "tablet", Strength: 2.5, unit: "mg", DoE: "1/1/2000", Stock: 10, reminder: false, dosage: "", giveAt: "", days: [], notification: [])]
    
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
                                Text("Hello, \(userDetail?.first ?? "")!")
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
                  
                
                HStack{
                    
                    VStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.2723872066, blue: 0.4027544558, alpha: 1)))
                        .padding(.bottom)
                        .overlay(Image("heart")
                                    .padding(), alignment: .topLeading)
                        .overlay(Image("wave")
                                    .padding(), alignment: .center)
                        .overlay(Text("75bpm").font(.custom("Poppins-Regular", size: 12)).foregroundColor(.white)
                                    .padding(.bottom, 30).padding(.leading, 20), alignment: .bottomLeading)
                        
                        
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 180, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(#colorLiteral(red: 0.3661571145, green: 0.432254374, blue: 1, alpha: 1)))
                            .overlay(Image("walk")
                                        .padding(), alignment: .topLeading)
                    }
                    
                    
                    VStack{
                        
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 180, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.6525524259, blue: 0.1507192552, alpha: 1)))
                            .padding(.bottom)
                            .overlay(Image("sleep")
                                        .padding(), alignment: .topLeading)
                            .overlay(Image("pattern")
                                        .padding(), alignment: .center)
                            .overlay(Text("7 Hours").font(.custom("Poppins-Regular", size: 12)).foregroundColor(.white)
                                        .padding(.bottom, 20).padding(.leading, 20), alignment: .bottomLeading)
                        
                        
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 0.291448921, green: 0.3132567704, blue: 0.8625861406, alpha: 1)))
                        .overlay(Image("pressure")
                                    .padding(), alignment: .topLeading)
                        .overlay(Image("pattern")
                                    .padding(), alignment: .center)
                        .overlay(Text("120/80").font(.custom("Poppins-Regular", size: 12)).foregroundColor(.white)
                                    .padding(.bottom, 30).padding(.leading, 20), alignment: .bottomLeading)
                        
                        
                        
                        
                    }
                }
                    
                
        }
          
            VStack(alignment:.leading){
                
                Text("medication expiration in 10 days")
                    .font(.custom("Poppins-Medium", size: 14))
                    .foregroundColor(.black)
                    .padding()
                
                
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                LazyVStack{
                    
                    
                    ForEach(tempData){value in
                        
                        ReportCellView(ImageTitle: value.Apperance, MedicineTitle: "skip", Time: "5 days")
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
            
        }.preferredColorScheme(.light)
        .navigationBarHidden(true)
        .background(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}

struct ReportTopView: View {
    
    var icon:String
    var Category: String
    var Value:String
    
    var body: some View {
        HStack{
            Image(icon)
                .padding(.bottom)
            VStack(alignment:.leading){
                Text(Category)
                Text(Value)
            }
            .foregroundColor(.white)
            .font(.custom("Poppins-Regular", size: 12))
            .padding(.bottom, 15)
            
        }
        .background(RoundedRectangle(cornerRadius: 10)
                        .frame(width: 80, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.accentColor)
                        .padding(.bottom, 15)
        )
    }
}



struct ReportCellView: View {
    
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
                            .font(.custom("Poppins-Medium", size: 12))
                            .foregroundColor(Color(#colorLiteral(red: 0.4979991317, green: 0.4980617762, blue: 0.4979779124, alpha: 1)))
                        
                    
                        
                    }
                    
                    Spacer()
                    
                    
                    Text(Time)
                        .font(.custom("Poppins-Medium", size: 10))
                        .foregroundColor(Color(#colorLiteral(red: 0.6626930237, green: 0.662774384, blue: 0.6626655459, alpha: 1)))
                }.padding()
                
                
            }
        }
    }
}
