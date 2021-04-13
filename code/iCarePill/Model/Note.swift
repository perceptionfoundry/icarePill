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
    var noteDate : String
    var noteTime : String
   




init(Note:String,Type: String,Date:String,Time:String){
    self.id  = ""
    self.note = Note
    self.noteType = Type
    self.noteDate = Date
    self.noteTime = Time
    }



func getDict() -> [String:String]{
    
    return[ "id"  : "",
            "note" : self.note,
            "noteType" : self.noteType,
            "noteDate" : self.noteDate,
            "noteTime" : self.noteTime,
          
             ]
}

}
