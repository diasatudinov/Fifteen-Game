import SwiftUI

struct TrainingView: View {
    @StateObject private var viewModel = FifteenGameViewModel()

    let columns = Array(repeating: GridItem(.flexible()), count: 4)

    var body: some View {
        VStack {
            Text("Online")
                .font(.custom(Alike.regular.rawValue, size: 28))
                .padding()
                .textCase(.uppercase)

            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.tiles) { tile in
                    ZStack {
                        Rectangle()
                            .foregroundColor(tile.value == nil ? Color.gray.opacity(0.3) : Color.blue)
                            .frame(height: 80)
                            .cornerRadius(8)

                        if let value = tile.value {
                            Text("\(value)")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }
                    .onTapGesture {
                        if let index = viewModel.tiles.firstIndex(where: { $0.id == tile.id }) {
                            viewModel.moveTile(at: index)
                        }
                    }
                }
            }
            .padding()

            Button("Restart") {
                viewModel.resetGame()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
    }
}
