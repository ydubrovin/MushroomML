//
//  InfoHandBookTableViewController.swift
//  MushroomML
//
//  Created by Юрий Дубровин on 29/05/2019.
//  Copyright © 2019 Юрий Дубровин. All rights reserved.
//

import UIKit

class InfoHandBookTableViewController: UITableViewController {
    
    var mushroom: Mushroom? = nil

    @IBOutlet weak var imageMushroom: UIImageView!
    @IBOutlet weak var rusName: UILabel!
    @IBOutlet weak var latName: UILabel!
    @IBOutlet weak var descriptionMushroom: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionMushroom.numberOfLines = 0
        descriptionMushroom.text = mushroom?.description
        rusName.text = mushroom?.rusName
        latName.text = mushroom?.latName
        print("\(mushroom!.image)")
        imageMushroom.image = UIImage(named: "\(mushroom!.image)")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
