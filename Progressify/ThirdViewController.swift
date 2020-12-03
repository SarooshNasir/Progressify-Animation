//
//  ThirdViewController.swift
//  Progressify
//
//  Created by IT on 12/3/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.red.cgColor

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
