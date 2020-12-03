//
//  shapesModification.swift
//  Progressify
//
//  Created by IT on 12/2/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit

class shapesModification: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let width = rect.width
        let height = rect.height
        let center = CGPoint(x: width / 2, y: height / 2)
        let path = UIBezierPath()
        let radius: Double = Double(rect.width) / 2
        for i in stride(from: 0, to: 361.0, by: 40){
            let radian = i * Double.pi / 180
            let x = Double(center.x) + radius * cos(radian)
            let y = Double(center.y) + radius * sin(radian)
            
            
            path.addLine(to: CGPoint(x: x, y: y))
            path.lineWidth = 5
            path.stroke()
//            let shapeLayer = CAShapeLayer()
//            shapeLayer.path = path.cgPath
//            shapeLayer.lineWidth = 5
//            layer.addSublayer(shapeLayer)
            
            
    }
    

}
}
