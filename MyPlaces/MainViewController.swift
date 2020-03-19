//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Алексей Муренцев on 16.03.2020.
//  Copyright © 2020 Алексей Муренцев. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var places: Results<Place>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        places = realm.objects(Place.self)
        
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.isEmpty ? 0: places.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        let place = places[indexPath.row]

        cell.nameLable.text = place.name
        cell.locationLable.text = place.location
        cell.typeLable.text = place.type
        cell.imageOfPlace.image = UIImage(data: place.imageData!)

        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true

        return cell
    }
    
    //MARK: - Table view delegate
   func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
     let place = places[indexPath.row]
        let contextItem = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            
                StorageManager.deleteObject(place)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                       
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])

        return swipeActions
    }
    
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let place = places[indexPath.row]
//        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (_, _) in
//            StorageManager.deleteObject(place)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//
//        return [deleteAction]
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
   

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let place = places[indexPath.row]
            let newPlaceNC = segue.destination as? UINavigationController
            let newPlaceVC = newPlaceNC?.topViewController as? NewPlaceViewController
            newPlaceVC?.currentPlace = place
        }
    }
   
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let newPlaceVC = segue.source as? NewPlaceViewController else { return }
        
        newPlaceVC.savePlace()
        tableView.reloadData()
    }
}
