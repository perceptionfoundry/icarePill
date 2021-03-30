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
                    .edgesIgnoringSafeArea(.top)
                
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
                            }.padding(.horizontal)
          
                }, alignment: .top)
                
        }
            
            //MARK: GROUPBOX
            GroupBox{
                DisclosureGroup(
                    "All Medication")
                    {
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velesse cillumdolore eu fugiat nulla pariatur. Excepteur sint.")
                            .font(.custom("Poppins-Regular", size: 12))
                        
                    }
                
            }
            .padding(.horizontal)
            .font(.custom("Poppins-Medium", size: 16))
            .foregroundColor(.accentColor)
            
            //CIRCULAR PART
            
            HStack{
                
               
                
                
                VStack{
                    
                    ZStack{
                                                
                                                
                                             
                                                Circle()
                                                    .trim(from: 0.0, to: CGFloat(1))
                                                    .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(Color(#colorLiteral(red: 0.7022312284, green: 0.8690876365, blue: 0.7566004992, alpha: 1)))
                                                    .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                    .shadow(color: Color("Button_Color"), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                                                    
                                                    .opacity(0.8)
                                                
                                                
                                            
                                                
            
                                                    
                                                
                                                
                                                Circle()
                                                    .trim(from: 0.0, to: CGFloat(0.5))
                                                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.7959628105, blue: 0, alpha: 1)))
                                                    .frame(width: 100, height: 100, alignment: .top)
                                                    .rotationEffect(.degrees(-90))
                                                    .animation(Animation.linear(duration: 2.0))
                                                
                                                
                                                
                                          
                                                  
                          
                                                Circle()
                                                    .foregroundColor(.red)
                                                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                

                                                
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
                        .padding(.bottom)
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.2723872066, blue: 0.4027544558, alpha: 1)))
                }.padding()
               
            }
            .padding()
            
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(#colorLiteral(red: 0.9528681636, green: 0.9529824853, blue: 0.9528294206, alpha: 1)))
                    .padding(.horizontal)
                    .shadow(radius: 1)
                   
            )
            
            
            Spacer()
            
        }
        
        .background(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct trackerView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView()
    }
}
