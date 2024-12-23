//
//  TextBg.swift
//  Fifteen Game
//
//  Created by Dias Atudinov on 23.12.2024.
//


import SwiftUI

struct TextBg: View {
    var height: CGFloat
    var text: String
    var textSize: CGFloat
    var body: some View {
        ZStack {
            Image(.textBgTL)
                .resizable()
                .scaledToFit()
                .frame(height: height)
            Text(text)
                .font(.custom(Alike.regular.rawValue, size: textSize))
                .foregroundStyle(.black)
                .textCase(.uppercase)
        }
    }
}

#Preview {
    TextBg(height: 100, text: "Select", textSize: 32)
}
