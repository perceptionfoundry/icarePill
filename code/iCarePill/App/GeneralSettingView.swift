//
//  GeneralSettingView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 30/03/2021.
//

import SwiftUI

struct GeneralSettingView: View {
    
    @Environment(\.presentationMode) var presentationMode

    
    
    
    var body: some View {
        
        VStack{
           
           
           
            Form{
               
          
                
                        
                        // MARK: - SECTION : Reminder
                        Section(header: Text("Reminders") .font(.custom("Poppins-Bold", size: 18))) {
                          
                            
                          
                                  //********** MEDIATION ***********
                                    Button(action: {
                                        
                                    }, label: {
                                        
                                        HStack {
                                            Image("alarm")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                .padding(.trailing)
                                            
                                            VStack(alignment:.leading){
                                            Text("Medication Reminders")
                                                .font(.custom("Poppins-Medium", size: 14))
                                                .foregroundColor(.black)
                                                
                                                Text("Snooze times, popup, max alarms")
                                                    .font(.custom("Poppins-Medium", size: 10))
                                                    .foregroundColor(Color(.lightGray))
                                            }
                                            Spacer()
                                            
                                        }
                                        
                                    })
                           
                            
                            
                            //********** Morning ***********
                              Button(action: {
                                  
                              }, label: {
                                  
                                  HStack {
                                      Image("alarm")
                                          .resizable()
                                          .scaledToFill()
                                          .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                          .padding(.trailing)
                                      
                                      VStack(alignment:.leading){
                                      Text("Morning Reminders")
                                          .font(.custom("Poppins-Medium", size: 14))
                                          .foregroundColor(.black)
                                          
                                          Text("Snooze times, popup, max alarms")
                                              .font(.custom("Poppins-Medium", size: 10))
                                              .foregroundColor(Color(.lightGray))
                                      }
                                      Spacer()
                                      
                                  }
                                  
                              })
                            
                            
                            
                            //********** Evening ***********
                              Button(action: {
                                  
                              }, label: {
                                  
                                  HStack {
                                      Image("alarm")
                                          .resizable()
                                          .scaledToFill()
                                          .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                          .padding(.trailing)
                                      
                                      VStack(alignment:.leading){
                                      Text("Evening Reminders")
                                          .font(.custom("Poppins-Medium", size: 14))
                                          .foregroundColor(.black)
                                          
                                          Text("Snooze times, popup, max alarms")
                                              .font(.custom("Poppins-Medium", size: 10))
                                              .foregroundColor(Color(.lightGray))
                                      }
                                      Spacer()
                                      
                                  }
                                  
                              })
                       
                          
                            
                            //********** Weekly ***********
                              Button(action: {
                                  
                              }, label: {
                                  
                                  HStack {
                                      Image("alarm")
                                          .resizable()
                                          .scaledToFill()
                                          .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                          .padding(.trailing)
                                      
                                      VStack(alignment:.leading){
                                      Text("Weekly Summary")
                                          .font(.custom("Poppins-Medium", size: 14))
                                          .foregroundColor(.black)
                                          
                                          Text("Snooze times, popup, max alarms")
                                              .font(.custom("Poppins-Medium", size: 10))
                                              .foregroundColor(Color(.lightGray))
                                      }
                                      Spacer()
                                      
                                  }
                                  
                              })
                            
                            
                            
                            
                            //********** Weekend ***********
                              Button(action: {
                                  
                              }, label: {
                                  
                                  HStack {
                                      Image("alarm")
                                          .resizable()
                                          .scaledToFill()
                                          .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                          .padding(.trailing)
                                      
                                      VStack(alignment:.leading){
                                      Text("Weekend Mode")
                                          .font(.custom("Poppins-Medium", size: 14))
                                          .foregroundColor(.black)
                                          
                                          Text("Snooze times, popup, max alarms")
                                              .font(.custom("Poppins-Medium", size: 10))
                                              .foregroundColor(Color(.lightGray))
                                      }
                                      Spacer()
                                      
                                  }
                                  
                              })
                            
                                       
                        }
                        .foregroundColor(.accentColor)
                        
                        
                        
                        
                        // MARK: - SECTION : Notification
                        Section(header: Text("Notification") .font(.custom("Poppins-Bold", size: 18))) {
                          
                            //********** Sound  ***********
                              Button(action: {
                                  
                              }, label: {
                                  
                                  HStack {
                                   
                                    
                                      Text("Sound")
                                          .font(.custom("Poppins-Medium", size: 14))
                                          .foregroundColor(.black)
                                    Spacer()
                                    
                                    ZStack{
                                        Rectangle()
                                         .stroke(Color(#colorLiteral(red: 0.2128868997, green: 0.3307233751, blue: 0.8132392764, alpha: 1)))
                                         .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        Image("tick_selected")
                                            .resizable()
                                            .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    }
                  
                                  }
                                  
                              })
                          
                          
                            //********** Sound  ***********
                              Button(action: {
                                  
                              }, label: {
                                  
                                  HStack {
                                   
                                    
                                      Text("Vibration")
                                          .font(.custom("Poppins-Medium", size: 14))
                                          .foregroundColor(.black)
                                    Spacer()
                                    
                                    ZStack{
                                        Rectangle()
                                         .stroke(Color(#colorLiteral(red: 0.2128868997, green: 0.3307233751, blue: 0.8132392764, alpha: 1)))
                                         .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        Image("tick_selected")
                                            .resizable()
                                            .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    }
                  
                                  }
                                  
                              })
                            
                                       
                        }
                        .foregroundColor(.accentColor)

                       
                        
                        
                        // MARK: - SECTION : Time Zone Settings
                        Section(header: Text("Time Zone Setting") .font(.custom("Poppins-Bold", size: 18))) {
                          
                            
                          
                            //********** Sound  ***********
                              Button(action: {
                                  
                              }, label: {
                                  
                                  HStack {
                                   
                                    
                                      Text("Automatic time zone selection")
                                          .font(.custom("Poppins-Medium", size: 14))
                                          .foregroundColor(.black)
                                    Spacer()
                                    
                                    ZStack{
                                        Rectangle()
                                         .stroke(Color(#colorLiteral(red: 0.2128868997, green: 0.3307233751, blue: 0.8132392764, alpha: 1)))
                                         .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        Image("tick_selected")
                                            .resizable()
                                            .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    }
                  
                                  }
                                  
                              })
                            
                                       
                        }
                        .foregroundColor(.accentColor)
                        
                        
                        // MARK: - SECTION : Measurements
                        Section(header: Text("Measurements") .font(.custom("Poppins-Bold", size: 18))) {
                          
                            
                          
                            //********** Unit  ***********
                              Button(action: {
                                  
                              }, label: {
                                  
                                  HStack {
                                   
                                    
                                      Text("Unit")
                                          .font(.custom("Poppins-Medium", size: 14))
                                          .foregroundColor(.black)
                                    Spacer()
                                    
                  
                                  }
                                  
                              })
                               
                           
                          
                            
                    
                            
                                       
                        }
                        .foregroundColor(.accentColor)
                        
                    
                
                
               
               
                
                
              } .foregroundColor(.accentColor)
              
           
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
                            Text("General Settings")
                                .font(.custom("Poppins-Medium", size: 18))
                                .foregroundColor(.accentColor)
                           
                        }
                    }
                }
        
    }
}

struct GeneralSettingView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingView()
    }
}
