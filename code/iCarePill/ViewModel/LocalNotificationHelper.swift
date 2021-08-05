//
//  LocalNotificationHelper.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 05/08/2021.
//

import Foundation
import UserNotifications


class localNotificationHelper{
    
    func scheduleNotification(title: String, body: String, time:String){
        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert,.badge,.sound]) { granted, err in
            if granted{
                print("GRANTED")
            }else{
                print("DENIED")
            }
        }
        //************ 2. Create the notification Content
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData":"icarePill"]
        content.sound = .default
        
        //************* 3. Trigger

        
        let dateString = time
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "hh:mm a"
        let dateObj = dateFormatter.date(from: dateString)

        print("Dateobj: \(dateFormatter.string(from: dateObj!))")
        //
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: dateObj!)
        let minute = calendar.component(.minute, from: dateObj!)
       
        var dateComponents = DateComponents()
       
        
        print(hour, minute)
        
        dateComponents.hour = hour
        dateComponents.month = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        
        //********* 4. Create Request
        
        let uuidString = UUID().uuidString
        let request  = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // 5. register Notification
        
        center.add(request)
    }
    
    
    
}
