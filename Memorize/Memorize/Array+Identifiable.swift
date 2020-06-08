//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by dev on 5/31/20.
//  Copyright © 2020 dev.cs193p.student. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil //TODO: bogus!
    }
}
