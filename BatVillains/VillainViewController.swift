//
//  VillainViewController.swift
//  BatVillains
//
//  Created by Robert Thompson on 11/1/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import UIKit

class VillainViewController: UIViewController {

    var villain: Villain?
    
    @IBOutlet weak var villainViewImage: UIImageView!
    @IBOutlet weak var villainViewTitle: UILabel!
    @IBOutlet weak var villainViewBody: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // navigationItem.title = villain?.name
        villainViewTitle.text = villain?.name
       // locationLabel.text = villain?.alias
        villainViewBody.text = villain?.description
        //dateLabel.text = villain?.timestamp.description
        if let imageName = villain?.imageName {
            villainViewImage.image = UIImage(named: imageName)
            // Do any additional setup after loading the view.
        } else if let imageURL = villain?.imageURL {
            let session = URLSession(configuration: .default)
            if let url = URL(string: imageURL) {
                let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                    if let d = data {
                        DispatchQueue.main.async {
                            self.villainViewImage.image = UIImage(data: d)
                        }
                    }
                })
                task.resume()
            }
        }
        
        
        
        
    }


}
