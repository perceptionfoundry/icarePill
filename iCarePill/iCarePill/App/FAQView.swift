//
//  FAQView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 25/03/2021.
//

import SwiftUI

struct FAQView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var isFaq_1 = false
    @State var isFaq_2 = false
    @State var isFaq_3 = false
    @State var isFaq_4 = false
    @State var isFaq_5 = false
    
    
    var body: some View {
        VStack{
            
            ScrollView{
                LazyVStack(content: {
                    ForEach(1...5, id: \.self) { count in
                        FAQCellView(expandState: $isFaq_1).tag(count)
                    }
                })
            }
         

           

            
         

            Spacer()
            
           

            
        }.padding()
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
                            Text("FAQ")
                                .font(.custom("Poppins-Medium", size: 18))
                                .foregroundColor(.accentColor)
                           
                        }
                    }
                }
    }
        
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}

struct FAQCellView: View {
    
    
    @Binding var expandState : Bool
    
    var body: some View {
        GroupBox{
            DisclosureGroup(
                "What is app??")
                {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velesse cillumdolore eu fugiat nulla pariatur. Excepteur sint.")
                        .font(.custom("Poppins-Regular", size: 12))
                    
                }
            
        }   .font(.custom("Poppins-Medium", size: 18))
        .foregroundColor(.black)
    }
}
