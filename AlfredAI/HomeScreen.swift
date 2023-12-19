//
//  HomeScreen.swift
//  AlfredAI
//
//  Created by Sush Mullur on 12/17/23.
//

import SwiftUI

struct HomeScreen: View {
    @State private var isSpeaking = false

    var body: some View {
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

// MARK: - Preview
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct TopIcons: View {
    var body: some View {
        HStack {
            CircleIcon(iconName: "HistoryIcon", iconSize: 50)
            Spacer()
            CircleIcon(iconName: "SettingsIcon", iconSize: 50)
        }
        .padding(.horizontal)
    }
}
