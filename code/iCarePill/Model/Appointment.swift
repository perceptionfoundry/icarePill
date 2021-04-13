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
    var appointmentDate : Bool
    var appointmentTime : String
    var location : String
    var note : String
    

}
