import SwiftUI
import AVFoundation

struct HomeScreen: View {
    @State private var isSpeaking = false

    var body: some View {
        NavigationView {
            ZStack {
                Color("AlfredDarkGray")
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    TopIcons()
                    Spacer(minLength: 20)
                    AlfredView(isSpeaking: $isSpeaking)
                    Spacer()
                    TextBox(text: "Hello, I'm Alfred. How may I be of assistance?")
                    Spacer()
                    CircleIcon(iconName: "ReplayIcon", iconSize: 50)
                }
            }
        }
    }
}

// MARK: - Preview
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct TopIcons: View {
    var body: some View {
        HStack {
            NavigationLink(destination: HistoryPage()) {
                CircleIcon(iconName: "HistoryIcon", iconSize: 50)
            }
            
            Spacer()

            NavigationLink(destination: SettingsPage()) {
                CircleIcon(iconName: "SettingsIcon", iconSize: 50)
            }
        }
        .padding(.horizontal)
    }
}

