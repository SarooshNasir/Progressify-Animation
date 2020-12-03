//
//  TwoRingProgressBar.swift
//  Progressify
//
//  Created by IT on 12/2/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit
@IBDesignable
class TwoRingProgressBar: UIView {
    
    @IBInspectable  var backgroundStrokecolor: UIColor = .systemGray
    @IBInspectable var fillColor: UIColor = .white
    @IBInspectable var foregroundStrokeColor: UIColor = .darkGray
    @IBInspectable var strokeEnd: CGFloat = 0.8
    private var backgroundLayer: CAShapeLayer!
    @IBOutlet var imageVieww: UIImageView!
    let nibName = "RCircularView"
    var contentView:UIView?
    private var forgroundLayer: CAShapeLayer!
    private var pictureLayer: CATextLayer!
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
    func commonInit() {
          guard let view = loadViewFromNib() else { return }
          view.frame = self.bounds
          self.addSubview(view)
          contentView = view
      }
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    func setImageOnImageView(image: String){
        if let iv = imageVieww{
            if let image = UIImage(named: image){
                iv.image = image
                addSubview(imageVieww)
            }
        }
          //imageVieww.image = UIImage(named: image) as? UIImage
        
        
    }
    override func draw(_ rect: CGRect) {
        let width = rect.width
        let height = rect.height
        let lineWidth = 0.1 * min(width/2, height)
        backgroundLayer = createCircularLayer(rect: rect, strokeColor: backgroundStrokecolor.cgColor, fillColor: fillColor.cgColor, lineWidth: lineWidth , dashline: true)
        layer.addSublayer(backgroundLayer)
        forgroundLayer = createCircularLayer(rect: rect, strokeColor: foregroundStrokeColor.cgColor, fillColor: fillColor.cgColor, lineWidth: lineWidth ,dashline: false)
        layer.addSublayer(forgroundLayer)
        
    }
    private func createCircularLayer( rect: CGRect , strokeColor: CGColor, fillColor: CGColor , lineWidth: CGFloat ,dashline: Bool) -> CAShapeLayer{
        let width = rect.width
        let height = rect.height
        let center = CGPoint(x: width / 2, y: height / 2)
        let radius = (min(width, height) - lineWidth) / 2
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
            shapeLayer.strokeEnd = strokeEnd
        }
        
        return shapeLayer
    }
    private func createRingLayer( rect: CGRect , strokeColor: CGColor, fillColor: CGColor , lineWidth: CGFloat ,dashline: Bool) -> CAShapeLayer{
        let width = rect.width
        let height = rect.height
        let center = CGPoint(x: width / 2, y: height / 2)
        let radius = (min(width, height) - lineWidth) / 2
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
        }
        else{
            shapeLayer.path  = circularPath.cgPath
            shapeLayer.strokeColor = strokeColor
            shapeLayer.fillColor  = fillColor
            shapeLayer.lineWidth = lineWidth
            shapeLayer.lineCap = .round
        }
        
        return shapeLayer
    }
    
    private func didProgressUpdated(){
        forgroundLayer?.strokeEnd = progress
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
