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
            
            GeometryReader(content: { geometry in
                
              
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
                        .shadow(radius: 6 )
                        .frame(height: geometry.size.height * 0.225, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .position(x: geometry.size.width/2, y: 0)
                        
                    
                
                HStack{
                    Image("sample")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaledToFill()
                        .clipShape(Circle())
                        .shadow(radius: 3)
                    
                    VStack{
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
                    })
                }.zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .padding()
                   
                    
              
            })
           
            Spacer()
        }
        
       
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
