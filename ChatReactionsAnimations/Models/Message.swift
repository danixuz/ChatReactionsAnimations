//
//  Message.swift
//  ChatReactionsAnimations
//
//  Created by Daniel Spalek on 13/07/2022.
//

import Foundation

struct Message: Identifiable {
    var id: String = UUID().uuidString
    var message: String
    var isReply: Bool = false
    var emojiValue: String = ""
    var isEmojiAdded: Bool = false
}
