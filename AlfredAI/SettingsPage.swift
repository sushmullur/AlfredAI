import SwiftUI

struct SettingsPage: View {
    var body: some View {
        ZStack {
            Color("AlfredDarkGray").edgesIgnoringSafeArea(.all)

            VStack {
                CircleIcon(iconName: "SettingsIcon", iconSize: 80)
                    .padding(.top, 20)
            }
        }
    }
}

// MARK: - Preview
struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}
