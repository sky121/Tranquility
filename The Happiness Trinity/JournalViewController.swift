//
//  JournalViewController.swift
//  The Happiness Trinity
//
//  Created by Jacob_Huang on 1/30/21.
//  Copyright © 2021 Sky H. All rights reserved.
//

import UIKit

class JournalViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    // text field
    @IBOutlet weak var answerAchieve: UITextField!
    // label in the middle, initially empty
    @IBOutlet weak var congrats: UILabel!
    // confirm button, obviously
    @IBOutlet weak var confirmBtn: UIButton!
    // cancel button
    @IBOutlet weak var cancelBtn: UIBarButtonItem!
    
    // potential day's achievement
    var achieve: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        answerAchieve.delegate = self
    }
    
    // MARK: UITextFieldDelegate
    
    // for resigning control when the user hits enter/return/done
    func textFieldShouldReturn (_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        // should the system process the press of the return key? Yes
        return true
    }
    
    // after the field resigns first-responder status (in ShouldReturn)
    func textFieldDidEndEditing (_ textField: UITextField) {
        confirmBtn.isSelected = true
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // transition upon cancel/go back
        guard let button = sender as? UIBarButtonItem, (button === cancelBtn && achieve != nil) else {
            return
        }
        // somehow both cases get caught up... but I guess it's not important as of now
        //      the casting makes button == nil...
    }
    
    // MARK: Actions
    // Confirm button action
    @IBAction func submitAccomp(_ sender: UIButton) {
        congrats.text = "🎉🎊🥳🎉🥳\n🎊🎉🥳🎊"
        confirmBtn.isSelected = false
        confirmBtn.isEnabled = false
        achieve = answerAchieve.text
        
        let cancel = cancelBtn.customView as! UIButton
        cancel.setTitle("Go Back", for: .normal)
        cancel.sizeToFit()
    }

}
