//
//  AddContactViewController.swift
//  The Happiness Trinity
//
//  Created by Sky H on 1/30/21.
//  Copyright © 2021 Sky H. All rights reserved.
//

import UIKit

protocol ContactDelegate: class {
    func numberConfirmed(_ number: String)
}


class AddContactViewController: UIViewController {

    weak var delegate: ContactDelegate?
    
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBAction func Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func Confirm(_ sender: Any) {
        let number = phoneNumberField?.text ?? "0000000000"
        delegate?.numberConfirmed(number)
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
