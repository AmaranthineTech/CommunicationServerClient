//
//  NetworkEngine.swift
//  CommunicationServerClient
//
//  Created by Arun Patwardhan on 21/10/26.
//

import Foundation
 
final class NetworkEngine {
    //MARK: - Singleton
    private static var reference    : NetworkEngine?
     
    private init() { }
     
    static var shared : NetworkEngine {
        if reference == nil {
            reference = NetworkEngine()
        }
        return reference!
    }
     
    typealias NetworkResponseHandler = (Data?, URLResponse?, Error?) -> Void
     
    func communicateWith(Server url : URL, andHandleResponseWith completionHandler : @escaping NetworkResponseHandler) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: completionHandler)
        task.resume()
    }
     
    func communicateWith(Request req : URLRequest, andHandleResponseWith completionHandler : @escaping NetworkResponseHandler) {
        let task = URLSession.shared.dataTask(with: req, completionHandler: completionHandler)
        task.resume()
    }
}
