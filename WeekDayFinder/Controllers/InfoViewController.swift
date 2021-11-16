//
//  InfoViewController.swift
//  WeekDayFinder
//
//  Created by edgars.vasiljevs on 15/11/2021.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var appInfoLabel: UIStackView!
    @IBOutlet weak var appDiscLabel: UILabel!
    
    var infoText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !infoText.isEmpty{
            
        
        appDiscLabel.text = infoText
        // Do any additional setup after loading the view.
    }
    }
    

   

}
