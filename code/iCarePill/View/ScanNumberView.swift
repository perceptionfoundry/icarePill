//
//  ScanNumberView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 14/06/2021.
//

import SwiftUI
import Foundation
import UIKit
import AVFoundation
import Vision

struct ScanNumberView : UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var recognizedText: String
    @Binding var strengthValue: String
    @Binding var unitValue: String
    @Binding var form: String
    
   
//    
//    func makeCoordinator() -> Coordinator {
////        Coordinator(recognizedText: $recognizedText, parent: self)
//        Coordinator(recognizedText: $recognizedText, strength: $strengthValue, unit: $unitValue, form: $form, parent: self)
//    }
    
    func makeUIViewController(context: Context) -> ScanNumberViewController {
        let documentViewController = ScanNumberViewController()
//        documentViewController.delegate = context.coordinator
        return documentViewController
    }
    
    func updateUIViewController(_ uiViewController: ScanNumberViewController, context: Context) {
        // nothing to do here
    }
    
    
    
    
    
    
    
//    class Coordinator: NSObject {
//        var recognizedText: Binding<String>
//        var strengthValue: Binding<String>
//        var unitValue: Binding<String>
//        var form: Binding<String>
//        var parent: ScanNumberView
//
//
//
//
//        init(recognizedText: Binding<String>,strength: Binding<String>,unit: Binding<String>,form: Binding<String>, parent: ScanNumberView) {
//            self.recognizedText = recognizedText
//            self.strengthValue =  strength
//            self.unitValue = unit
//            self.form = form
//            self.parent = parent
//        }
//
//
//
//
//
////        override func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
////            if let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) {
////                // Configure for running in real-time.
////                request.recognitionLevel = .fast
////                // Language correction won't help recognizing phone numbers. It also
////                // makes recognition slower.
////                request.usesLanguageCorrection = false
////                // Only run on the region of interest for maximum speed.
////                request.regionOfInterest = regionOfInterest
////
////                let requestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: textOrientation, options: [:])
////                do {
////                    try requestHandler.perform([request])
////                } catch {
////                    print(error)
////                }
////            }
////        }
//
//
//
//
//    }
        
 
    }



