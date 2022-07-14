//
//  OrderManager.swift
//  BE
//
//  Created by GOngTAE on 2022/07/03.
//

import Foundation
import Alamofire

enum ChamMenuName: String {
    case original = "닭갈비덮밥"
    case pepper = "고추장불고기덮밥"
    case soySauce = "간장닭갈비덮밥"
    case originalExtra = "닭갈비덮밥곱빼기"
    case peperExtra = "고추장불고기덮밥곱빼기"
    case soySauceExtra = "간장닭갈비덮밥곱빼기"
}

enum ChamMenuPrice: Int {
    case normal = 5500
    case extra = 6500
}


struct MenuItem: Hashable, Identifiable {
    init(name: ChamMenuName, quantity: Int) {
        self.name = name.rawValue
        self.quantity = quantity
        self.price = self.name.contains("곱빼기") ? ChamMenuPrice.extra.rawValue : ChamMenuPrice.normal.rawValue
    }
    
    let id = UUID()
    var name: String
    var quantity: Int
    var price: Int
}

class OrderManager: ObservableObject {
    static let shared = OrderManager()
    private init() { }

    @Published private var selectedMenues: [String] = []
    @Published private var orderAvailable: Bool = false
    
    func fetchOrderAvailable() -> Bool { return self.orderAvailable }    

    func addMenu(menus: [String]) {
        selectedMenues.append(contentsOf: menus)
    }
    
    func setOrderAvailable() -> Void {
        AF.request("https://worldtimeapi.org/api/timezone/Asia/Seoul")
            .responseString { response in
                switch response.result {
                case .success(let string):
                    print(string)
                    let jsonData = string.data(using: .utf8)!
                    do {
                        let decoder = JSONDecoder()
                        let tableData = try decoder.decode(TimeData.self, from: jsonData)
                        let dateData = tableData.datetime.dateExtract()
                        if let hourInteger = Int(dateData) {
                            if hourInteger >= 10 && hourInteger < 14 {
                                self.orderAvailable = true
                            } else {
                                self.orderAvailable = false
                            }
                        } else {
                            print("DEBUG: 시간 타입 변환 에러")
                        }
                    }
                    catch {
                        print (error)
                    }
                case .failure(let error):
                    print(error)
                }
        }
    }

    func isSelectedMenuesEmpty() -> Bool { return self.selectedMenues.isEmpty }

    func fetchSelectedMenuesCount() -> Int { return self.selectedMenues.count }

    func fetchSelectedMenues() -> [String] { return self.selectedMenues }
    
    func clearSelectedMenues() { return self.selectedMenues.removeAll() }
    
    func updateSelectedMenuQuantity(menuName: String, newOrder: [String]) {
        var filteredArray = self.selectedMenues.filter { (item) -> Bool in
            return !item.contains(menuName)
        }
        
        filteredArray.append(contentsOf: newOrder)

        clearSelectedMenues()
        addMenu(menus: filteredArray)        
    }

    func fetchCountPerMenues() -> [MenuItem] {
        var original = MenuItem(name: .original, quantity: 0)
        var pepper = MenuItem(name: .pepper, quantity: 0)
        var soySauce = MenuItem(name: .soySauce, quantity: 0)
        var originalExtra = MenuItem(name: .originalExtra, quantity: 0)
        var pepperExtra = MenuItem(name: .peperExtra, quantity: 0)
        var soySauceExtra = MenuItem(name: .soySauceExtra, quantity: 0)

        for item in self.selectedMenues {
            switch item {
            case ChamMenuName.original.rawValue:
                original.quantity += 1
            case ChamMenuName.pepper.rawValue:
                pepper.quantity += 1
            case ChamMenuName.soySauce.rawValue:
                soySauce.quantity += 1
            case ChamMenuName.originalExtra.rawValue:
                originalExtra.quantity += 1
            case ChamMenuName.peperExtra.rawValue:
                pepperExtra.quantity += 1
            case ChamMenuName.soySauceExtra.rawValue:
                soySauceExtra.quantity += 1
            default:
                print("==========================")
                print("Order to Order Array Error")
                print("OrderManger-fetchCountPerMenues")
                print("==========================")
                return []
            }
        }

        if selectedMenues.count == 0 {
            return []
        } else {
            return [
                original, pepper, soySauce, originalExtra, pepperExtra, soySauceExtra
            ]
        }
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
        guard let userSession = UserDefaults.standard.string(forKey: "userSession") else { return }
        guard !selectedMenues.isEmpty else { return }
        let user = "\(userSession == "오후" ? "A" : "M").\(userName)"

        var parameters: [[String: String]] = []

        for menu in selectedMenues {
            let parameter = [
                "oid": UUID().uuidString,
                "user": user,
                "menu": menu,
                "phoneNumber": phoneNumber
            ]
            parameters.append(parameter)
        }

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
        guard let userSession = UserDefaults.standard.string(forKey: "userSession") else { return }
        let user = "\(userSession == "오후" ? "A" : "M").\(userName)"
        let parameters: [[String: String]] = [[
            "user": user
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

struct TimeData: Codable {
    let abbreviation, clientIP, datetime: String
    let dayOfWeek, dayOfYear: Int
    let dst: Bool
    let dstFrom: JSONNull?
    let dstOffset: Int
    let dstUntil: JSONNull?
    let rawOffset: Int
    let timezone: String
    let unixtime: Int
    let utcDatetime, utcOffset: String
    let weekNumber: Int

    enum CodingKeys: String, CodingKey {
        case abbreviation
        case clientIP = "client_ip"
        case datetime
        case dayOfWeek = "day_of_week"
        case dayOfYear = "day_of_year"
        case dst
        case dstFrom = "dst_from"
        case dstOffset = "dst_offset"
        case dstUntil = "dst_until"
        case rawOffset = "raw_offset"
        case timezone, unixtime
        case utcDatetime = "utc_datetime"
        case utcOffset = "utc_offset"
        case weekNumber = "week_number"
    }
}

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

