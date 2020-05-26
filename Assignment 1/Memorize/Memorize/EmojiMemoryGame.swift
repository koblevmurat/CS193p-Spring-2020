//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Felix Lin on 5/23/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    private(set) var model = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷", "👽", "💩", "🤖", "🥶", "👾", "🧟‍♂️", "😈", "😽", "🤡"].shuffled()
        let randomNumber = Int.random(in: 2...5)
        return  MemoryGame<String>(numberOfPairsOfCards: randomNumber) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
