//
//  UserModel.swift
//  BE
//
//  Created by Noah's Ark on 2022/07/03.
//

import Foundation

struct UserModel {
    let nickName: String
    let session: Session
    let phoneNumber: String
    let deviceToken: String
}

enum Session: String {
    case morning = "오전"
    case afternoon = "오후"
}
