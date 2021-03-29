//
//  NotesView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 25/03/2021.
//

import SwiftUI

struct NotesView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var count = 1
    
    @State var isNext = false
    
    var body: some View {
        VStack{
       
            if count == 0{
        NoRecordView(imageName: "no_doctor")
            }
            else{
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                LazyVStack(content: {
                    ForEach(1...10, id: \.self) { count in
                       
                        HStack{
                            VStack(alignment: .leading, spacing: 10) {
                           Text("Emergency")
                            .font(.custom("Poppins-Medium", size: 12))
                            .foregroundColor(.accentColor)
                            
                            
                            Text("Note Text")
                             .font(.custom("Poppins-Medium", size: 16))
                             .foregroundColor(.black)
                            
                            Text("Feb, 3, 2021")
                             .font(.custom("Poppins-Medium", size: 12))
                                .foregroundColor(Color(.lightGray))
                        }
                            Spacer()
                            Image("forward")
                                .resizable()
                                .frame(width: 7, height: 14, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                        .padding()
                        
                        .background(RoundedRectangle(cornerRadius: 5)
                                       
                                        .foregroundColor(.white)
                                        .frame(height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        
                                        .shadow(radius: 4 ))
                        
                           
                       
                      
                    }.padding(.horizontal)
                    .padding(.vertical, 7)
                })
                
                }
                
                
              
                

            }
            Spacer()
            //MARK: Done Button
            
            NavigationLink(
                destination: AddNoteView(),
                isActive: $isNext,
                label: {
                    Button(action: {
                        
                        isNext.toggle()

                        
                    }, label: {
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color(#colorLiteral(red: 0.2117647059, green: 0.3294117647, blue: 0.8156862745, alpha: 1)))
                                .frame(width: 250, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding()
                            
                            Text("Add Note")
                                .foregroundColor(.white)
                                .font(.custom("Poppins-Medium", size: 16))
                            
                        }
                        
                    })
                })
                   
            
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
                            Text("Notes")
                                .font(.custom("Poppins-Medium", size: 18))
                                .foregroundColor(.accentColor)
                           
                        }
                    }
                }
    }
        
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}
