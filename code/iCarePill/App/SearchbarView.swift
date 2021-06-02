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
    @Binding var strengthValue: String
    @Binding var unitValue: String
    @Binding var form: String
    
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
                    selection = value.drugName ?? ""
                    strengthValue = value.strength ?? ""
                    unitValue = value.unit ?? ""
                    
                    
                        if value.form == "TABLET"{
                            NotificationCenter.default.post(name: .tablet, object: nil)
                        }else if value.form == "INJECTABLE"{
                            NotificationCenter.default.post(name: .injection, object: nil)
                        }else{
                            NotificationCenter.default.post(name: .capsule, object: nil)
                        }
                    
                    
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
                        if value.form == "TABLET"{
                            Image("tablet")
                        }else if value.form == "INJECTABLE"{
                            Image("syrup")
                        }else{
                            Image("capsule")
                        }
                    }
                })

            }
        }
        
        .preferredColorScheme(.light)
       
        
    }
}

//struct SearchbarView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchbarView(selection: .constant("fd"))
//    }
//}
