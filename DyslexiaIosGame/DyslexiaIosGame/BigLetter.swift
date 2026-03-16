//
//  BigLetter.swift
//  DyslexiaIosGame
//
//  Created by Tyler Carpenter on 3/13/26.
//

import SwiftUI

struct BigLetter: View {
    private let ch: String
    private let pt: Int
    let size: CGFloat
    init(letter: Letter, size: CGFloat = 44) {
        self.ch = String(letter.text)
        self.pt = letter.point
        self.size = size
    }
    var body: some View {
        ZStack{
            Text(self.ch)
                .font(Font.system(size: 0.8 * self.size, weight: .bold))
        }
        .frame(width: self.size, height: self.size)
        .background(self.pt == 0 ? .clear : .mint)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black, lineWidth: 2)
        )
    }
}


