//
//  LoadingScreen.swift
//  AlfredAI
//
//  Created by Sush Mullur on 12/17/23.
//

import SwiftUI

struct LoadingScreen: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.7) // Dark overlay background
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Loading...")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.top, 8)
            }
        }
    }
}

// MARK: - Preview
struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}
