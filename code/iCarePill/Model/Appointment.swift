//
//  Appointment.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 13/04/2021.
//

import Foundation



class Appointment : Identifiable, Codable{
    var id : String
    var title : String
    var doctorName : String
    var appointmentDate : String
    var appointmentTime : String
    var location : String
    var note : String
    var reminder = false
    
    
    
    init(Title:String, Doctor: String,Date:String,Time:String,Location:String, Note: String, Reminder : Bool){
        self.id  = ""
        self.title = Title
        self.doctorName = Doctor
        self.appointmentDate = Date
        self.appointmentTime = Time
        self.location = Location
        self.note = Note
        self.reminder = Reminder
        
    }
    
    
    
    func getDict() -> [String:Any]{
        
        return[ "id"  : "",
                "title" : self.title,
                "doctorName" : self.doctorName,
                "appointmentDate" : self.appointmentDate,
                "appointmentTime" : self.appointmentTime,
                "location" : self.location,
                "note" : self.note,
                "reminder":self.reminder]
    }

}
