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
        
       

        let request = NSMutableURLRequest(url: NSURL(string: "http://www.zero2cloud.com/iCarePill-RESTAPI/api/search.php?s=\(Keyword)")! as URL,
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
}
