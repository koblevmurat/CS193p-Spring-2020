//
//  Array+Only.swift
//  Memorize
//
//  Created by Felix Lin on 5/30/20.
//  Copyright © 2020 Felix Lin. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
