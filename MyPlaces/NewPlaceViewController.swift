//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Алексей Муренцев on 17.03.2020.
//  Copyright © 2020 Алексей Муренцев. All rights reserved.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.tableFooterView = UIView()
    }
    //MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
        }else{
            view.endEditing(true)
        }
    }
  
}

//MARK: - Text field delegate

extension NewPlaceViewController: UITextFieldDelegate {
    
    //Hide keyboard by tap "Done"
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
}
