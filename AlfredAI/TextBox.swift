import SwiftUI

struct TextBox: View {
    var text: String
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .stroke(Color("AlfredSilver"), lineWidth: 2)
            .frame(width: 300, height: 100)
            .overlay(
                Text(text)
                    .font(.custom("Roboto-Bold", size: 20))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
            )
    }
}

// MARK: - Preview
struct TextBox_Previews: PreviewProvider {
    static var previews: some View {
        TextBox(text: "Hello, I'm Alfred. How may I be of assistance?")
    }
}
