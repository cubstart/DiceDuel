//
//  GameView.swift
//  DiceDuel
//
//  Created by Justin Wong on 10/22/25.
//

import SwiftUI

struct GameView: View {
    @Environment(GameViewModel.self) var viewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                PlayerSideView(title: "Player One", score: viewModel.playerOneScore, dices: viewModel.playerOneDices)
                Spacer()
                PlayerSideView(title: "Player Two", score: viewModel.playerTwoScore, dices: viewModel.playerTwoDices)
                Spacer()
            }
            rollButton
        }
        .padding()
    }
    
    private var rollButton: some View {
        Button(action: {
            viewModel.rollDice()
        }) {
            Text("Roll")
                .bold()
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.green.opacity(0.7))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct PlayerSideView: View {
    var title: String
    var score: Int
    var dices: [Dice]

    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
                .bold()
            Text("\(score)")
            Spacer()
            GridView(dices: dices)
            Spacer()
        }
    }
}

struct GridView: View {
    var dices: [Dice]
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 3)

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(dices) { dice in
                    DiceView(value: dice.value)
                }
            }
        }
    }
}

struct DiceView: View {
    var value: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(.red)
            .frame(width: 35, height: 35)
            .overlay (
                Text("\(value)")
                    .foregroundStyle(.white)
                    .bold()
            )
    }
}

#Preview {
    let viewModel = GameViewModel()
    viewModel.startGame(numOfDices: 10, numOfDiceSides: 6)
    
    return GameView()
        .environment(viewModel)
}
