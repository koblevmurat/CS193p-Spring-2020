//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by dev on 5/26/20.
//  Copyright © 2020 dev.cs193p.student. All rights reserved.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame () -> MemoryGame<String> {
        let emojis: Array<String> =  ["👻", "🎃", "🕷"]
        
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    
    //var objectWillChange: ObservableObjectPublisher
    
    //MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        // objectWillChange.send() should have it here if you var is not published
        model.choose(card: card)
    }
    
    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
}



