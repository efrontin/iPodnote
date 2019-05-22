//
//  SettingsViewController.swift
//  iPodnote
//
//  Created by Spoon on 21/05/2019.
//  Copyright © 2019 Spoon. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var ui_fontSizeStepper: UIStepper!
    
    @IBOutlet weak var ui_bg_mode_btn: UISegmentedControl!
    
    @IBOutlet weak var ui_ExempleStepper: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fontSize = UserDefaults.standard.double(forKey: "FONT_SIZE")
        ui_ExempleStepper.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        ui_fontSizeStepper.value = fontSize
        // changer taille du label et convertir en entier
    }
    
    
    @IBAction func saveSettings() {
        let newSize:Double = ui_fontSizeStepper.value
        // sauvegarde de ma taille
        UserDefaults.standard.set(newSize, forKey: "FONT_SIZE")
        // UserDefaultregister.standard.register:["FONT_SIZE", "16",""]
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeBgMode() {
        let getIndex = ui_bg_mode_btn.selectedSegmentIndex
        switch (getIndex) {
        case 0:
        view.backgroundColor = UIColor.white
        case 1:
            view.backgroundColor = UIColor.yellow
        default:
            break
        }
    }
    
    @IBAction func fontSizeChanged() {
        // parametrer nouvelle taille
        let newSize:Double = ui_fontSizeStepper.value
        // appliquer sur l'exemple
        ui_ExempleStepper.font = UIFont.systemFont(ofSize: CGFloat(newSize))
        // changer taille du label et convertir en entier
        
    }
    
    private func updateLayout(){
        
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
