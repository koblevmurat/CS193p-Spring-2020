//
//  OptionalImage.swift
//  EmjiArt
//
//  Created by dev on 6/16/20.
//  Copyright © 2020 dev.cs193p.student. All rights reserved.
//

import SwiftUI

struct OptionalImage: View {
    
    var uiImage: UIImage?
    
    var body: some View{
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}
