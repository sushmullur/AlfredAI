//
//  ContentView.swift
//  AlfredAI
//
//  Created by Sush Mullur on 12/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = true // State variable to control the display of the loading screen
    
    var body: some View {
        // Use a Group to conditionally show views
        Group {
            if isLoading {
                LoadingScreen()
                    .onAppear {
                        // Simulate a loading process, then switch to the HomeScreen
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            isLoading = false
                        }
                    }
            } else {
                HomeScreen() // Transition to the HomeScreen after loading
            }
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
