//
//  TrainingView.swift
//  Fifteen Game
//
//  Created by Dias Atudinov on 23.12.2024.
//


import SwiftUI

struct TrainingView: View {
    @StateObject private var viewModel = TrainingViewModel()

    let columns = Array(repeating: GridItem(.flexible()), count: 4)

    var body: some View {
        VStack {
            ZStack {
                Image(.textBgTL)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                Text("00:00")
                    .font(.custom(Alike.regular.rawValue, size: 24))
                    .foregroundStyle(.white)
                    .textCase(.uppercase)
            }

            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(viewModel.tiles) { tile in
                    ZStack {
                        if tile.value != nil {
                            Image(.cell)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 66)
                        }

                        if let value = tile.value {
                            Text("\(value)")
                                .font(.custom(Alike.regular.rawValue, size: 24))
                                .foregroundColor(.black)
                        }
                    }
                    .onTapGesture {
                        if let index = viewModel.tiles.firstIndex(where: { $0.id == tile.id }) {
                            viewModel.moveTile(at: index)
                        }
                    }
                }
            }.frame(width: 290)
            .padding(15)
            .background(
                Rectangle()
                    .cornerRadius(15)
                    .foregroundStyle(.bgMain)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 2).foregroundStyle(.mainRed)
                    )
            )
        }
    }
}

#Preview {
    TrainingView()
}
