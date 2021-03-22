//
//  HomeView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 22/03/2021.
//

import SwiftUI

struct HomeView: View {
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
                    Button(action: {
                        
                    }, label: {
                        Image("add_button")
                            .padding(.trailing)
                    })
                }.background(
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
                        .shadow(radius: 6 )
                        .frame(width: .infinity,height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
                    
            }.padding()
            
    
                
        }
    
          
                VStack(alignment:.leading){
                    
                    Text("My Medicines")
                        .font(.custom("Poppins-Medium", size: 18))
                        .foregroundColor(.black)
                        .padding()
                    
                    List{
                        
                        VStack{
                            
                            ZStack{
                            
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.white)
                                .frame(height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .shadow(radius: 5)
                               
                                HStack{
                            Image("capsule")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    
                                    VStack(alignment:.leading){
                                        Text("Asprin")
                                        .font(.custom("Poppins-Medium", size: 12))
                                            .foregroundColor(Color(#colorLiteral(red: 0.4979991317, green: 0.4980617762, blue: 0.4979779124, alpha: 1)))
                                        
                                        Text("Asprin")
                                        .font(.custom("Poppins-Medium", size: 10))
                                            .foregroundColor(Color(#colorLiteral(red: 0.6626930237, green: 0.662774384, blue: 0.6626655459, alpha: 1)))
                                        
                                        Text("Asprin")
                                        .font(.custom("Poppins-Medium", size: 10))
                                            .foregroundColor(Color(#colorLiteral(red: 0.6626930237, green: 0.662774384, blue: 0.6626655459, alpha: 1)))
                                    }
                                    
                                    Spacer()
                                    
                                    Image("taken")
                                }.padding()
                                
                            
                            }
                        }
                       
                        
                       VStack {
                            
                            ZStack{
                            
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundColor(.white)
                                .frame(height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .shadow(radius: 5)
                               
                                HStack{
                            Image("tablet")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    
                                    VStack(alignment:.leading){
                                        Text("Asprin")
                                        .font(.custom("Poppins-Medium", size: 12))
                                            .foregroundColor(Color(#colorLiteral(red: 0.4979991317, green: 0.4980617762, blue: 0.4979779124, alpha: 1)))
                                        
                                        Text("Asprin")
                                        .font(.custom("Poppins-Medium", size: 10))
                                            .foregroundColor(Color(#colorLiteral(red: 0.6626930237, green: 0.662774384, blue: 0.6626655459, alpha: 1)))
                                        
                                        Text("Asprin")
                                        .font(.custom("Poppins-Medium", size: 10))
                                            .foregroundColor(Color(#colorLiteral(red: 0.6626930237, green: 0.662774384, blue: 0.6626655459, alpha: 1)))
                                    }
                                    
                                    Spacer()
                                    
                                    Image("skip")
                                }.padding()
                                
                            
                            }
                        }
                        
                    }
                    
                    
                }
                .background(
                    Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1))
                )
        
         
            Spacer()
    }
            
        
        
       
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
                    .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
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
