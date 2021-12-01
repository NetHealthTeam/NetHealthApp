//
//  Chat.swift
//  NetHealth
//
//  Created by Anday on 25.11.21.
//

import SwiftUI

struct Chat: View {
    @StateObject private var vm: ChatViewModel = ChatViewModel()
    @EnvironmentObject private var usettings: UserSettings
    var body: some View {
        VStack {
            header
                .padding()
            Spacer()
            messagesList
            Spacer()
            inputField
                .padding(.vertical)
        }
    }
    
    private var header: some View {
        Text("Chat Bot")
            .font(.title)
            .bold()
            .foregroundColor(.accentColor)
    }
    
    private var messagesList: some View {
        ScrollViewReader {reader in
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading) {
                    ForEach(vm.messages, id: \.id) { message in
                        HStack {
                            if message.isUsers {
                                Spacer()
                            }
                            MessageView(message: message)
                        }
                    }
                    .onReceive(vm.$messages) { value in
                        guard !value.isEmpty else { return }
                        reader.scrollTo(value.last!.id)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    private var inputField: some View {
        HStack {
            TextField("Type here...", text: $vm.text)
                .disableAutocorrection(true)
                .padding()
                .frame(height: 45)
                .background(Color.primary.opacity(0.06))
                .clipShape(Capsule())
            
            Button {
                vm.sendMsg(token: usettings.token)
            } label: {
                Image(systemName: "paperplane.fill")
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                    .frame(width: 45, height: 45)
                    .background(Color.accentColor)
                    .clipShape(Circle())
            }
            .disabled(vm.text == "")
            
        }
        .padding(.horizontal)
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat()
    }
}
