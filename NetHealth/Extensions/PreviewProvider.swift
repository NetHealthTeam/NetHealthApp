//
//  PreviewProvider.swift
//  NetHealth
//
//  Created by Anday on 15.11.21.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}


class DeveloperPreview {
    static let instance = DeveloperPreview()
    
    private init() {}
    
    let meal = Meal(id: 1, number: 1, name: "Omelette", imageUrl: "https://images.eatthismuch.com/site_media/img/905711_tabitharwheeler_5e5c1d26-e56a-45af-a35b-fabae62f3ad6.jpg", calories: 549, mealUrl: "https://www.eatthismuch.com/recipe/nutrition/basic-eggs,905711/", portion: 1)
    
    let exercise = Exercise(id: 1, name: "Jumping Rope", imageUrl: "https://s.yimg.com/ny/api/res/1.2/Hz.ezhxeZPG3ma_Cz5n5ow--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTQ4MQ--/https://s.yimg.com/uu/api/res/1.2/sPwjmiEL0UVujv4LfZIo8w--~B/aD0xMDYzO3c9MjEyMDthcHBpZD15dGFjaHlvbg--/http://media.zenfs.com/en-US/homerun/popular_mechanics_642/ff83a7510f2c300d9480fe86851795af", caloriePerHour: "667-990", duration: 45, weekday: 2)
    
    let messageSent = Message(body: MessageBody(text: "Hey, what is the diet for today?"), isUsers: true)
    let messageReceive = Message(body: MessageBody(text:"Rice, bla, bla, bla"), isUsers: false)
}
