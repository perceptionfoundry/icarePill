//
//  SearchBar.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 26/04/2021.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {

    @Binding var text : String
  
    
    class Coordinator: NSObject, UISearchBarDelegate{
        @Binding var text : String
        
        init(text: Binding<String>){
            _text = text
        }
        
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
            text = searchText
        }
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.becomeFirstResponder()
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}
