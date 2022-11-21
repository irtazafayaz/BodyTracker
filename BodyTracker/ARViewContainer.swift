//
//  ARViewContainer.swift
//  BodyTracker
//
//  Created by Irtaza Fiaz on 21/11/2022.
//

import Foundation
import ARKit
import RealityKit
import SwiftUI

struct ARViewContainer: UIViewRepresentable {

    typealias UIViewType = ARView

    func makeUIView(context: Context) -> ARView {
        let arrView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        return arrView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
    
    
}


