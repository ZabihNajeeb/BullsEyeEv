//
//  ViewController.swift
//  BullsEye
//
//  Created by Zabihullah Najeeb on 2024-05-23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var moodPicker: UIPickerView!
    @IBOutlet weak var logButton: UIButton!
    
    var selectedMood: String = "Happy"
    var moodLogs: [(String, Date)] = []
    //this is the defulat selected value everytime it run.
    
    
    let moods = ["Happy", "Sad", "Angry", "Relaxed", "Stressed"]
    // these are the arrary of String Variable that store 5 typse of string Data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moodPicker.delegate = self
        moodPicker.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "History", style: .plain, target: self, action: #selector(showHistory))
    }
    
    @IBAction func logMood(_ sender: UIButton) {
        let currentMoodLog = (selectedMood, Date())
        moodLogs.append(currentMoodLog)
    }
    
    @objc func showHistory() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let historyVC = storyboard.instantiateViewController(identifier: "HistoryViewController") as! HistoryViewController
        historyVC.moodLogs = moodLogs
        navigationController?.pushViewController(historyVC, animated: true)
    }
    
    // UIPickerView Data Source and Delegate Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return moods.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return moods[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedMood = moods[row]
    }
}

