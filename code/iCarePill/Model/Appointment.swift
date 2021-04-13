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
    var doctorId : String
    var doctorName : String
    var doctorImage : String
    var doctorSpeciality : String
    var appointmentDate : String
    var appointmentTime : String
    var location : String
    var note : String
    var reminder = false
    
    
    
    init(Title:String, DoctorName: String,DoctorID: String, DoctorSpecialize:String,DoctorImage:String,Date:String,Time:String,Location:String, Note: String, Reminder : Bool){
        self.id  = ""
        self.title = Title
        self.doctorId = DoctorID
        self.doctorSpeciality = DoctorSpecialize
        self.doctorName = DoctorName
        self.doctorImage = DoctorImage
        self.appointmentDate = Date
        self.appointmentTime = Time
        self.location = Location
        self.note = Note
        self.reminder = Reminder
        
    }
    
    
    
    func getDict() -> [String:Any]{
        
        return[ "id"  : "",
                "title" : self.title,
                "doctorId":self.doctorId,
                "doctorName" : self.doctorName,
                "doctorSpeciality": self.doctorSpeciality,
                "doctorImage":self.doctorImage,
                "appointmentDate" : self.appointmentDate,
                "appointmentTime" : self.appointmentTime,
                "location" : self.location,
                "note" : self.note,
                "reminder":self.reminder]
    }

}
