//
//  ViewController.swift
//  WeekDayFinder
//
//  Created by edgars.vasiljevs on 13/11/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dayText: UITextField!
    @IBOutlet weak var monthText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func findButtonAction(_ sender: Any) {
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        
        guard let day = Int(dayText.text!), let month = Int(monthText.text!), let year = Int(yearText.text!) else{
            //alert
            warningAlert(withTitle: "Input Error!", withMessage: "Date text fields can't be empty")
            return
        }
        
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        
        guard let date = calendar.date(from: dateComponents) else{return}
     
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "lv_LV")
        dateFormatter.dateFormat = "EEEE"
        
        switch findButton.titleLabel?.text{
        case "FIND":
            findButton.setTitle("CLEAR", for: .normal)
            //31 February
            if day >= 1 && day <= 31 && month >= 1 && month <= 12{
                let weekday = dateFormatter.string(from: date)
                resultLabel.text = weekday.capitalized
            }else{
                warningAlert(withTitle: "Error!", withMessage: "Wrong Date, please enter the correct Date")
            }
        default: findButton.setTitle("FIND", for: .normal)
            //Clear
            clearTextFields()
        }
    }
    
    func clearTextFields(){
        dayText.text = ""
        monthText.text = ""
        yearText.text = ""
        resultLabel.text = "Press Find to search for yor day"
    }
    
    
    
    func warningAlert(withTitle title: String?, withMessage message: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "day"{
            
        
        // Get the new view controller using segue.destination.
        let vc = segue.destination as!  InfoViewController
        // Pass the selected object to the new view controller.
            vc.infoText = "Day finder helps you \nto find weekday for given date."
            
        }
    }
    
    
    
}

