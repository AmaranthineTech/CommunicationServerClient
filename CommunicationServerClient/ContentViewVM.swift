//
//  ContentViewVM.swift
//  CommunicationServerClient
//
//  Created by Arun Patwardhan on 21/10/26.
//

import Foundation

struct ContentViewVM {
    private let targetURL : String = "http://127.0.0.1:8080"
    
    func initiateCommunication(task : @escaping () -> Void) {
        //1) Get the URL
        let destinationURL      : URL                                   = URL(string: "\(self.targetURL)/Receive")!
        var req                 : URLRequest                            = URLRequest(url: destinationURL)
        req.httpMethod                                                  = "GET"
        let body                                                        = "Basic \("test:secret".data(using: .utf8)!.base64EncodedString())"
        req.setValue(body, forHTTPHeaderField: "Authorization")
             
        //2) Create the completion handler
        let completionHandler   : NetworkEngine.NetworkResponseHandler  = {(data : Data?, response : URLResponse?, err : Error?) -> Void in
            print(String(data: data!, encoding: String.Encoding.utf8)!)
        }
             
        //3) Start communication
        NetworkEngine.shared.communicateWith(Request: req, andHandleResponseWith: completionHandler)
    }
     
    func sendSomeData(input : String) {
        //1) Get the URL
        let destinationURL  : URL           = URL(string: "\(self.targetURL)/Send")!
        let objToSend       : String        = input
        let jsonEncoder     : JSONEncoder   = JSONEncoder()
        let body                            = try? jsonEncoder.encode(objToSend)
             
        var req             : URLRequest    = URLRequest(url: destinationURL)
        req.httpMethod                      = "POST"
        req.httpBody                        = body
        req.addValue("application/json", forHTTPHeaderField: "content-type")
        let authBody                        = "Basic \("test:secret".data(using: .utf8)!.base64EncodedString())"
        req.setValue(authBody, forHTTPHeaderField: "Authorization")
             
        NetworkEngine.shared.communicateWith(Request: req, andHandleResponseWith: {(data, response, error) in
            print(response!)
        })
    }
}
