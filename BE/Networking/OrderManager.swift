//
//  OrderManager.swift
//  BE
//
//  Created by GOngTAE on 2022/07/03.
//

import Foundation
import Alamofire

class OrderManager: ObservableObject {
    static let shared = OrderManager()
    private init() {}
    
    func requestPickUpUsers(completion: @escaping ([User], Error?) -> Void) {
        AF.request(Secret.orderUrl)
            .responseString { response in
                switch response.result {
                case .success(let string):
                    print(string)
                    var jsonString = string.replacingOccurrences(of: "\'", with: "\"")
                    jsonString.removeFirst()
                    jsonString.removeLast()
                    print(jsonString)
                    let jsonData = jsonString.data(using: .utf8)!
                    do {
                        let decoder = JSONDecoder()
                        let tableData = try decoder.decode([User].self, from: jsonData)
                        completion(tableData, nil)
                    }
                    catch {
                        print (error)
                        completion([], error)
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func order(with data: OrderData) {
        let parameters: [[String: String]] = [[
            "user" : data.user,
            "menu" : data.menu,
            "lastPhoneNumber" : data.lastPhoneNumber
        ]]
        
        let url = URL(string: Secret.orderUrl)
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        AF.request(request)
            .responseString { response in
                
                let jsonData = response.request?.httpBody
                
                do {
                    let decoder = JSONDecoder()
                    let tableData = try decoder.decode([OrderData].self, from: jsonData!)
                    print(tableData)
                }
                catch {
                    print(error)
                }
                
                switch response.result {
                case .success(let string):
                    print(string)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func cancellOrder(with userName: String) {
        let parameters: [[String: String]] = [[
            "user" : userName
        ]]
        
        let url = URL(string: Secret.orderUrl)
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "PATCH"
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        AF.request(request)
            .responseString { response in
                switch response.result {
                case .success(let string):
                    print(string)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}

struct OrderData: Codable {
    let user: String
    var menu: String
    let lastPhoneNumber: String
}

struct Response: Codable {
    var user: [User]
}

struct User: Codable {
    var user: String
}
