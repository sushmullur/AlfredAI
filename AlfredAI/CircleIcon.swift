import SwiftUI

struct CircleIcon: View {
    var iconName: String
    var iconSize: CGFloat  // Add a parameter for icon size

    var body: some View {
        Circle()
            .stroke(Color("AlfredSilver"), lineWidth: 5)
            .frame(width: iconSize * 2, height: iconSize * 2) 
            .overlay(
                Image(iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: iconSize, height: iconSize)  // Use the iconSize parameter
            )
    }
}

// MARK: - Preview
struct CircleIcon_Previews: PreviewProvider {
    static var previews: some View {
        CircleIcon(iconName: "HistoryIcon", iconSize: 50)
    }
}
