//
//  secondViewController.swift
//  Progressify
//
//  Created by IT on 12/3/20.
//  Copyright © 2020 IT. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet weak var ringwothImageView: TwoRingProgressBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        ringwothImageView.setImageOnImageView(image: "circle-profile-pic")
//        let demo = TwoRingProgressBar()
//        demo.setImageOnImageView(image: "circle-profile-pic")

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
