//
//  AppointmentsView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 25/03/2021.
//

import SwiftUI

struct AppointmentsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var count = 0
    
    @State var isNext = false
    
    
    var body: some View {
        VStack{
       
            if count == 0{
        NoRecordView(imageName: "no_appointment")
            }
            else{
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
                LazyVStack(content: {
                    ForEach(1...10, id: \.self) { count in
                        DoctorCellView()
                            
                    }.padding(.horizontal)
                    .padding(.vertical, 7)
                })
                
                }
                
                
              
                

            }
            Spacer()
            //MARK: Done Button
            
            NavigationLink(
                destination: AddAppointmentView(),
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
                            
                            Text("Add Appointment")
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
                            Text("Appointments")
                                .font(.custom("Poppins-Medium", size: 18))
                                .foregroundColor(.accentColor)
                           
                        }
                    }
                }
    }
        
}

struct AppointmentsView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentsView()
    }
}

struct DoctorCellView: View {
    var body: some View {
        HStack{
            Image("sample")
                .resizable()
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .scaledToFill()
            
            VStack(alignment:.leading){
                Text("Dr Name")
                    .font(.custom("Poppins-Medium", size: 15))
                    .foregroundColor(.black)
                Text("Specialist")
                    .font(.custom("Poppins-Medium", size: 11))
                    .foregroundColor(.accentColor)
                    .padding(.bottom, 5)
                
                VStack(alignment:.center, spacing: 2){
                    Text("Appointment Time")
                        .font(.custom("Poppins-Medium", size: 10))
                        .foregroundColor(.gray)
                    
                    HStack{
                        Image("location")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 10, height:10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("Location")
                            .font(.custom("Poppins-Medium", size: 10))
                            .foregroundColor(.gray)
                        
                    }
                }
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .frame(height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(radius: 2)
        )
    }
}
