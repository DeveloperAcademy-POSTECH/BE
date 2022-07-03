//
//  OrderManager.swift
//  BE
//
//  Created by GOngTAE on 2022/07/03.
//

import Foundation
import Alamofire

enum Cham: String {
    case original = "닭갈비덮밥"
    case pepper = "고추장불고기덮밥"
    case soySauce = "간장닭갈비덮밥"
}

class OrderManager: ObservableObject {
    static let shared = OrderManager()
    private init() {}
    
    @Published var selectedMenues: [String] = []
    
    func addMenu(menus: [String]) {
        selectedMenues.append(contentsOf: menus)
    }
    
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
    
    func order() {
        guard let phoneNumber = UserDefaults.standard.string(forKey: "phoneNumber") else { return }
        guard let userName = UserDefaults.standard.string(forKey: "userName") else { return }
        guard let userSession = UserDefaults.standard.string(forKey: "userSession") else {return}
        guard !selectedMenues.isEmpty else { return }
        let user = "\(userSession == "오후" ? "A" : "M").\(userName)"
        
        var parameters: [[String: String]] = []
        
        for menu in selectedMenues {
            let oidString = UUID().uuidString
            let parameter = [
                "oid" : oidString,
                "user" : user,
                "menu" : menu,
                "phoneNumber" : phoneNumber
            ]
            parameters.append(parameter)
        }
        print(parameters)
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
    
    func cancellOrder() {
        guard let userName = UserDefaults.standard.string(forKey: "userName") else { return }
        guard let userSession = UserDefaults.standard.string(forKey: "userSession") else {return}
        let user = "\(userSession == "오후" ? "A" : "M").\(userName)"
        let parameters: [[String: String]] = [[
            "user" : user
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
