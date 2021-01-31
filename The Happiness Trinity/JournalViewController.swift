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
    
    // MARK: Actions
    
    // Confirm button action
    @IBAction func submitAccomp(_ sender: UIButton) {
        congrats.text = "🎉🎊🥳🎉🥳\n🎊🎉🥳🎊"
        confirmBtn.isSelected = false
        confirmBtn.isEnabled = false
    }
    /*
    @IBAction func updateList(_ sender: UIButton) {
        //dynLabel.text = answerAchieve.text! + " :D"
    }*/
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
