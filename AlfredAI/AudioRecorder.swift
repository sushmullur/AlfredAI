import Foundation
import AVFoundation
import Speech

class AudioRecorder: NSObject, ObservableObject, AVCaptureFileOutputRecordingDelegate {
    private var captureSession: AVCaptureSession?
    private var recordingOutput: AVCaptureMovieFileOutput?
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest? // Add this line
    
    @Published var transcribedText = "" // Store the transcribed text here
    
    override init() {
        super.init()
        setupCaptureSession()
        setupSpeechRecognition()
    }
    
    private func setupCaptureSession() {
        captureSession = AVCaptureSession()
        
        guard let captureSession = captureSession else { return }
        
        // Configure audio input
        let audioDevice = AVCaptureDevice.default(for: .audio)
        if let audioInput = try? AVCaptureDeviceInput(device: audioDevice!) {
            if captureSession.canAddInput(audioInput) {
                captureSession.addInput(audioInput)
            }
        }
        
        // Configure movie file output for recording
        recordingOutput = AVCaptureMovieFileOutput()
        if let recordingOutput = recordingOutput {
            if captureSession.canAddOutput(recordingOutput) {
                captureSession.addOutput(recordingOutput)
            }
        }
    }
    
    func startRecording() {
        guard let recordingOutput = recordingOutput else { return }
        
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let outputURL = documentDirectory.appendingPathComponent("userRecording.mov")
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        print("Speech recognition request created.")
        recordingOutput.startRecording(to: outputURL, recordingDelegate: self)
    }
    
    func stopRecording() {
        recognitionRequest?.endAudio()
        recordingOutput?.stopRecording()
    }
    
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        if let error = error {
            // Handle the error
            print("Recording error: \(error)")
        } else {
            // Handle successful recording
            print("Recording completed successfully. File URL: \(outputFileURL)")
        }
    }
    
    private func setupSpeechRecognition() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            DispatchQueue.main.async {
                if authStatus == .authorized {
                    // Speech recognition is authorized; you can start recognizing speech
                    print("Speech recognition authorized")
                } else {
                    // Handle the case where speech recognition is not authorized
                    print("Speech recognition authorization denied.")
                }
            }
        }
    }
}

extension AudioRecorder: SFSpeechRecognitionTaskDelegate {
    func speechRecognitionTask(_ task: SFSpeechRecognitionTask, didFinishRecognition recognitionResult: SFSpeechRecognitionResult) {
        print("Speech recognition task started")
        let transcribedText = recognitionResult.bestTranscription.formattedString

        // Publish the transcribed text on the main thread
        DispatchQueue.main.async {
            print("In the dispatch queue")
            self.transcribedText = transcribedText
        }
        print("Transcribed text: " + transcribedText)
    }

    func speechRecognitionTask(_ task: SFSpeechRecognitionTask, didFinishSuccessfully successfully: Bool) {
        if !successfully {
            // Handle recognition failure if needed
            print("Speech recognition failed")
        } else {
            print("Speech was successfully received")
        }
    }
}

extension Notification.Name {
    static let recordingCompletedNotification = Notification.Name("RecordingCompletedNotification")
}
