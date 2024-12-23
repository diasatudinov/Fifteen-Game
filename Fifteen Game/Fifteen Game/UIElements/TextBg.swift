import SwiftUI

struct TextBg: View {
    var height: CGFloat
    var text: String
    var textSize: CGFloat
    var body: some View {
        ZStack {
            Image(.textBg)
                .resizable()
                .scaledToFit()
                .frame(height: height)
            Text(text)
                .font(.system(size: textSize, weight: .bold))
                .foregroundStyle(.white)
                .textCase(.uppercase)
        }
    }
}

#Preview {
    TextBg(height: 100, text: "ррр...", textSize: 32)
}