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

private var bodySkeleton: BodySkeleton?
private let bodySkeletonAnchor = AnchorEntity()

struct ARViewContainer: UIViewRepresentable {

    typealias UIViewType = ARView

    func makeUIView(context: Context) -> ARView {
        let arrView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        
        arrView.setupForBodyTracking()
        arrView.scene.addAnchor(bodySkeletonAnchor)
        return arrView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
    
    
}

extension ARView: ARSessionDelegate {
    
    func setupForBodyTracking() {
        let configuartion = ARBodyTrackingConfiguration()
        self.session.run(configuartion)
        self.session.delegate = self
    }
    
    public func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        for anchor in anchors {
            if let bodyAnchor = anchor as? ARBodyAnchor {
                if let skeleton = bodySkeleton {
                    skeleton.update(with: bodyAnchor)
                } else {
                    bodySkeleton = BodySkeleton(for: bodyAnchor)
                    bodySkeletonAnchor.addChild(bodySkeleton!)
                }
            }
        }
    }
    
}


