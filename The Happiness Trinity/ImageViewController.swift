//
//  ImageViewController.swift
//  The Happiness Trinity
//
//  Created by Jimmy LI on 1/30/21.
//  Copyright © 2021 Sky H. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    let access_token = "&client_id=idPu07ljZv9059UOqwNgNRGNUmZgMr92hQChgeVA6Pc"
    let base_url = "https://api.unsplash.com/search/photos?query="
    var query = ""
    
    var picture_gallery = [[String:Any]]()
    
    
    @IBAction func onClickDog(_ sender: Any) {
        query = query + "dog"
        let complete_url = base_url + query + access_token
        network_request(complete_url)
    }
    
    func network_request(_ complete_url: String){
        
        let url = URL(string: complete_url)!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            print(dataDictionary)
            self.picture_gallery = dataDictionary["results"] as! [[String : Any]]

              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data

           }
        }
        task.resume()
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
