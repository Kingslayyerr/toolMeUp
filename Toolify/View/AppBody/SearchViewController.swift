//
//  SearchViewController.swift
//  Toolify
//
//  Created by Hevin Jantasmin on 4/22/18.
//  Copyright © 2018 Hevin Febryo. All rights reserved.
//

import UIKit
import Firebase

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate {
 
    @IBOutlet weak var searchBar: UITextField!
    
    // DUMMY DATA
    var itemsDummy = ["Outdoors","Household","Tools","Sports","Electronics"]
    var locationsDummy = ["Los Angeles, CA", "Los Angeles, CA", "Los Angeles, CA", "Los Angeles, CA", "Los Angeles, CA"]
    var pricesDummy = ["$15","$10","$10","$3","$20"]
    var imagesArray = ["odbg","hibg","toolsbg","sgbg","elecbg"]
    
    
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
        
        // change navigation bar to black
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        // to hide the back button on navigation bar
        self.navigationItem.hidesBackButton = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButton(_ sender: Any) {
        performSegue(withIdentifier: "moveToList", sender: self)
    }
    
    
    // MARK: - CollectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.itemLabel.text = itemsDummy[indexPath.row]
        cell.itemImage.image = UIImage(named: imagesArray[indexPath.row])
        
        return cell
    }
    
    
    // MARK: - Buttons
    @IBAction func menuButton(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Menu", message: "", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Start Lending", style: .default, handler: { (alert) in
            self.performSegue(withIdentifier: "goToLend", sender: self)
        }))
        actionSheet.addAction(UIAlertAction(title: "Edit Profile", style: .default, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Sign Out", style: .default, handler: { (alert) in
            do {
                try Auth.auth().signOut()
                self.navigationController?.popToRootViewController(animated: true)
            }
            catch {
                print("Error signing out")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    // MARK: - TextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchBar.resignFirstResponder()
        return true
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
