//
//  StartGameView.swift
//  DiceDuel
//
//  Created by Justin Wong on 10/22/25.
//

import SwiftUI

struct StartGameView: View {
    @Environment(GameViewModel.self) var viewModel
    
    @State private var numOfDices = "1"
    @State private var numOfDiceSides = "6"
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Dice Duel")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
                HStack {
                    Text("Customize Dice:")
                        .bold()
                    CustomizeDiceTextField(text: $numOfDices)
                    Text("d")
                    CustomizeDiceTextField(text: $numOfDiceSides)
                }
                Spacer()
                gameViewNavigationLink
                Spacer()
            }
            .padding()
            .onAppear {
                viewModel.resetGame()
            }
        }
    }
    
    private var gameViewNavigationLink: some View {
        NavigationLink {
            GameView()
                .onAppear {
                    guard let numOfDices = Int(numOfDices), let numOfDiceSides = Int(numOfDiceSides) else {
                        return
                    }
                    
                    viewModel.startGame(numOfDices: numOfDices, numOfDiceSides: numOfDiceSides)
                }
        } label: {
            startGameNavLinkView
        }
    }
    
    private var startGameNavLinkView: some View {
        Text("Start Game")
            .foregroundStyle(.white)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.blue)
            .glassEffect(.regular.interactive())
            .clipShape(.capsule)
    }
}


struct CustomizeDiceTextField: View {
    @Binding var text: String
    
    var body: some View {
        TextField("", text: $text)
            .multilineTextAlignment(.center)
            .textFieldStyle(.roundedBorder)
            .frame(width: 40)
    }
}

#Preview {
    StartGameView()
        .environment(GameViewModel())
}
