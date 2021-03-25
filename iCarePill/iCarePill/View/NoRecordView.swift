//
//  NoRecordView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 25/03/2021.
//

import SwiftUI

struct NoRecordView: View {
   
    var imageName :String
    
    var body: some View {
        
        VStack{
      Spacer()
        HStack{
            Spacer()
        Image(imageName)
            .resizable()
            .frame(width: 200, height: 160, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .scaledToFill()
           Spacer()
        }
            Spacer()
    }
    }
}

struct NoRecordView_Previews: PreviewProvider {
    static var previews: some View {
        NoRecordView(imageName: "no_appointment")
            .previewLayout(.sizeThatFits)
    }
}
