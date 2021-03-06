//
//  Record.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 19, 2021

import Foundation

struct Record : Codable, Hashable{
    
    let activeIngredient : String?
    let drugName : String?
    let form : String?
    let strength : String?
    let unit : String?

    enum CodingKeys: String, CodingKey {
            case activeIngredient = "ActiveIngredient"
            case drugName = "DrugName"
            case form = "Form"
            case strength = "Strength"
            case unit = "Unit"
    }

    init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            activeIngredient = try values.decodeIfPresent(String.self, forKey: .activeIngredient)
            drugName = try values.decodeIfPresent(String.self, forKey: .drugName)
            form = try values.decodeIfPresent(String.self, forKey: .form)
            strength = try values.decodeIfPresent(String.self, forKey: .strength)
            unit = try values.decodeIfPresent(String.self, forKey: .unit)
    }

}





//{
//
//        let activeIngredient : String?
//        let drugName : String?
//        let strength : String?
//
//        enum CodingKeys: String, CodingKey {
//                case activeIngredient = "ActiveIngredient"
//                case drugName = "DrugName"
//                case strength = "Strength"
//        }
//
//        init(from decoder: Decoder) throws {
//                let values = try decoder.container(keyedBy: CodingKeys.self)
//                activeIngredient = try values.decodeIfPresent(String.self, forKey: .activeIngredient)
//                drugName = try values.decodeIfPresent(String.self, forKey: .drugName)
//                strength = try values.decodeIfPresent(String.self, forKey: .strength)
//        }
//
//}
