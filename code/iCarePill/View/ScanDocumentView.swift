//
//  ScanDocumentView.swift
//  Text Recognition Sample
//
//  Created by Stefan Blos on 25.05.20.
//  Copyright © 2020 Stefan Blos. All rights reserved.
//



import SwiftUI
import Foundation
import UIKit
import AVFoundation
import Vision
import VisionKit


struct ScanDocumentView: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var recognizedText: String
    @Binding var strengthValue: String
    @Binding var unitValue: String
    @Binding var form: String
    
    func makeCoordinator() -> Coordinator {
//        Coordinator(recognizedText: $recognizedText, parent: self)
        Coordinator(recognizedText: $recognizedText, strength: $strengthValue, unit: $unitValue, form: $form, parent: self)
    }
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let documentViewController = VNDocumentCameraViewController()
        documentViewController.delegate = context.coordinator
        return documentViewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        // nothing to do here
    }
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        var recognizedText: Binding<String>
        var strengthValue: Binding<String>
        var unitValue: Binding<String>
        var form: Binding<String>
        var parent: ScanDocumentView
        
        init(recognizedText: Binding<String>,strength: Binding<String>,unit: Binding<String>,form: Binding<String>, parent: ScanDocumentView) {
            self.recognizedText = recognizedText
            self.strengthValue =  strength
            self.unitValue = unit
            self.form = form
            self.parent = parent
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            let extractedImages = extractImages(from: scan)
            let processedText = recognizeText(from: extractedImages)
            
            
            recognizedText.wrappedValue = processedText
            
            let string = recognizedText.wrappedValue


            let ndcValue = self.matchesNDC(for: "[0-9]{2,6}-[0-9]{2,5}-[0-9]{1,2}", in: string)
            print(ndcValue)
//            self.recognizedText.wrappedValue = ndcValue.first!
            
            //******** API HIT
            let vc = ApiViewModel()
            
            vc.SearchNDC(code: ndcValue.first!) { status, value, err in
                
                if status{
                    
                    print(value)
                    
                    self.recognizedText.wrappedValue = (value?.records?.first?.drugName)!
                    self.strengthValue.wrappedValue = (value?.records?.first?.strength)!
                    self.unitValue.wrappedValue = (value?.records?.first?.unit)!
                    self.form.wrappedValue = (value?.records?.first?.form)!
                    
                    
                    DispatchQueue.main.async {
                        if self.form.wrappedValue == "TABLET"{
                            NotificationCenter.default.post(name: .tablet, object: nil)
                        }else if self.form.wrappedValue == "INJECTABLE"{
                            NotificationCenter.default.post(name: .injection, object: nil)
                        }else{
                            NotificationCenter.default.post(name: .capsule, object: nil)
                        }
                    }
                   
                    
                    
                    self.parent.presentationMode.wrappedValue.dismiss()
                }else{
                    self.recognizedText.wrappedValue = "error"
                    self.parent.presentationMode.wrappedValue.dismiss()
                }
            }
            
        }
        
        
        // Third Party
        fileprivate func extractImages(from scan: VNDocumentCameraScan) -> [CGImage] {
            var extractedImages = [CGImage]()
            for index in 0..<scan.pageCount {
                let extractedImage = scan.imageOfPage(at: index)
                guard let cgImage = extractedImage.cgImage else { continue }
                
                extractedImages.append(cgImage)
            }
            return extractedImages
        }
        
        fileprivate func recognizeText(from images: [CGImage]) -> String {
            var entireRecognizedText = ""
            let recognizeTextRequest = VNRecognizeTextRequest { (request, error) in
                guard error == nil else { return }
                
                guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
                
                let maximumRecognitionCandidates = 1
                for observation in observations {
                    guard let candidate = observation.topCandidates(maximumRecognitionCandidates).first else { continue }
                    
//                    entireRecognizedText += "\(candidate.string)\n"
                    entireRecognizedText += "\(candidate.string)"
                    
                }
            }
            recognizeTextRequest.recognitionLevel = .accurate
            
            for image in images {
                let requestHandler = VNImageRequestHandler(cgImage: image, options: [:])
                
                try? requestHandler.perform([recognizeTextRequest])
            }
            
            return entireRecognizedText
        }
        
        
        func matchesNDC(for regex:String, in text:String)-> [String]
        {
            
            do {
                let regex = try NSRegularExpression(pattern: regex)
                let results = regex.matches(in: text, range: NSRange(text.startIndex...,in: text))
            
                return results.map {
                    String(text[Range($0.range,in: text)!])
                }
            }catch{
                
                print("invalid")
                return[]
                
            }
            
            
        }
    }
 
    
    
  
}
