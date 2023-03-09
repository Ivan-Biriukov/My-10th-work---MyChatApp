//
//  Constants.swift
//  MyChatApp
//
//  Created by иван Бирюков on 09.03.2023.
//

import Foundation

struct K {
    static let registerToChat = "fromRegisterToChat"
    static let loginToChat = "fromLoginToChat"
    static let cellIdentifier = "ReusableCell"
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
