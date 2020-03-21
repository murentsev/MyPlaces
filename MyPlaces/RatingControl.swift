//
//  RatingControl.swift
//  MyPlaces
//
//  Created by Алексей Муренцев on 21.03.2020.
//  Copyright © 2020 Алексей Муренцев. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {

 //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Private Methods
    private func setupButtons() {
        
        //Create the button
        let button = UIButton()
        button.backgroundColor = .red
        
        //Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
    }
}
