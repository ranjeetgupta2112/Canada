//
//  FactsService.swift
//  Canada
//
//  Created by Sweet on 25/07/18.
//  Copyright © 2018 Sweet. All rights reserved.
//

import UIKit

protocol FetchJsonObjectDelegate: AnyObject {
    func UpdateFactsDataInUI(factsData : FactsModel)
    func serviceFailedWithError(error : Error)
}

class FactsService: NSObject, URLSessionDelegate,URLSessionTaskDelegate{
    
    weak var delegate:FetchJsonObjectDelegate?
    
    func fetchJsonObject(){
        let facctsJsonString: String = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        let factsUrl = URL(string: facctsJsonString)
        let urlRequest = URLRequest(url: factsUrl!)
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        // make the request
        let task = session.dataTask(with: urlRequest)
        {
            (data, response, error) in
            // check for any errors
            if (data == nil) {
              self.delegate?.serviceFailedWithError(error: error!)
            } else{
            let stringData = NSString.init(data: data!, encoding: String.Encoding.ascii.rawValue)
            let encodedData = stringData?.data(using: String.Encoding.utf8.rawValue)!
            do{
                let factsModelData : FactsModel = try FactsModel.init(data: encodedData!)
                print("Facts Model  class data",factsModelData)
                self.delegate?.UpdateFactsDataInUI(factsData: factsModelData)
            }
            catch{
                self.delegate?.serviceFailedWithError(error: error)
            }
            guard error == nil else {
                self.delegate?.serviceFailedWithError(error: error!)
                return
            }
            return
        }
        }
        task.resume()
    }
   
}
