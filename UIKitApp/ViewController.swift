//
//  ViewController.swift
//  UIKitApp
//
//  Created by Артём Дмитриев on 26.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var mainButton: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var switcher: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARK: Segmented control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        // MARK: Label
        mainLabel.text = ""
        mainLabel.font = mainLabel.font.withSize(38)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        //MARK: Slider
        slider.value = 1
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .blue
        slider.thumbTintColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        
        mainLabel.text = String(slider.value)
        
        // MARK: textField
        textField.backgroundColor = .white
        textField.keyboardType = .numberPad
        
        // MARK: Button
        mainButton.layer.cornerRadius = 10
        mainButton.setTitle("Готово", for: .normal)
        
    }


    @IBAction func segmentedControlAction(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "Выбран сегмент с индексом 0"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "Выбран сегмент с индексом 1"
            mainLabel.textColor = .yellow
        case 2:
            mainLabel.text = "Выбран сегмент с индексом 2"
            mainLabel.textColor = .green
        default: break
        }
    }
    
    
    @IBAction func sliderAction() {
        mainLabel.text = String(Int(slider.value))
    }
    
    
    @IBAction func mainButtonAction(_ sender: Any) {
        guard let text = textField.text, !text.isEmpty else { return }
            mainLabel.text = text
    }
    
    @IBAction func datePickerAction(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        
        mainLabel.text = dateFormatter.string(from: datePicker.date)
    }
    
    @IBAction func switcherAction(_ sender: Any) {
        segmentedControl.isHidden = !switcher.isOn
        mainLabel.isHidden = !switcher.isOn
        textField.isHidden = !switcher.isOn
        slider.isHidden = !switcher.isOn
        mainButton.isHidden = !switcher.isOn
        datePicker.isHidden = !switcher.isOn
    }
    
}

