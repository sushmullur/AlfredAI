//
//  AudioRecorder.swift
//  AlfredAI
//
//  Created by Sush Mullur on 12/30/23.
//

import Foundation
import AVFoundation

class AudioRecorder: NSObject, ObservableObject, AVCaptureFileOutputRecordingDelegate {
    private var captureSession: AVCaptureSession?
    private var audioOutput: AVCaptureAudioDataOutput?
    private var recordingOutput: AVCaptureMovieFileOutput?
    
    override init() {
        super.init()
        setupCaptureSession()
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
        
        // Configure audio output (optional)
        audioOutput = AVCaptureAudioDataOutput()
        if let audioOutput = audioOutput {
            if captureSession.canAddOutput(audioOutput) {
                captureSession.addOutput(audioOutput)
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
        
        recordingOutput.startRecording(to: outputURL, recordingDelegate: self)
    }
    
    func stopRecording() {
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
}
