//
//  UserInputLogger.swift
//  AlfredAI
//
//  Created by Sush Mullur on 12/30/23.
//

import Foundation

class UserInputLogger {
    static let shared = UserInputLogger()
    
    func logUserInput(_ userInput: String) {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let logURL = documentDirectory.appendingPathComponent("userInputLog.txt")
        
        do {
            let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .medium)
            let logEntry = "\(timestamp): \(userInput)\n"
            
            try logEntry.write(to: logURL, atomically: true, encoding: .utf8)
        } catch {
            print("Error writing to log file: \(error)")
        }
    }
}
