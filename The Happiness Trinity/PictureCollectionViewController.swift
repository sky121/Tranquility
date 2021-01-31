//
//  PictureCollectionViewController.swift
//  The Happiness Trinity
//
//  Created by Jimmy LI on 1/30/21.
//  Copyright © 2021 Sky H. All rights reserved.
//

import UIKit
import AlamofireImage

class PictureCollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var picture_gallery = [[String:Any]]()
    
    let access_token = "&client_id=idPu07ljZv9059UOqwNgNRGNUmZgMr92hQChgeVA6Pc"
    let base_url = "https://api.unsplash.com/search/photos?query="
    var query: String!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
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
            self.picture_gallery = dataDictionary["results"] as! [[String : Any]]
            self.collectionView.reloadData()
              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data

           }
        }
        task.resume()
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let complete_url = base_url + query + access_token
        network_request(complete_url)
        
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picture_gallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureViewCell", for: indexPath) as! PictureViewCell
        
        let picture = picture_gallery[indexPath.item]
        let picture_urls = picture["urls"] as! [String:String]
        let picture_raw = URL(string: picture_urls["raw"]! + "&w=195&dpr=1")
        
        cell.picture.af_setImage(withURL: picture_raw!)
        
        return cell
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
