//
//  ViewController.swift
//  iPodnote
//
//  Created by Spoon on 20/05/2019.
//  Copyright © 2019 Spoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var _allNotes:String = ""
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var ui_delete_btn: UIButton!
    @IBOutlet weak var ui_font_btn: UISegmentedControl!
    @IBOutlet weak var ui_text_field: UITextField!
    @IBOutlet var ui_text_view: UIView!
    @IBOutlet weak var ui_text_note: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let existingText = defaults.string(forKey: "ALL_NOTE") ?? ""
        _allNotes = existingText
        ui_text_note.text = _allNotes
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let fontSize = UserDefaults.standard.double(forKey: "FONT_SIZE")
        ui_text_note.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        ui_text_note.text = ""
        _allNotes = ""
        defaults.removeObject(forKey: "ALL_NOTE")
        ui_delete_btn.isEnabled = false
    }
    
    @IBAction func validButton(_ sender: Any) {
        if let myText:String = ui_text_field.text,
            myText.count > 0{
            _allNotes = _allNotes + myText + "\n"
            ui_text_field.text = ""
            ui_text_note.text = _allNotes
            saveNote()
            ui_delete_btn.isEnabled = true
        }
    }
    func saveNote(){
        defaults.set(_allNotes, forKey: "ALL_NOTE")
    }
    
    @IBAction func fontBtn(_ sender: Any) {
//        let boldFont = UIFont.boldSystemFont(ofSize: 16)
//        let italicFont = UIFont.italicSystemFont(ofSize: 16)
//        let getIndex = ui_font_btn.selectedSegmentIndex
//        switch (getIndex){
//        case 0:
//            ui_text_note.text = boldFont
//        case 1:
//            ui_text_note.text = italicFont
//        default:
//            break
//        }
    }
    
}
