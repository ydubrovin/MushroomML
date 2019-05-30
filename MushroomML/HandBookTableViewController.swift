//
//  HandBookTableViewController.swift
//  MushroomML
//
//  Created by Юрий Дубровин on 29/05/2019.
//  Copyright © 2019 Юрий Дубровин. All rights reserved.
//

import UIKit
import SQLite

class HandBookTableViewController: UITableViewController {
    let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
        ).first!
    var database:Connection!
    var mushrooms = [Mushroom]()
    var selected = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let db = try Connection("\(path)/db.sqlite3")
            self.database = db
        } catch  {
            print("error")
        }
        do{
            for mushroomi in try database.prepare(mushroom){
                print("id:\(mushroomi[idMushroom]), rusName\(mushroomi[rusName]), latName\(mushroomi[latName]), descriptionMushroom\(mushroomi[descriptionMushroom]), edibility\(mushroomi[edibility])")
                let newMushroom = Mushroom(idMushroom: Int(mushroomi[idMushroom]), rusName: mushroomi[rusName], latName: mushroomi[latName], description: mushroomi[descriptionMushroom], edibility: Int(mushroomi[edibility]), image: mushroomi[image])
                self.mushrooms.append(newMushroom)
            }
        }catch{
            print("error")
        }

    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.mushrooms.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        selected = indexPath.row
        performSegue(withIdentifier: "InfoMushroom", sender: nil)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = self.mushrooms[indexPath.row].rusName

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let InfoHandBookTVC = segue.destination as? InfoHandBookTableViewController{
            InfoHandBookTVC.mushroom = Mushroom(idMushroom: mushrooms[selected].idMushroom, rusName: mushrooms[selected].rusName, latName: mushrooms[selected].latName, description: mushrooms[selected].description, edibility: mushrooms[selected].edibility, image: mushrooms[selected].image)
        }
    }
    
    

}
