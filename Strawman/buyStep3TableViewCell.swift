//
//  buyStep3TableViewCell.swift
//  Strawman
//
//  Created by wusuchen on 2016/1/29.
//  Copyright © 2016年 alphacamp. All rights reserved.
//

import UIKit

class buyStep3TableViewCell: UITableViewCell {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!

    @IBOutlet weak var marImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
