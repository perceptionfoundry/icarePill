//
//  AddNoteView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 29/03/2021.
//

import SwiftUI

struct AddNoteView: View {
    
    @Environment(\.presentationMode) var presentationMode
    

    @State var NoteValue = ""
    @State var timeValue = Date()
    @State var timeValue_String = "hh:mm"
    @State var dateValue = Date()
    @State var dateValue_String = "yyyy/mm/dd"
    
    @State private var selectedStrength = "Emergency"
    let strengthValue = ["Emergency", "Normal"]
    @State  var isExpand  = false
    @State  var  isNext = false
    
    
    
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20){
            
          
               
                //MARK:  NOTE
                VStack(alignment: .leading){
             
                   
                    HStack{
                    ZStack{
                        Rectangle()
                            .frame(height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                        
                      
    //
                            MultilineTextView(text: $NoteValue)
                                .foregroundColor(.accentColor)
                                .font(.custom("Poppins-Medium", size: 14))
                                .foregroundColor(.accentColor)
                                .padding()
                      
                        
                       
                        
                    }
                     
                   
                        
                    }
                }
          
            //MARK: Date & Time
      
                
                //MARK: DATE
                
                Button(action: {
                    let vm = ShowDateOrTimeViewModel(time: $timeValue, time_String: $timeValue_String, date: $dateValue, date_String: $dateValue_String)
                    
                    vm.showDatePickerAlert()
                }, label: {
                    VStack(alignment: .leading){
                      
                       
                        HStack{
                            ZStack{
                                Rectangle()
                                    .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.white)
                                    .shadow(radius: 4)
                                
                                HStack{
                                    Image("calendar_bold")
                                        .padding(.leading)
                                    
                                    Text("Date")
                                        .foregroundColor(Color(.lightGray))
                                        .font(.custom("Poppins-Medium", size: 14))
                                        .padding()
                                    Spacer()
                                    Text(dateValue_String)
                                        .foregroundColor(.accentColor)
                                        .font(.custom("Poppins-Medium", size: 14))
                                        .padding()
                                }
                                
                               
                                
                            }
                             
                           
                                
                            }
                    
                    
                    }
                })
              
                
                
                
                //MARK: TIME
                
                Button(action: {
                    let vm = ShowDateOrTimeViewModel(time: $timeValue, time_String: $timeValue_String, date: $dateValue, date_String: $dateValue_String)
                    
                    vm.showTimePickerAlert()
                }, label: {
                    VStack(alignment: .leading){
                      
                       
                                HStack{
                                    ZStack{
                                        Rectangle()
                                            .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .foregroundColor(.white)
                                            .shadow(radius: 4)
                                        
                                      
                                        HStack{
                                            Image("alarm")
                                                .padding(.leading)
                                            Text("Time")
                                                .foregroundColor(Color(.lightGray))
                                                .font(.custom("Poppins-Medium", size: 14))
                                                .padding()
                                            Spacer()
                                            Text(timeValue_String)
                                                .foregroundColor(.accentColor)
                                                .font(.custom("Poppins-Medium", size: 14))
                                                .padding()
                                           
                                        }
                                      
                                        
                                       
                                        
                                    }
                                     
                                   
                                        
                                    }
                            
                        
                    
                   
                    }
                })
               
               
                
                //MARK: TYPE
                VStack(alignment: .leading){
                  
                   
                    HStack{
                        Image("drugs")
                            .padding(.leading)
                        Text("Type")
                            .foregroundColor(Color(.lightGray))
                            .font(.custom("Poppins-Medium", size: 14))
                            .padding()
                        
                      
                        DisclosureGroup("\t\t\t\t\(selectedStrength)", isExpanded: $isExpand) {
                            
                            VStack{
                                ForEach(strengthValue, id:\.self){ value  in
                                    
                                    Text("\(value)")
                                        .foregroundColor(.accentColor)
                                        .padding(.bottom)
                                        .padding(.top)
                                        .onTapGesture {
                                            self.selectedStrength = value
                                            
                                            withAnimation{
                                                self.isExpand.toggle()
                                            }
                                       
                                        }
                                    
                                }
                            }
                        }.foregroundColor(.accentColor)
                        .font(.custom("Poppins-Medium", size: 13))
                        .padding()
                        
                        
                  
                    

                }.background(
                    Rectangle()
//                                .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                )
                
                
                }
        
    
                
      
            
                Spacer()
            
            
            
            
                
                //MARK: Next Button
                
              
                        Button(action: {
                            
                            
                            presentationMode.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color(#colorLiteral(red: 0.2117647059, green: 0.3294117647, blue: 0.8156862745, alpha: 1)))
                                    .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding()
                                
                                Text("Done")
                                    .foregroundColor(.white)
                                    .font(.custom("Poppins-Medium", size: 16))
                                
                            }
                            
                        })
                 
               
            
            
         
        }.padding()
    }
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
                            Text("Add Note")
                                .font(.custom("Poppins-Medium", size: 18))
                                .foregroundColor(.accentColor)
                           
                        }
                    }
                }
    }
    
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}
