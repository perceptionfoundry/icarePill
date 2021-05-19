//
//  Medicines.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 19, 2021

import Foundation

struct Drugs : Codable {

        let records : [Record]?

        enum CodingKeys: String, CodingKey {
                case records = "records"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                records = try values.decodeIfPresent([Record].self, forKey: .records)
        }

}
