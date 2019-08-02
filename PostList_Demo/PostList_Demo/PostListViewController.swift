//
//  ViewController.swift
//  PostList_Demo
//
//  Created by Chiragdip on 02/08/19.
//  Copyright © 2019 MAC190. All rights reserved.
//

import UIKit

class PostListViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var btnActivatePostCount: UIButton!
    
    private var activePostCounts: Int = 0 {
        didSet{
            self.btnActivatePostCount.setTitle("\(self.activePostCounts)", for: .normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.activePostCounts = 0
        // Do any additional setup after loading the view.
    }


}

