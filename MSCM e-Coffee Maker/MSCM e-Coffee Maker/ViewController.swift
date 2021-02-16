//
//  ViewController.swift
//  MSCM e-Coffee Maker
//
//  Created by Jeremy Hall on 1/12/21.
//  Copyright © 2021 CEG-4981 Team 09. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var correctPW :String = "WSU2021S"
    @IBOutlet weak var verifyLabel: UILabel!
    @IBOutlet weak var TempPicker: UIPickerView!
    
    let temps = ["155","160","165","170","175","180","185","190","195"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TempPicker.delegate = self
        TempPicker.dataSource = self
    }
    
    @IBAction func PassWord(_ sender: UITextField) {
        if sender.text! == correctPW {
            verifyLabel.text = "That's right!"
        } else {
            verifyLabel.text = "That's wrong!"
        }
    }
    
    func numberOfComponents(in TempPicker: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ TempPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return temps.count
    }

    func pickerView(_ TempPicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return temps[row]
    }
    
}

