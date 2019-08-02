//
//  PostListingCell.swift
//  PostList_Demo
//
//  Created by Chiragdip on 02/08/19.
//  Copyright © 2019 MAC190. All rights reserved.
//

import UIKit

protocol PostListingDelegate {
    func didSwitchTo(_ cell: PostListingCell)
}


class PostListingCell: UITableViewCell {
    
    //IBOutlets for UI...
    @IBOutlet weak private var labelTitle               : UILabel!
    @IBOutlet weak private var labelCreatedAt           : UILabel!
    @IBOutlet weak private var switchIsActivatedPost    : UISwitch!

    var delegate: PostListingDelegate?
    
    lazy private var sourceDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter
    }()
    
    lazy private var destDateformatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter
    }()
    
    var postModel: PostModel! {
        didSet {
            labelTitle.text = postModel.title
            labelCreatedAt.text = "-"
            switchIsActivatedPost.isOn = postModel.isActivatedPost
        
            if let date = self.sourceDateFormatter.date(from: postModel.createdAt) as Date? {
                labelCreatedAt.text = self.destDateformatter.string(from: date)
            }
        }
    }
    
    //MARK: On Value Change this Action will be called...
    @IBAction private func didSwitchTo(_ switch: UISwitch){
        self.postModel.isActivatedPost = switchIsActivatedPost.isOn
        self.switchIsActivatedPost.setOn(postModel.isActivatedPost, animated: true)
        if let delegate = self.delegate {
            delegate.didSwitchTo(self)
        }
    }
}
