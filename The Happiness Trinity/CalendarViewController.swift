//
//  CalendarViewController.swift
//  The Happiness Trinity
//
//  Created by Jacob_Huang on 1/30/21.
//  Copyright © 2021 Sky H. All rights reserved.
//

import FSCalendar
import UIKit

class CalendarViewController: UIViewController, FSCalendarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var tableAccomps: UITableView!
    
    var dateFormatter = DateFormatter()
    var accomps = [String : [String]]()
    var today: String = ""
    var whichDay: String = ""
    //var accomps = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableAccomps.dataSource = self
        tableAccomps.delegate = self
        calendar.delegate = self
        dateFormatter.dateStyle = .short
        today = dateFormatter.string(from: Date())
        whichDay = today
        
        // debug only
        accomps["1/29/21"] = ["a", "b", "c"]
        accomps["1/26/21"] = ["code", "study"]
        accomps["1/30/21"] = ["eleven"]
        
        tableAccomps.reloadData()
    }
    
    // number of rows in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dayArray = accomps[whichDay]
        var count = 0;
        if dayArray != nil {
            count = dayArray!.count
        }
        //print(count)
        return count
    }
    
    // what content should table rows have?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let dayArray = accomps[whichDay]
        if dayArray == nil {
            //print("nothing done")
            cell.textLabel!.text = ""
        }
        else {
            if indexPath.row >= dayArray!.count {
                //print("\(indexPath.row) < \(dayArray!.count)")
                cell.textLabel!.text = ""
            }
            else {
                //print("something done")
                cell.textLabel!.text = dayArray![indexPath.row]
            }
        }
        
        //print("\(cell.textLabel!.text)")
        return cell
    }
    
    // segue unwind (as in we just got some data, possibly)
    @IBAction func unwindToCalendar(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? JournalViewController, let achieve = sourceViewController.achieve {
            
            today = dateFormatter.string(from: Date())
            var todaysTasks = accomps[today]
            if todaysTasks == nil {
                todaysTasks = [achieve]
            }
            else {
                todaysTasks!.append(achieve)
            }
            accomps[today] = todaysTasks
            //print("\(today): added \(accomps)")
            
            tableAccomps.reloadData()
        }
    }
    
    // clicked on a date
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateSelected = dateFormatter.string(from: date)
        whichDay = dateSelected
        tableAccomps.reloadData()
        //print("\(accomps[dateSelected])")
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
