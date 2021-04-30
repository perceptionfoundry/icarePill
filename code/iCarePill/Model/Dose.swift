//
//  Dose.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 29/04/2021.
//

import Foundation



class Dose: Identifiable, Codable{
    var id : String!
    var MedicineID : String?
    var dateInfo : String?
    var status : String?
    var week : Int?
    var month : Int?
}
