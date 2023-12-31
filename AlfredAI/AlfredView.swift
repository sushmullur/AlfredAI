import SwiftUI

struct AlfredView: View {
    @Binding var isSpeaking: Bool
    @ObservedObject var audioRecorder = AudioRecorder()  // Create an instance of AudioRecorder

    var body: some View {
        Circle()
            .stroke(Color("AlfredGold"), lineWidth: 4)
            .frame(width: 250, height: 250)
            .overlay(
                Image(isSpeaking ? "AlfredSpeaking" : "AlfredSilent")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            )
            .onTapGesture {
                isSpeaking.toggle()
                if isSpeaking {
                    // Start recording when Alfred is tapped
                    audioRecorder.startRecording()
                } else {
                    // Stop recording when Alfred is tapped again
                    audioRecorder.stopRecording()
                    // Log the user's input
                    UserInputLogger.shared.logUserInput("User spoke something") // Replace with actual audio processing
                }
            }
    }
}

// MARK: - Preview
struct AlfredView_Previews: PreviewProvider {
    static var previews: some View {
        AlfredView(isSpeaking: .constant(false))
    }
}
