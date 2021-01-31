//
//  CalendarViewController.swift
//  The Happiness Trinity
//
//  Created by Jacob_Huang on 1/30/21.
//  Copyright © 2021 Sky H. All rights reserved.
//

import FSCalendar
import UIKit

class CalendarViewController: UIViewController, FSCalendarDelegate {
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var tableAccomps: UITableView!
    
    var accomps = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        calendar.delegate = self
    }
    
    @IBAction func unwindToCalendar(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? JournalViewController, let achieve = sourceViewController.achieve {
            
            accomps.append(achieve)
            print("added")
        }
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("test")
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
