import SwiftUI

struct AlfredView: View {
    @Binding var isSpeaking: Bool

    var body: some View {
        Circle()
            .stroke(Color("AlfredGold"), lineWidth: 4)
            .frame(width: 250, height: 250)
            .overlay(
                Image(isSpeaking ? "AlfredSpeaking" : "AlfredSilent")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .onTapGesture {
                        isSpeaking.toggle()
                    }
            )
    }
}

// MARK: - Preview
struct AlfredView_Previews: PreviewProvider {
    static var previews: some View {
        AlfredView(isSpeaking: .constant(false))
    }
}
