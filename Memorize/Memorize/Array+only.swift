//
//  Array+only.swift
//  Memorize
//
//  Created by dev on 6/2/20.
//  Copyright © 2020 dev.cs193p.student. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
