//
//  DayReminderCellView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 28/04/2021.
//

import SwiftUI



struct DayReminderCellView: View{
    
    var ImageTitle: String
    var MedicineTitle : String
    var Dose : String
    var Time : String
    var status : String
    
    var body: some View {
        VStack{
            
            ZStack{
                
                
                
                
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                    .frame(height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                
                HStack{
                    Image(ImageTitle)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    VStack(alignment:.leading){
                        Text(MedicineTitle)
                            .font(.custom("Poppins-Medium", size: 12))
                            .foregroundColor(Color(#colorLiteral(red: 0.4979991317, green: 0.4980617762, blue: 0.4979779124, alpha: 1)))
                        
                        Text(Dose)
                            .font(.custom("Poppins-Medium", size: 10))
                            .foregroundColor(Color(#colorLiteral(red: 0.6626930237, green: 0.662774384, blue: 0.6626655459, alpha: 1)))
                        
                        Text(Time)
                            .font(.custom("Poppins-Medium", size: 10))
                            .foregroundColor(Color(#colorLiteral(red: 0.6626930237, green: 0.662774384, blue: 0.6626655459, alpha: 1)))
                        
                        
                        
                    }
                    
                    Spacer()
                    
                    Image(status)
                }.padding()
                
                
            }
        }
    }
}


struct DayReminderCellView_Previews: PreviewProvider {
    static var previews: some View {
        DayReminderCellView(ImageTitle: "tablet", MedicineTitle: "title", Dose: "dose", Time: "time", status: "taken")
            .previewLayout(.sizeThatFits)
    }
}
