//
//  ViewController.swift
//  HelloTriangle
//
//  Created by Hasan Qasim on 25/10/20.
//

import UIKit
import Metal
import QuartzCore

class ViewController: UIViewController {
    
    var device: MTLDevice! = nil
    var metalLayer: CAMetalLayer! = nil
    var vertexBuffer: MTLBuffer! = nil
    
    let vertexData: [Float] = [
        0.0, 0.5, 0.0,
        -0.5, -0.5, 0.0,
        0.5, -0.5, 0.0
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        device = MTLCreateSystemDefaultDevice()
        initCAMetalLayer()
        
    }
    
    func initCAMetalLayer() {
        metalLayer = CAMetalLayer()
        metalLayer.device = device
        metalLayer.pixelFormat = .bgra8Unorm
        metalLayer.framebufferOnly = true
        metalLayer.frame = view.layer.frame
        view.layer.addSublayer(metalLayer)
    }
    
    func setVertexBuffer() {
        let dataSize = vertexData.count * MemoryLayout.size(ofValue: vertexData[0])
        vertexBuffer = device.makeBuffer(bytes: vertexData, length: dataSize, options: .storageModePrivate)
        
    }


}

