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
    
    var dateFormatter = DateFormatter()
    var accomps = [String : [String]]()
    //var accomps = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        calendar.delegate = self
        dateFormatter.dateStyle = .short
        
        // debug only
        accomps["1/29/21"] = ["a", "b", "c"]
        accomps["1/26/21"] = ["code", "study"]
        
    }
    
    @IBAction func unwindToCalendar(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? JournalViewController, let achieve = sourceViewController.achieve {
            
            let today = dateFormatter.string(from: Date())
            var todaysTasks = accomps[today]
            if todaysTasks == nil {
                todaysTasks = [achieve]
            }
            else {
                todaysTasks!.append(achieve)
            }
            accomps[today] = todaysTasks
            //print("\(today): added \(accomps)")
        }
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateSelected = dateFormatter.string(from: date)
        print("\(accomps[dateSelected])")
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
