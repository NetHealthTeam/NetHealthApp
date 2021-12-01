//
//  Message.swift
//  NetHealth
//
//  Created by Anday on 25.11.21.
//

import Foundation

struct MessageBody: Codable {
    var text: String?
    var meal: Meal?
    var exercise: Exercise?
    
}


struct Message: Identifiable, Codable {
    var id: String = UUID().uuidString
    let body: MessageBody
    let isUsers: Bool
}
