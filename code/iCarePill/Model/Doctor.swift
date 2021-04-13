//
//  Doctor.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 13/04/2021.
//

import Foundation



class Doctor : Identifiable, Codable{
    var id : String
    var name : String
    var speciality : String
    var mobile : String
    var office : String
    var location : String
    var image : String
    
    
    init(Name:String, Speciality: String,Mobile:String,Office:String,Location:String, ImageURL: String){
        self.id  = ""
        self.name = Name
        self.speciality = Speciality
        self.mobile = Mobile
        self.office = Office
        self.location = Location
        self.image = ImageURL
    }
    
    
    
    func getDict() -> [String:String]{
        
        return["id":"",
               "name":name,
               "speciality":speciality,
               "mobile":mobile,
               "office":office,
               "location":location,
               "image":image]
        
    }

}
