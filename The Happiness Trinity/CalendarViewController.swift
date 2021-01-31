//
//  CalendarViewController.swift
//  The Happiness Trinity
//
//  Created by Jacob_Huang on 1/30/21.
//  Copyright © 2021 Sky H. All rights reserved.
//

import FSCalendar
import UIKit

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDelegateAppearance, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var tableAccomps: UITableView!
    
    var dateFormatter = DateFormatter()
    var accomps = [String : [String]]()
    var today: String = ""
    var dayForTable: String = ""
    let colors: [UIColor] = [.systemPurple, .systemIndigo, .systemBlue, .systemTeal, .systemGreen, .systemYellow, .systemOrange, .systemRed]
    //var accomps = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableAccomps.dataSource = self
        tableAccomps.delegate = self
        calendar.delegate = self
        dateFormatter.dateStyle = .short
        today = dateFormatter.string(from: Date())
        dayForTable = today
        
        
        // debug only
        accomps["1/1/21"] = ["a"]
        accomps["1/2/21"] = ["a", "b"]
        accomps["1/3/21"] = ["a", "b", "c"]
        accomps["1/4/21"] = ["a", "b", "c", "d"]
        accomps["1/5/21"] = ["a", "b", "c", "d", "e"]
        accomps["1/6/21"] = ["a", "b", "c", "d", "e", "f"]
        accomps["1/7/21"] = ["a", "b", "c", "d", "e", "f", "g"]
        accomps["1/8/21"] = ["a", "b", "c", "d", "e", "f", "g", "h"]
        accomps["1/9/21"] = ["a", "b", "c", "d", "e", "f", "g", "h", "i"]
        accomps["1/29/21"] = ["a", "b", "c"]
        accomps["1/26/21"] = ["code", "study"]
        accomps["1/30/21"] = ["eleven"]
        
        
        
        tableAccomps.reloadData()
    }
    
    /*
    func buildFromJSON () {
        
    }*/
    
    // number of rows in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // just because
        today = dateFormatter.string(from: Date())
        
        let dayArray = accomps[dayForTable]
        var count = 0;
        if dayArray != nil {
            count = dayArray!.count
        }
        //print(count)
        return count
    }
    
    // what content should table rows have?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dayArray = accomps[dayForTable]
        var text = ""
        var color: UIColor = .white
        if dayArray != nil && indexPath.row < dayArray!.count && dayArray!.count > 0 {
            text = dayArray![indexPath.row]
            color = colors[min(dayArray!.count - 1, colors.count - 1)]
        }
        
          // in storyboard: set constraint height, add the prototype cell (called Table View Cell),
            // add label, create actual outlet,set those 2 fields for AccompCell, add 0 lines for the line
            // size of the label
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccompCell") as! AccompCell
        cell.accompLabel.text = text
        cell.accompColor.backgroundColor = color
        cell.accompColor.textColor = color
        
        /*
        let cell = UITableViewCell()
        cell.textLabel!.text = text
        //cell.backgroundColor = 
        //print("\(cell.textLabel!.text)")
        */
 
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
            calendar.reloadData()
        }
    }
    
    // clicked on a date
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let dateSelected = dateFormatter.string(from: date)
        dayForTable = dateSelected
        tableAccomps.reloadData()
        //print("\(accomps[dateSelected])")
    }

    
    
    /* this one would be for the fill color, but I think that's a bit much
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        
        let dateF = dateFormatter.string(from: date)
        let dayArray = accomps[dateF]
        
        if dayArray != nil && dayArray!.count > 0 {
            return colors[min(dayArray!.count - 1, colors.count)]
        }
        
        return nil
    }*/
 
    // this is for the circular outline color, and it's pretty good
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, borderDefaultColorFor date: Date) -> UIColor? {
        
        let dateF = dateFormatter.string(from: date)
        let dayArray = accomps[dateF]
        
        if dayArray != nil && dayArray!.count > 0 {
            return colors[min(dayArray!.count - 1, colors.count - 1)]
        }
        
        return nil
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
