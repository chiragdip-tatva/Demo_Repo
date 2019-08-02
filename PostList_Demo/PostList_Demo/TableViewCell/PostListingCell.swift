//
//  PostListingCell.swift
//  PostList_Demo
//
//  Created by Chiragdip on 02/08/19.
//  Copyright © 2019 MAC190. All rights reserved.
//

import UIKit

class PostListingCell: UITableViewCell {
    
    //IBOutlets for UI...
    @IBOutlet weak private var labelTitle               : UILabel!
    @IBOutlet weak private var labelCreatedAt           : UILabel!
    @IBOutlet weak private var switchIsActivatedPost    : UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: On Value Change this Action will be called...
    @IBAction private func didSwitchTo(_ switch: UISwitch){
        
    }
}
