import SwiftUI

struct AlfredView: View {
    @Binding var isSpeaking: Bool
    @Binding var transcribedText: String
    @ObservedObject var audioRecorder = AudioRecorder()

    var body: some View {
        VStack {
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
                        print("Recording started.")
                    } else {
                        // Stop recording when Alfred is tapped again
                        audioRecorder.stopRecording()
                        print("Recording stopped.")
                    }
                }
        }
    }
}


// MARK: - Preview
struct AlfredView_Previews: PreviewProvider {
    @State static var transcribedText = "This is a sample transcribed text." // Provide a sample text

    static var previews: some View {
        AlfredView(isSpeaking: .constant(false), transcribedText: $transcribedText)
    }
}

