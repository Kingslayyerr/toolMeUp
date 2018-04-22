//
//  ListViewController.swift
//  Toolify
//
//  Created by Hevin Jantasmin on 4/22/18.
//  Copyright © 2018 Hevin Febryo. All rights reserved.
//

import UIKit
import Firebase

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // DUMMY DATA
    var itemsDummy = ["High Quality Ladder","Ladder","Ladder","Short Ladder","Ladder Set (Tall, Short)","Light Ladder"]
    var locationsDummy = ["Los Angeles, CA", "Los Angeles, CA", "Los Angeles, CA", "Los Angeles, CA", "Los Angeles, CA", "Los Angeles, CA"]
    var pricesDummy = ["$8","$6","$7.5","$5","$10","$8"]
    var imagesArray = ["ladder","ladder1","ladder2","ladder3","ladder4","ladder5"]
    var profileDummy = ["Ronnie","Hevin J","Chris","Jon","Jon","Ronnie"]
    
    var itemImage = ""
    var itemLabel = ""
    var price = ""
    var profilePict = ""
    
    @IBOutlet weak var itemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        
        navigationController?.navigationBar.barTintColor = UIColor.black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemTableViewCell
        cell.itemLabel?.text = itemsDummy[indexPath.row]
        cell.locationLabel?.text = locationsDummy[indexPath.row]
        cell.itemImage.image = UIImage(named: imagesArray[indexPath.row])
        cell.priceLabel?.text = pricesDummy[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemImage = imagesArray[indexPath.row]
        itemLabel = itemsDummy[indexPath.row]
        price = pricesDummy[indexPath.row]
        profilePict = profileDummy[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let destinationVC = segue.destination as! DetailViewController
            
            destinationVC.imageName = itemImage
            destinationVC.itemName = itemLabel
            destinationVC.price = price
            destinationVC.profile = profilePict
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
