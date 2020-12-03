//
//  ProgressBar.swift
//  Progressify
//
//  Created by IT on 12/1/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit
@IBDesignable
class ProgressBar: UIView {
    private var hexaBackgroundLayer: CAShapeLayer!
    private var hexaForgroundLayer: CAShapeLayer!
    private var backgroundLayer: CAShapeLayer!
    private var forgroundLayer: CAShapeLayer!
    private var pictureLayer: CATextLayer!
    @IBInspectable var StrokeEnd: CGFloat = 0.8
    @IBInspectable var width: Int = 200
    @IBInspectable var height: Int = 200
    var path: UIBezierPath!
    var image: String?
    public var progress: CGFloat = 0 {
        didSet{
            didProgressUpdated()
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override init(frame: CGRect) {
               super.init(frame: frame)
           }
    required init?(coder aDecoder: NSCoder) {
               super.init(coder: aDecoder)
           }
    convenience init(image: String) {
        self.init(frame: CGRect.zero)
        self.image = image
        //assign custom vars
    }
    override func draw(_ rect: CGRect) {
        let width = rect.width
        let height = rect.height
        let lineWidth = 0.1 * min(width/2, height)
        backgroundLayer = createCircularLayer(rect: rect, strokeColor: UIColor.systemGray.cgColor, fillColor: UIColor.white.cgColor, lineWidth: 1 , dashline: true)
        layer.addSublayer(backgroundLayer)
        forgroundLayer = createCircularLayer(rect: rect, strokeColor: UIColor.systemBlue.cgColor, fillColor: UIColor.white.cgColor, lineWidth: lineWidth ,dashline: false)
        layer.addSublayer(forgroundLayer)
        hexaForgroundLayer = createHexagonLayer(rect: rect, strokeColor: UIColor.systemRed.cgColor, fillColor:  UIColor.blue.cgColor, lineWidth: lineWidth, dashline: false)
        layer.addSublayer(hexaForgroundLayer)
        
    }
    private func createCircularLayer( rect: CGRect , strokeColor: CGColor, fillColor: CGColor , lineWidth: CGFloat ,dashline: Bool) -> CAShapeLayer{
        let width = rect.width
        let height = rect.height
        let center = CGPoint(x: width / 2, y: height / 2)
        let radius = (min(width, height) - lineWidth) / 2 - 10
        let startAngle = -CGFloat.pi / 2
        let endAngle = startAngle +  2 * CGFloat.pi
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        let shapeLayer = CAShapeLayer()
        if (dashline == true){
            shapeLayer.path  = circularPath.cgPath
            shapeLayer.strokeColor = strokeColor
            shapeLayer.fillColor  = fillColor
            shapeLayer.lineWidth = lineWidth
            shapeLayer.lineCap = .round
            shapeLayer.lineDashPattern = [7, 3]
        }
        else{
            shapeLayer.path  = circularPath.cgPath
            shapeLayer.strokeColor = strokeColor
            shapeLayer.fillColor  = fillColor
            shapeLayer.lineWidth = lineWidth
            shapeLayer.lineCap = .round
            shapeLayer.strokeEnd = StrokeEnd
        }
        
        return shapeLayer
    }
    
    private func createHexagonLayer( rect: CGRect , strokeColor: CGColor, fillColor: CGColor , lineWidth: CGFloat ,dashline: Bool) -> CAShapeLayer{
        let circularPath = shapeModification(rect: rect)
        let shapeLayer = CAShapeLayer()
        if (dashline == true){
            shapeLayer.path  = circularPath.cgPath
            shapeLayer.strokeColor = strokeColor
            shapeLayer.fillColor  = fillColor
            shapeLayer.lineWidth = lineWidth
            shapeLayer.lineCap = .round
            shapeLayer.lineDashPattern = [7, 3]
        }
        else{
            shapeLayer.path  = circularPath.cgPath
            shapeLayer.strokeColor = strokeColor
            shapeLayer.fillColor  = fillColor
            shapeLayer.lineWidth = lineWidth
            shapeLayer.lineCap = .round
            shapeLayer.strokeEnd = 0.8
        }
        
        return shapeLayer
    }
    
    private func didProgressUpdated(){
        forgroundLayer?.strokeEnd = progress
    }
    func createHexagon() -> UIBezierPath{
         let numberOfSides: CGFloat = 6
         let radiusOuterCircle: CGFloat = bounds.width - 80
         let sideLength = radiusOuterCircle / 2
         let theta = (CGFloat.pi * 2) / numberOfSides
         let centerX = sideLength + 40
         let centerY = sideLength + 40

         let initialPoint = CGPoint(x: radiusOuterCircle * cos(2 * CGFloat.pi * 0/numberOfSides + theta) + centerX, y: radiusOuterCircle * sin(2 * CGFloat.pi * 0/numberOfSides + theta) + centerY)

         let shapePath = UIBezierPath()
         shapePath.move(to: initialPoint)
         for i in 1...Int(numberOfSides) {
             shapePath.addLine(to: CGPoint(x: radiusOuterCircle * cos(2 * CGFloat.pi * CGFloat(i) / numberOfSides + theta) + centerX, y: radiusOuterCircle * sin(2 * CGFloat.pi * CGFloat(i) / numberOfSides + theta) + centerY))
         }
         shapePath.close()
        return shapePath
    }
    func shapeModification(rect: CGRect) ->UIBezierPath{
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
        }
        
        
        
        return path
    }
    
}
