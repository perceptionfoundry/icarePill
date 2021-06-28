//
//  APIViewModel.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 19/05/2021.
//

import Foundation

import SwiftUI
  

class ApiViewModel: ObservableObject{

    
    func SearchDrug(Keyword:String,completion: @escaping(_ status : Bool,_ getData : Drugs,_ err : String?)->() ){
        
       
//        let oldLink = "http://www.zero2cloud.com/iCarePill-RESTAPI/api/search.php?s="
       

        let request = NSMutableURLRequest(url: NSURL(string: "https://www.icarepill.com/v1/api/details?search=drug.name:\(Keyword)")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
//                let httpResponse = response as? HTTPURLResponse
                print(data)
                
                let decoder = JSONDecoder()
                
                do {
                    let result = try decoder.decode(Drugs.self, from: data!)
                    print(result)
                    completion(true, result , nil)
                }catch{
                    print("error is json")
                }
            }
        })

        dataTask.resume()
        
     
    }
    
    
    func SearchNDC(code:String,completion: @escaping(_ status : Bool,_ getData : Drugs?,_ err : String?)->() ){
        
//let link = "http://www.zero2cloud.com/iCarePill-RESTAPI/api/searchndc.php?ndc="
        
        let apiLink = "https://www.icarepill.com/v1/api/details?search=drug.ndc:\(code)"
        
        let request = NSMutableURLRequest(url: (URL(string: apiLink) ?? URL(string: "http://www.icarepill.com/v1/api/details?search=drug.ndc:62559-340-01"))!,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
                completion(false, nil , nil)
            } else {
//                let httpResponse = response as? HTTPURLResponse
                
                print(data)
                
                let decoder = JSONDecoder()
                
                do {
                    let result = try decoder.decode(Drugs.self, from: data!)
                    print(result)
                    completion(true, result , nil)
                }catch{
                    print("error is json")
                    completion(false, nil , nil)
                }
            }
        })

        dataTask.resume()
        
     
    }
}
