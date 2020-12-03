//
//  ViewController.swift
//  Progressify
//
//  Created by IT on 12/1/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit
import CoreCharts

class ViewController: UIViewController , CoreChartViewDataSource {
    @IBOutlet weak var barChart: VCoreBarChart!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressBar: ProgressBar!
    var countFire: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = progressBar.createHexagon().cgPath
        shapeLayer.strokeColor = UIColor.systemGreen.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 7
        
        
        progressBar.layer.addSublayer(shapeLayer)
        
          barChart.dataSource = self
        barChart.displayConfig.barWidth = 10
        barChart.displayConfig.barSpace = 40
        imageView.layer.borderWidth = 1
          imageView.layer.masksToBounds = false
          imageView.layer.borderColor = UIColor.black.cgColor
          imageView.layer.cornerRadius = imageView.frame.height/2
          imageView.clipsToBounds = true
//        let progress = ProgressBar(image: "circle-profile-pic")
        let imageName = "circle-profile-pic"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 160, y: 155, width: 100, height: 100)
        view.addSubview(imageView)
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            self.countFire += 1
            DispatchQueue.main.async {
                self.progressBar.progress = min(0.03 * self.countFire, 1)
                if self.progressBar.progress == 1{
                    timer.invalidate()
                }
            }
        }
    }
    func didTouch(entryData: CoreChartEntry) {
        print(entryData.barTitle)
    }
    
    func loadCoreChartData() -> [CoreChartEntry] {
        
        return getTurkeyFamouseCityList()
        
    }
    
    
    func getTurkeyFamouseCityList()->[CoreChartEntry] {
        var allCityData = [CoreChartEntry]()
        let cityNames = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
        let plateNumber = [34,07,06,61,35,09,34]
        
        for index in 0..<cityNames.count {
            
            let newEntry = CoreChartEntry(id: "\(plateNumber[index])",
                                          barTitle: cityNames[index],
                                          barHeight: Double(plateNumber[index]),
                                          barColor: UIColor.systemBlue)
                                          
                                         
            allCityData.append(newEntry)
            
        }
        
        return allCityData
        
    }


}

