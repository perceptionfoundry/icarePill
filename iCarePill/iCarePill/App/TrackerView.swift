//
//  trackerView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 22/03/2021.
//

import SwiftUI

struct TrackerView: View {
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
                                    
                                }, label: {
                                   
                                    Text("This week")
                                        .font(.custom("Poppins-Medium", size: 14))
                                        .foregroundColor(.accentColor)
                                        .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .foregroundColor(.white)
                                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        )
                                        
                                })
                                Spacer()
                                Button(action: {
                                    
                                }, label: {
                                   
                                    Text("This Month")
                                        .font(.custom("Poppins-Medium", size: 14))
                                        .foregroundColor(.white)
                                        .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.white)
                                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            
                                        )
                                        
                                })
                                Spacer()
                                Button(action: {
                                    
                                }, label: {
                                   
                                    Text("All Time")
                                        .font(.custom("Poppins-Medium", size: 14))
                                        .foregroundColor(.white)
                                        .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.white)
                                            .foregroundColor(.white)
                                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        )
                                        
                                })
                                Spacer()
                            }
          
                        }, alignment: .center)
                    
                
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
                            .trim(from: 0.0, to: CGFloat(0.75))
                            .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.7959628105, blue: 0, alpha: 1)))
                            .frame(width: 120, height: 120, alignment: .top)
                            .rotationEffect(.degrees(-90))
                           
                        
                        
                      
                        
                        
                        VStack{
                            Text("90%")
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
                                Text("45")
                                    .font(.custom("Poppins-Medium", size: 18))
                                
                            Text("/60")
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
                                Text("05")
                                    .font(.custom("Poppins-Medium", size: 18))
                                
                            Text("/60")
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
                        
                        Text("60")
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
                        
                        Text("60")
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
                        
                        Text("60")
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
                        Text("Weekly Details")
                            .font(.custom("Poppins-Medium", size: 14))
                        Text("Feb 23 2021 - Feb 30 2021")
                            .font(.custom("Poppins-Medium", size: 10))
                            .foregroundColor(Color(#colorLiteral(red: 0.1926886439, green: 0.3166190386, blue: 0.846487999, alpha: 1)))
                    }
                    Spacer()
                        
                    }.padding()
                    
                    Divider()
                    
                    
                    //MARK: SPECIFIC DATE
                    
                    
                    HStack{
                        
                        VStack(alignment:.leading){
                            Text("Feb 25, Friday")
                                .font(.custom("Poppins-Medium", size: 14))
                            
                            Text("Missed (0)")
                                .font(.custom("Poppins-Medium", size: 12))
                                .foregroundColor(.gray)
                            
                            Text("Taken (3)")
                                .font(.custom("Poppins-Medium", size: 12))
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                    }.padding(.horizontal)
                    
                    TrackerMediView(statusImage: "tick",mediType:"capsule", mediTitle:"Asprin", status: "Taken")
                    TrackerMediView(statusImage: "tick",mediType:"tablet", mediTitle:"Asprin", status: "Taken")
                    TrackerMediView(statusImage: "tick",mediType:"syrup", mediTitle:"Asprin", status: "Taken")


                    
                }
        }
            Spacer()
            
        }
        
        .background(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
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
    
    var body: some View {
        HStack{
            Image(statusImage)
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
                .foregroundColor(Color(#colorLiteral(red: 0.01960825361, green: 0.7933595777, blue: 0.009918640368, alpha: 1)))
        }.padding(.horizontal)
        .padding(.bottom, 8)
    }
}
