//
//  multiLiinetextField.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 26/03/2021.
//

import SwiftUI



struct MultilineTextView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.font =  UIFont(name:"Poppins-Medium", size: 16)
        view.textColor = UIColor(Color(#colorLiteral(red: 0.2117647059, green: 0.3294117647, blue: 0.8156862745, alpha: 1)))
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
