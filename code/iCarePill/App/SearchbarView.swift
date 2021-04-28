//
//  SearchbarView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 26/04/2021.
//

import SwiftUI


struct SearchbarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var searchTerm: String = ""
    @Binding var selection : String
    
    let names = ["Calpol", "Histop", "Panadol", "fucidin", "Actifad", "sinofarm", "dexa","delta"]
    
    
    var body: some View {
        
        List(){

            SearchBar(text: $searchTerm)

            ForEach(self.names.filter {
                self.searchTerm.isEmpty ? true : $0.localizedCaseInsensitiveContains(self.searchTerm)
            }, id:\.self){ name in
            
                    Button(action: {
                        selection = name
                        
                        print(selection)
                        
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                    Text(name)
                            .font(.custom("Poppins-Medium", size: 12))
                            .foregroundColor(.accentColor)
                            .padding(.top)
                    })
               
            }
        }
        

       
        
    }.preferredColorScheme(.light)
}

struct SearchbarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchbarView(selection: .constant("fd"))
    }
}
