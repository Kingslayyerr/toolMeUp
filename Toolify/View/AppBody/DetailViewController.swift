//
//  DetailViewController.swift
//  Toolify
//
//  Created by Hevin Jantasmin on 4/22/18.
//  Copyright © 2018 Hevin Febryo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    var imageName = ""
    var itemName = ""
    var price = ""
    var profile = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemLabel.text = itemName
        itemImage.image = UIImage(named: imageName)
        itemPrice.text = price
        profileImage.image = UIImage(named: profile)
        profileName.text = profile
        navigationController?.navigationBar.barTintColor = UIColor.black
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
