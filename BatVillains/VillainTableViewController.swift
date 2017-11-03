//
//  VillainTableViewController.swift
//  BatVillains
//
//  Created by Robert Thompson on 10/31/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import UIKit

class VillainTableViewController: UITableViewController
{
    var data: [Villain]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = DataSet.sampleData
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    //first thing to do - define model
    

    // MARK: - Key UI view table source methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       return data?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "villainCell", for: indexPath)

        // Configure the cell...
        if let villainCell = cell as? VillainTableViewCell {
            if let therealdata = data {
                let villain = therealdata[indexPath.row]
                
                villainCell.titleLabel?.text = villain.name
                villainCell.locationLabel?.text = villain.alias
                //villainCell.timeLabel?.text = villain.timestamp.description
                if let imageName = villain.imageName {
                    villainCell.villainImageView?.image = UIImage(named: imageName)
                }
                else {
                    villainCell.villainImageView.image = nil
                }
                
                if let imageURL = villain.imageURL {
                    loadImageViewAsyc(imageURL: imageURL, imageView: villainCell.villainImageView)
                  
                }
            }
        }
        
        return cell
    }
 

    
    //should delete 
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    func loadImageViewAsyc( imageURL: String , imageView: UIImageView) {
        if let url = URL(string: imageURL) {
            let dataTask = URLSession(configuration: .default).dataTask(with: url){ (data, response, error) in
                if let error = error {
                    print("ERROR: \(error.localizedDescription)")
                } else if let data = data {
                    DispatchQueue.main.async {
                        imageView.image = UIImage(data: data)
                    }
                }
            }  
            dataTask.resume()
        }
    }

    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            if identifier == "villainSegue" {
                if let vvc = segue.destination as? VillainViewController,
                    let cell = sender as? UITableViewCell,
                    let data = data {
                    if let indexPath = tableView.indexPath(for: cell) {
                        vvc.villain = data[indexPath.row] 
                    }
                }
                
            }
        }
        
    }
    

}





















