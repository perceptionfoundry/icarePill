//
//  Note.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 13/04/2021.
//

import Foundation


class Note : Identifiable, Codable{
    var id : String
    var note : String
    var noteType : String
    var noteDate : Bool
    var noteTime : String
    var location : String
}
