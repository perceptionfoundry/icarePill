//
//  MoreView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 25/03/2021.
//

import SwiftUI

struct MoreView: View {
    
    
    @State var isAppointment = false
    @State var isNote = false
    @State var isReport = false
    @State var isDoctor = false
    @State var isSetting = false
    @State var isSupport = false
    @State var isShare = false
    
    var body: some View {
        
        
        VStack{
            //MARK: Top Part
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
                    
               
                   
                }.background(
                    Rectangle()
                        .foregroundColor(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
                        .shadow(radius: 6 )
                        .frame(height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .edgesIgnoringSafeArea(.all)
                        )
                .padding(.bottom, 30)
               

            //MARK: APPOINTMENTS
            
            NavigationLink(
                destination: AppointmentsView(),
                isActive: $isAppointment,
                label: {
                    Button(action: {
                        isAppointment.toggle()
                    }, label: {
                        
                        MoreButtonView(icon: "appointment", title: "Appointments")
                    }).padding(.horizontal)
                    .padding(.bottom, 10)
                })
            
           
            
            
            //MARK: NOTE
            
            NavigationLink(
                destination: NotesView(),
                isActive: $isNote,
                label: {
                    Button(action: {
                        isNote.toggle()
                    }, label: {
                        
                        MoreButtonView(icon: "notes", title: "Notes")
                    }).padding(.horizontal)
                    .padding(.bottom, 10)
                })
            
           
            
            
            //MARK: REPORT
            NavigationLink(
                destination: Text("report"),
                isActive: $isReport,
                label: {
                    Button(action: {
                        isReport.toggle()
                    }, label: {
                        
                        MoreButtonView(icon: "report", title: "Reports")
                    }).padding(.horizontal)
                    .padding(.bottom, 10)
                })
            
         
            
            
            //MARK: DOCTOR
            NavigationLink(
                destination: DoctorsView(),
                isActive: $isDoctor,
                label: {
                    Button(action: {
                        isDoctor.toggle()
                    }, label: {
                        
                        MoreButtonView(icon: "doctor", title: "Doctors")
                    })
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                })
            
           
            
            //MARK: SETTING
            NavigationLink(
                destination: SettingView(),
                isActive: $isSetting,
                label: {
                    Button(action: {
                        isSetting.toggle()
                    }, label: {
                        
                        MoreButtonView(icon: "settings", title: "Settings")
                    })
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                })
            
           
            
            //MARK: HELP & SUPPORT
            NavigationLink(
                destination: FAQView(),
                isActive: $isSupport,
                label: {
                    Button(action: {
                        isSupport.toggle()
                    }, label: {
                        
                        MoreButtonView(icon: "help", title: "Help & Support")
                    }).padding(.horizontal)
                    .padding(.bottom, 10)                })
            
           
            
            
            //MARK: SHARE
          
            
            Button(action: {
                isShare.toggle()
            }, label: {
                
                MoreButtonView(icon: "share", title: "Share")
            }).padding(.horizontal)
            
            
            
            Spacer()
    }.navigationBarHidden(true)
        .background(Color(#colorLiteral(red: 0.9724746346, green: 0.9725909829, blue: 0.9724350572, alpha: 1)))
        .edgesIgnoringSafeArea(.bottom)
        
        
       
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}


//MARK: SUBVIEWS

struct MoreButtonView: View {
    
    var icon : String
    var title : String
    var body: some View {
        HStack{
            
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text(title)
                .font(.custom("Poppins-Medium", size: 15))
                .foregroundColor(.black)
            
            Spacer()
            Image("arrow_next")
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.white)
                .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(radius: 2)
            
        )
    }
}
