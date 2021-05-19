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
    
    @State private var names = [""]
    @State var allRecord = [Record]()
    
    var body: some View {
        
        List(){

            SearchBar(text: $searchTerm).onChange(of: searchTerm, perform: { value in
                
                print("*************")
                print(value)
                print("*************")
                let VM = ApiViewModel()
                
                VM.SearchDrug(Keyword: searchTerm) { status, values, err in
                    
                    if status{
                        
                        print(values)
                        names.removeAll()
                        allRecord.removeAll()
                        
                        
                        
                        values.records?.forEach({ Record in
                            names.append(Record.drugName!)
                            self.allRecord.append(Record)
                        })
                        
                    }
                    
                }
            })

            
            ForEach(allRecord, id: \.self){ value in

              
                
                Button(action: {
                    selection = value.drugName!
                    
                    print(selection)
                    
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    HStack {
                        VStack(alignment:.leading){
                            Text(value.drugName!)
                                .font(.custom("Poppins-Medium", size: 12))
                                .foregroundColor(.accentColor)
                                .padding(.top)
                            
                            Text(value.strength!)
                                .font(.custom("Poppins-Medium", size: 9))
                                .foregroundColor(.gray)
                                .padding(.top)
                        }
                        Spacer()
                        Circle()
                            .fill(Color.red)
                            .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                })

            }
        }
        
        .preferredColorScheme(.light)
       
        
    }
}

struct SearchbarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchbarView(selection: .constant("fd"))
    }
}
