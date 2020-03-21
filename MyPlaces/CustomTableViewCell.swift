//
//  CustomTableViewCell.swift
//  MyPlaces
//
//  Created by Алексей Муренцев on 16.03.2020.
//  Copyright © 2020 Алексей Муренцев. All rights reserved.
//

import UIKit
import Cosmos

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageOfPlace: UIImageView! {
        didSet {
      imageOfPlace.layer.cornerRadius = imageOfPlace.frame.size.height / 2
    imageOfPlace.clipsToBounds = true
    }
    }
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var locationLable: UILabel!
    @IBOutlet weak var typeLable: UILabel!
    @IBOutlet var cosmosView: CosmosView!
    
    
    
}
