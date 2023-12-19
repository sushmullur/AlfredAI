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
            Color("AlfredDarkBlue")
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 500)

                Text("Alfred Ai")
                    .font(.custom("Roboto-ExtraBold", size: 60))
                    .foregroundColor(.white)

                Spacer()

                Text("© Sush Mullur")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.bottom, 8)
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
