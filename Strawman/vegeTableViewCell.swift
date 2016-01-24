//
//  vegeTableViewCell.swift
//  Strawman
//
//  Created by wusuchen on 2016/1/24.
//  Copyright © 2016年 alphacamp. All rights reserved.
//

import UIKit
import Parse
class vegeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var playMovieBu: UIButton!
    
    @IBOutlet weak var Roger: UIImageView!
    @IBOutlet weak var vegeImage: UIImageView!
    @IBOutlet weak var vagetableNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
