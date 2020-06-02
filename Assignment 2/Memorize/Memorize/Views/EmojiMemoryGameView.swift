//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Felix Lin on 5/20/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        NavigationView {
            VStack {
                Grid(viewModel.cards) { card in
                    CardView(card: card)
                        .onTapGesture {
                            self.viewModel.choose(card: card)
                    }
                    .padding(5)
                }
                .padding()
                .foregroundColor(viewModel.chosenTheme.color)
                .font(viewModel.cards.count < 5 ? Font.largeTitle : Font.body)
                .layoutPriority(10)
                
                Text("Score: \(viewModel.score)")
                    .font(Font.title)
            }
            .navigationBarTitle(Text(viewModel.chosenTheme.name), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.viewModel.newGame()
                }) {
                    Text("New Game")
                }
            )
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill()
                }
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
    
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
