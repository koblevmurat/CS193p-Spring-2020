//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by dev on 6/9/20.
//  Copyright © 2020 dev.cs193p.student. All rights reserved.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    
    @ObservedObject var document: EmojiArtDocument
    
    var body: some View {
        VStack {
            ScrollView (.horizontal) {
                HStack {
                    ForEach(EmojiArtDocument.palette.map{ String($0) }, id: \.self  ) {
                        emoji in Text(emoji)
                            .font(Font.system(size: self.defaultEmojiSize))
                    }
                }
            }
            .padding(.horizontal)
            Rectangle().foregroundColor(.yellow)
                .edgesIgnoringSafeArea([.horizontal, .bottom])
            onDrop(of: ["public.image"], isTargeted: nil) {providers , location in
                return self.drop(providers: providers)
            }
        }
    }
    
    private func drop (providers: [NSItemProvider]) -> Bool {
        let found = providers.loadFirstObject(ofType: URL.self) { url in
            print("droped \(url)")
            self.document.setBackgroundURL(url)
        }
        return found
    }
    
    private let defaultEmojiSize: CGFloat = 40
}

extension String: Identifiable {
    public var id: String {return self}
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
