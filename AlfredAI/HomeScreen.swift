//
//  HomeScreen.swift
//  AlfredAI
//
//  Created by Sush Mullur on 12/17/23.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack {
            Color("AlfredDarkGray")
                .edgesIgnoringSafeArea(.all)

            VStack {
                // Top icons
                HStack {
                    CircleIcon(iconName: "HistoryIcon", iconSize: 50)
                    Spacer()
                    CircleIcon(iconName: "SettingsIcon", iconSize: 50)
                }
                .padding(.horizontal)
                
                Spacer(minLength: 20)

                // Giant circle
                Circle()
                    .stroke(Color("AlfredGold"), lineWidth: 4)
                    .frame(width: 250, height: 250)

                Spacer()
                // Rounded Rectangle
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color("AlfredSilver"), lineWidth: 2)
                    .frame(width: 300, height: 100)

                Spacer()
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
