//
//  User.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 19/03/2021.
//

import Foundation



class User: Identifiable, Codable{
    var id : String!
    var dpImage : String!
    var firstName : String!
    var lastName  : String!
    var type : String!
    var gender : String!
    var dob : String!
    var zipCode : String!
    
//    init( id : String, first : String, last : String, type : String,gender : String, dob : String, zip : String){
//        
//        self.id = ""
//        self.firstName = first
//        self.lastName = last
//        self.type = type
//        self.gender = gender
//        self.dob = dob
//        self.zipCode = zip
//        
//    }
}
