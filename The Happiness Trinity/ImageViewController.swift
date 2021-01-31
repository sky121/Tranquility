//
//  ImageViewController.swift
//  The Happiness Trinity
//
//  Created by Jimmy LI on 1/30/21.
//  Copyright © 2021 Sky H. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var textField: UILabel!
    
    
    @IBOutlet weak var dogButton: UIButton!
    @IBOutlet weak var catButton: UIButton!
    @IBOutlet weak var artButton: UIButton!
    @IBOutlet weak var natureButton: UIButton!
    var query = ""

    let group = DispatchGroup()
    
    @IBAction func onClickDog(_ sender: Any) {
        group.enter()
        query = query + "dog"
        group.leave()
        
        group.notify(queue: DispatchQueue.main){
            self.performSegue(withIdentifier: "onClickPreference", sender: self)
        }
        
    }
    
    @IBAction func onClickCat(_ sender: Any) {
        group.enter()
        query = query + "cat"
        group.leave()
        
        group.notify(queue: DispatchQueue.main){
            self.performSegue(withIdentifier: "onClickPreference", sender: self)
        }
    }
    
    @IBAction func onClickNature(_ sender: Any) {
        
        group.enter()
        query = query + "Nature"
        group.leave()
        
        group.notify(queue: DispatchQueue.main){
            self.performSegue(withIdentifier: "onClickPreference", sender: self)
        }
    }
    
    
    @IBAction func onClickArt(_ sender: Any) {
        
        group.enter()
        query = query + "Art"
        group.leave()
        
        group.notify(queue: DispatchQueue.main){
            self.performSegue(withIdentifier: "onClickPreference", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.layer.cornerRadius = 10.0
        textField.clipsToBounds = true
        dogButton.layer.cornerRadius = 10.0
        catButton.layer.cornerRadius = 10.0
        natureButton.layer.cornerRadius = 10.0
        artButton.layer.cornerRadius = 10.0
        dogButton.clipsToBounds = true
        catButton.clipsToBounds = true
        natureButton.clipsToBounds = true
        artButton.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let pictureCollectionsViewController = segue.destination as! PictureCollectionViewController
        pictureCollectionsViewController.query = self.query
        query = ""
    }


}
