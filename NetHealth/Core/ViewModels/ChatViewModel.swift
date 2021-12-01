//
//  ChatViewModel.swift
//  NetHealth
//
//  Created by Anday on 25.11.21.
//

import Foundation


class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = [
        Message(body: MessageBody(text: "Heyy👋 How can I help you?🤖"), isUsers: false)
        ]

    @Published var text: String = "What is the workout for tuesday?"
    
    func sendMsg(token: String) {
        if text.isEmpty { return }
        messages.append(Message(body: MessageBody(text:text), isUsers: true))
        Webservice.instance.getAnswer(token: token, question: text) { [weak self] res in
            guard let self = self else { return }
            switch res {
            case .success(let botResponse):
                DispatchQueue.main.async {
                    print(botResponse)
                    if let exercises = botResponse.value?.exerciseResponse?.exercises {
                        self.messages.append(contentsOf: exercises.map({ ex -> Message in
                            Message(body: MessageBody(exercise: ex), isUsers: false)
                        }))
                        print("EXERCISES ADDED: ", exercises)
                    }
                    if let meals = botResponse.value?.dietResponse?.meals {
                        self.messages.append(contentsOf: meals.map({ meal -> Message in
                            Message(body: MessageBody(meal: meal), isUsers: false)
                        }))
                    }
                }
            case .failure(let error):
                print("BotResponse: ",error)
            }
            
        }
//        text = ""
    }
    
}
