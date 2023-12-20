import SwiftUI

struct QueryRowView: View {
    var query: Query

    var body: some View {
        VStack {
            HStack {
                Text(truncatedText(query.request))
                    .foregroundColor(.white)
                    .font(.headline)
                    .lineLimit(1)

                Spacer()

                Text(query.time)
                    .foregroundColor(Color("AlfredSilver"))
                    .font(.headline)
                    .frame(alignment: .trailing)
            }
        }
    }

    private func truncatedText(_ text: String) -> String {
        let maxLength = 25
        return text.count > maxLength ? String(text.prefix(22)) + "..." : text
    }
}
