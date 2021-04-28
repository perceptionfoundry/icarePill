//
//  PasscodeView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 30/03/2021.
//

import SwiftUI

struct PasscodeView: View {
    
    @Environment(\.presentationMode) var presentationMode

    
    
    
    var body: some View {
        
        VStack{
           
           
            HStack{
                
                Spacer()
                //FIRST NUMBER
                TextField("", text: .constant("1"))
                    .frame(width: 12, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .frame(width: 60, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .shadow(radius: 3)
                    )
                    
                Spacer()
                //SECOND NUMBER
                TextField("", text: .constant("5"))
                    .frame(width: 12, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .frame(width: 60, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .shadow(radius: 3)
                    )
                Spacer()
                
                //THIRD NUMBER
                TextField("", text: .constant("2"))
                    .frame(width: 12, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .frame(width: 60, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .shadow(radius: 3)
                    )
                Spacer()
                
                //FOUR NUMBER
                TextField("", text: .constant("8"))
                    .frame(width: 12, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .frame(width: 60, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .shadow(radius: 3)
                    )
                   
                Spacer()
            }
            .foregroundColor(.accentColor)
            .font(.custom("Poppins-Bold", size: 20))
            .padding(.top,140)
            .padding(.bottom, 50)
           
            Text("Enter the verification code sent \n in your email address")
                .multilineTextAlignment(.center)
                .font(.custom("Poppins-Medium", size: 16))
                .foregroundColor(.gray)
              
            Spacer()
           
    }
        .preferredColorScheme(.light)
        .background(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing:
        
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                   Text("Cancel")
                                }
        
        )
        .navigationBarTitleDisplayMode(.inline)
                .toolbar {
              
                    
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("Verification Code")
                                .font(.custom("Poppins-Medium", size: 18))
                                .foregroundColor(.accentColor)
                           
                        }
                    }
                }
        
    }
}

struct PasscodeView_Previews: PreviewProvider {
    static var previews: some View {
        PasscodeView()
    }
}
