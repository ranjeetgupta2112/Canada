//
//  FactsService.swift
//  Canada
//
//  Created by Sweet on 25/07/18.
//  Copyright © 2018 Sweet. All rights reserved.
//

import UIKit

class FactsService: NSObject, URLSessionDelegate,URLSessionTaskDelegate{
    

    //var factsJsonData:
    func fetchJsonObject(){
        let facctsJsonString: String = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        let factsUrl = URL(string: facctsJsonString)
        let urlRequest = URLRequest(url: factsUrl!)
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            print("data fetched :", data)
            let stringData = NSString.init(data: data!, encoding: String.Encoding.ascii.rawValue)
            print("data prining : ", stringData)

            let myNSData = stringData?.data(using: String.Encoding.utf8.rawValue)!
            print("data prining again : ", myNSData)

            guard error == nil else {
                print("Error fetcjing data :",error!)
                return
            }

        
        }
        task.resume()
    }
    
//      func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data){
//        // make sure we got data

//    }
    


    
    
}
