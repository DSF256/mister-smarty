//
//  ViewController.swift
//  MSCM
//
//  Created by Jeremy Hall on 1/12/21.
//  Copyright © 2021 CEG-4981 Team 09. All rights reserved.
//

import UIKit
import CocoaMQTT

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    // Instantiate CocoaMQTT as MQTTClient
    let mqttClient = CocoaMQTT(clientID: "iOS Device", host: "192.168.0.10", port: 1883)
    
    var selectedCountry: String?
    var countryList = ["155", "160", "165", "170", "175", "180", "185", "190", "195"]
    @IBOutlet weak var textFiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        dismissPickerView()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryList[row]
       
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountry = countryList[row]
        textFiled.text = selectedCountry
    }
    
    func createPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        textFiled.inputView = pickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let button = UIBarButtonItem(title: "Finish", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        textFiled.inputAccessoryView = toolBar
    }
    
    @IBAction func activateSwitch(_ sender: UISwitch) {
        if sender.isOn {
            mqttClient.publish("rpi/gpio", withString: "on")
        }
        else {
            mqttClient.publish("rpi/gpio", withString: "off")
        }
    }
    
    @IBAction func submission(_ sender: UIButton) {
        mqttClient.connect()
    }
    
    
    @objc func action() {
       view.endEditing(true)
    }


}

