//
//  classes&functions.swift
//  weather_App
//
//  Created by osvaldo lopez on 11/20/16.
//  Copyright © 2016 osvaldo lopez. All rights reserved.
//

import UIKit

class httpRequest {
    private var http    = ""
    private var method  = ""
    private var pString = ""
    
    init(Http: String, Method: String, pString: String) {
        self.http    = Http
        self.method  = Method
        self.pString = pString
    }
    
    func sendData(result : @escaping (AnyObject?, NSError?) -> ()) {
        let url            = URL(string: http)
        var request        = URLRequest(url: url!)
        request.httpMethod = method
        let posString      = pString
        request.httpBody   = posString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                if let urcontent = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: urcontent, options: .mutableContainers)
                        result(json as? AnyObject, nil)
                    } catch {
                        result(nil , error as NSError)
                    }
                }
            }
        }
        task.resume()
    }
    
}
