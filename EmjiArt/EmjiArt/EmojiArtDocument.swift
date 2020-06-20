//
//  EmojiArtDocument.swift
//  EmjiArt
//
//  Created by dev on 6/10/20.
//  Copyright © 2020 dev.cs193p.student. All rights reserved.
//

import SwiftUI

class EmojiArtDocument: ObservableObject {
    
    
    static let palette: String = "⚽️🍓🌦☀️⭐️🌈"
    
    //@Published //workaound for property observer problem with property wrappers
    private var emojiArt: EmojiArt {
        willSet{
            objectWillChange.send()
        }
        didSet {
            UserDefaults.standard.set(emojiArt.json, forKey: EmojiArtDocument.untitled)
        }
    }
    
    private static let untitled = "EmojiArtDocument.Untitled"
    
    init() {
        emojiArt = EmojiArt(json: UserDefaults.standard.data(forKey: EmojiArtDocument.untitled)) ?? EmojiArt()
        fetchBackgroundImageData()
    }
    
    @Published private(set) var backgroundImage: UIImage?
    
    var emojis: [EmojiArt.Emoji] { emojiArt.emojis }
    
    //MARK: Intent(s)
    
    func addEmoji(_ emoji: String, at location: CGPoint, size: CGFloat) {
          emojiArt.addEmoji(emoji, x: Int(location.x), y: Int(location.y), size: Int (size))
      }
      
      func moveEmoji(_ emoji: EmojiArt.Emoji, by offset: CGSize) {
          if let index = emojiArt.emojis.firstIndex (matching: emoji) {
              emojiArt.emojis[index].x += Int(offset.width)
              emojiArt.emojis[index].y += Int(offset.height)
          }
      }
    
    func scaleEmoji(_ emoji: EmojiArt.Emoji, by scale: CGFloat) {
          if let index = emojiArt.emojis.firstIndex(matching: emoji) {
              emojiArt.emojis[index].size = Int( (CGFloat(emojiArt.emojis[index].size) * scale).rounded(.toNearestOrEven))
          }
      }
    
//    func setBackgroundURL(_ url: URL?) {
//        emojiArt.backGroundURL = url?.imageURL
//    }
    
    func setBackgroundURL(_ url: URL?) {
        emojiArt.backgroundURL = url?.imageURL
        fetchBackgroundImageData()
    }
    
    func fetchBackgroundImageData() {
        backgroundImage = nil
        if let url = self.emojiArt.backgroundURL {
            DispatchQueue.global (qos: .userInitiated).async {
                if let imageData = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        if url == self.emojiArt.backgroundURL {
                            self.backgroundImage = UIImage(data: imageData)
                        }
                    }
                }
            }
        }
    }
}

extension EmojiArt.Emoji {
    var fontSize: CGFloat { CGFloat(self.size) }
    var location: CGPoint { CGPoint (x: CGFloat(x), y: CGFloat(y)) }
}