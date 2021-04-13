//
//  QRCodeReaderView.swift
//  iCarePill
//
//  Created by Syed ShahRukh Haider on 23/03/2021.
//

import SwiftUI
import AVFoundation
import QRCodeReader

 


public struct QRCodeReaderView: UIViewControllerRepresentable{
   
    
    @Binding var qrCodeValue : String
    @Environment(\.presentationMode) var presentationMode
    
    
    
    
    public func makeUIViewController(context: Context) -> QRCodeReaderViewController {
        
        let builder = QRCodeReaderViewControllerBuilder {
                      $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
        
                      // Configure the view controller (optional)
                      $0.showTorchButton        = false
                      $0.showSwitchCameraButton = false
                      $0.showCancelButton       = false
                      $0.showOverlayView        = true
                      $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
                  }
        
        let readerVC = QRCodeReaderViewController(builder: builder)
        
        readerVC.modalPresentationStyle = .formSheet
        
        
        
//        readerVC.completionBlock = { (result: QRCodeReaderResult?) in
//          print(result)
//        }
        readerVC.delegate = context.coordinator
            
                  return readerVC
        
    }
    
    public func updateUIViewController(_ uiViewController: QRCodeReaderViewController, context: Context) {
        
    }
    
    
    
    public class Coordinator: NSObject, QRCodeReaderViewControllerDelegate{
        
        let parentView : QRCodeReaderView
        
        init(parent: QRCodeReaderView){
            self.parentView = parent
        }
        
        public func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        
            reader.stopScanning()

            
            print(result.value)
            
            parentView.qrCodeValue = "\(result.value)"
           
            
//            dismiss(animated: true, completion: nil)
            
            parentView.presentationMode.wrappedValue.dismiss()
            
            
        }
        
        public func readerDidCancel(_ reader: QRCodeReaderViewController) {
        
            reader.stopScanning()

//            dismiss(animated: true, completion: nil)
            parentView.presentationMode.wrappedValue.dismiss()
            
        }
        
        
    }
   
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    
    
    
}
//    public func makeUIViewController(context: Context) -> QRCodeReaderViewController {
//        return self.readerVC
//    }
//    
// 
//    
//    
//    @Environment(\.presentationMode) private var presentationMode
//    
//      lazy var readerVC: QRCodeReaderViewController = {
//          let builder = QRCodeReaderViewControllerBuilder {
//              $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
//              
//              // Configure the view controller (optional)
//              $0.showTorchButton        = false
//              $0.showSwitchCameraButton = false
//              $0.showCancelButton       = false
//              $0.showOverlayView        = true
//              $0.rectOfInterest         = CGRect(x: 0.2, y: 0.2, width: 0.6, height: 0.6)
//          }
//          
//          return QRCodeReaderViewController(builder: builder)
//      }()
//    
//    
//    public mutating func makeUIViewController(context: Context) -> QRCodeReaderViewController {
//        
////        readerVC.completionBlock = { (result: QRCodeReaderResult?) in
////            print(result)
////          }
////
////
////        return readerVC
//        
//        return readerVC
//        
//    }
//    
//    public func updateUIViewController(_ uiViewController: QRCodeReaderViewController, context: Context) {
//    
//        
//    }
//    
//    
//    
//    public func makeCoordinator() -> Coordinator {
//        Coordinator(
//            onDismiss: { self.presentationMode.wrappedValue.dismiss() }
//        )
//    }
//
//    final public class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//
//        private let onDismiss: () -> Void
//        
//
//        init(onDismiss: @escaping () -> Void) {
//            self.onDismiss = onDismiss
//          
//        }
//        
//        
//        // MARK: - QRCodeReaderViewController Delegate Methods
//        func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
//          reader.stopScanning()
//
//            self.onDismiss()
//        }
//
//        //This is an optional delegate method, that allows you to be notified when the user switches the cameraName
//        //By pressing on the switch camera button
//        func reader(_ reader: QRCodeReaderViewController, didSwitchCamera newCaptureDevice: AVCaptureDeviceInput) {
//            
////            if let cameraName = newCaptureDevice.device.localizedName {
////              print("Switching capture to: \(cameraName)")
////            }
//        }
//
//        func readerDidCancel(_ reader: QRCodeReaderViewController) {
//          reader.stopScanning()
//
//            self.onDismiss()
//        }
//
//      
//
//    }
//    
//  
//   
//
//   
//  
//    
//    
//}
