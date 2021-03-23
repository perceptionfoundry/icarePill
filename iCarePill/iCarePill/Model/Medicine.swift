//
//  Medicine.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 22/03/2021.
//

import Foundation


struct Medicine: Identifiable, Codable {
    var id : String
    var Title : String
    var Condition : String
    var Apperance : String
    var Strength : Double
    var unit : String
    var DoE : String
    var Stock : Int
    var reminder : Bool
    var status : String
}
