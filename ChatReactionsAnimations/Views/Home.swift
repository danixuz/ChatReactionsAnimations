//
//  Home.swift
//  ChatReactionsAnimations
//
//  Created by Daniel Spalek on 13/07/2022.
//

import SwiftUI

// This project targets iOS 15+
struct Home: View {
    
    //MARK: Sample messages
    @State var sampleMessages: [Message] = [
        Message(message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
        Message(message: "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.", isReply: true)
    ]
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 12){
                    ForEach(sampleMessages){ message in
                        messageBubble(message: message)
                            .anchorPreference(key: BoundsPreference.self, value: .bounds, transform: { anchor in
                                return [message.id: anchor]
                            })
                            .padding(message.isReply ? .leading : .trailing)
                    }
                }
                .padding()
            }
            .navigationTitle("Message Animations")
            .toolbar(.visible)
        }
        // MARK: Highlighting the view based on the bounds value and with OverlayPreference
        .overlayPreferenceValue(BoundsPreference.self) { values in
            //MARK: Checking which view is tapped
        }
    }
    
    @ViewBuilder
    func messageBubble(message: Message) -> some View{
        Text(message.message)
            .padding(15)
            .background(!message.isReply ? Color(.systemGray5 ) : .blue)
            .foregroundColor(!message.isReply ? .black : .white)
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
