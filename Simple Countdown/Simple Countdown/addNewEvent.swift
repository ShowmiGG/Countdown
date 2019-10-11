//
//  addNewEvent.swift
//  Simple Countdown
//
//  Created by Shumeng Guo on 22/01/2018.
//  Copyright © 2018 Shumeng Guo. All rights reserved.
//

import UIKit

class addNewEvent: UIViewController {

    @IBOutlet weak var eventNameLbl: UILabel!
    
    @IBOutlet weak var eventNameTextfield: UITextField!
    
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBOutlet weak var backgroundLbl: UILabel!
    
    
    @IBOutlet weak var backgroundImageLbl: UIImageView!
    
    
    @IBAction func choosePhotoBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        self.performSegue(withIdentifier: "mainMenuSegue", sender: self)
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        self.performSegue(withIdentifier: "mainMenuSegue", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
