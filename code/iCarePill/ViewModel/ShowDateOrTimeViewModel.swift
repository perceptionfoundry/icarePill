//
//  ShowDateOrTimeViewModel.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 26/03/2021.
//

import Foundation
import SwiftUI


struct ShowDateOrTimeViewModel{
    
    @Binding var time: Date
    @Binding var time_String: String
    @Binding var date: Date
    @Binding var date_String: String
    
    
    func showTimePickerAlert() {
        let alertVC = UIAlertController(title: "\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .alert)
            let datePicker: UIDatePicker = UIDatePicker()
            datePicker.datePickerMode = .time
            datePicker.preferredDatePickerStyle = .wheels
        
            alertVC.view.addSubview(datePicker)

            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.time = datePicker.date
                
                
                let formattor = DateFormatter()
                formattor.dateFormat = "hh:mm a"
                
                time_String = formattor.string(from: time)
            }
            alertVC.addAction(okAction)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alertVC.addAction(cancelAction)

            if let viewController = UIApplication.shared.windows.first?.rootViewController {
                viewController.present(alertVC, animated: true, completion: nil)
            }
        }
    
    func showDatePickerAlert() {
        let alertVC = UIAlertController(title: "", message: nil, preferredStyle: .alert)
            let datePicker: UIDatePicker = UIDatePicker()
            datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        
            alertVC.view.addSubview(datePicker)

            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.date = datePicker.date
                
                
                let formattor = DateFormatter()
                formattor.dateFormat = "MM/dd/yyyy"
                
                date_String = formattor.string(from: date)
            }
            alertVC.addAction(okAction)
           

            if let viewController = UIApplication.shared.windows.first?.rootViewController {
                viewController.present(alertVC, animated: true, completion: nil)
            }
        }
    
}
