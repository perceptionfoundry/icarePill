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
    
    @State private var selectedType = "Emergency"
    let typeValue = ["Emergency", "Normal"]
    @State  var isExpand  = false
    @State  var  isNext = false
    
    @State  var  isAlert = false
    @State  var  isViewDisable = false
    @State  var  isSave = false
    @State  var  alertTitle = ""
    @State  var  alertMessage = ""
    
    
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
                            TextEditor(text: $NoteValue)
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
                        
                      
                        DisclosureGroup("\t\t\t\t\(selectedType)", isExpanded: $isExpand) {
                            
                            VStack{
                                ForEach(typeValue, id:\.self){ value  in
                                    
                                    Text("\(value)")
                                        .foregroundColor(.accentColor)
                                        .padding(.bottom)
                                        .padding(.top)
                                        .onTapGesture {
                                            self.selectedType = value
                                            
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
                            isSave = true
                            isViewDisable = true
                            
                            if NoteValue.isEmpty == false && dateValue_String != "yyyy/mm/dd" && timeValue_String != "hh:mm"{

                                let noteInfo = Note(Note: NoteValue, Type: selectedType, Date: dateValue_String, Time: timeValue_String)

                                let noteDict = noteInfo.getDict()

                                let firebaseVM = FirebaseViewModel()

                                firebaseVM.CreateCollection(collectionTitle: "Notes", subCollectionTitle: "lists", uploadData: noteDict) { (status, err) in

                                    if status{

                                        presentationMode.wrappedValue.dismiss()
                                    }
                                    else{
                                        self.alertTitle = "Server Error!"
                                        self.alertMessage = "\(err ?? "unknown error")"
                                        isAlert.toggle()
                                        isSave = false
                                        isViewDisable = false
                                    }
                                }
                            }else{

                                self.alertTitle = "Textfield Empty"
                                self.alertMessage = "Please assure all textfield are filled.."
                                isAlert.toggle()
                                isSave = false
                                isViewDisable = false
                            }
//
                            
                        }, label: {
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color(#colorLiteral(red: 0.2117647059, green: 0.3294117647, blue: 0.8156862745, alpha: 1)))
                                    .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding()
                                
                                Text("Done")
                                    .foregroundColor(.white)
                                    .font(.custom("Poppins-Medium", size: 16))
                                
                            }.overlay(
                                
                                ProgressView()
                                        .colorScheme(.dark)
                                        .padding(.trailing, 30)
                                    .opacity(isSave ? 1 : 0)
                                
                               
                                
                                        , alignment: .trailing)
                            
                        })
                 
               
            
            
         
        }.padding()
    }
        .allowsHitTesting(!isViewDisable)
        .alert(isPresented: $isAlert, content: {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Dismiss")))
        })
        .preferredColorScheme(.light)
        .background(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
//        .edgesIgnoringSafeArea(.bottom)
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
