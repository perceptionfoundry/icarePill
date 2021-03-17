//
//  TypeListView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 17/03/2021.
//

import SwiftUI

struct TypeListView: View {
    
    let type = ["US", "UK", "PK"]
    @State var selection: String?
    
    
    var body: some View {
        
        List(type, id :\.self, selection: $selection){
            
            Text($0)

        }.onTapGesture {
            print(selection)
        }
        
        
    }
}

struct TypeListView_Previews: PreviewProvider {
    static var previews: some View {
        TypeListView()
    }
}
