//
//  MessageView.swift
//  NetHealth
//
//  Created by Anday on 25.11.21.
//

import SwiftUI

struct MessageView: View {
    var message: Message
    var body: some View {
        if message.body.exercise != nil {
            ScrollView {
                WorkoutItem(exercise: message.body.exercise)
                    .padding()
                    .background(message.isUsers ? Color.theme.messageSent : Color.theme.messageReceived)
                    .clipShape(MessageCornersShape(isUserMessage: message.isUsers))
            }
        }
        else if message.body.meal != nil {
            ScrollView {
                DietItem(meal: message.body.meal)
                    .padding()
                    .background(message.isUsers ? Color.theme.messageSent : Color.theme.messageReceived)
                    .clipShape(MessageCornersShape(isUserMessage: message.isUsers))
            }
        }
        else {
            Text(message.body.text ?? "")
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(message.isUsers ? Color.white : Color.primary)
                .background(message.isUsers ? Color.theme.messageSent : Color.theme.messageReceived)
                .clipShape(MessageCornersShape(isUserMessage: message.isUsers))
        }
        
    }
}




struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: dev.messageSent)
            .environmentObject(UserSettings())
            .previewLayout(.sizeThatFits)
            .padding()
        
        MessageView(message: Message(body: MessageBody(meal: dev.meal), isUsers: false))
            .environmentObject(UserSettings())
            .previewLayout(.sizeThatFits)
            .padding()
        
        MessageView(message: dev.messageReceive)
            .environmentObject(UserSettings())
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.dark)
        
    }
}
