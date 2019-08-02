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
    
    private var postList = [PostModel]()
    //MARK: Pagination related params
    
    private var pageNumber: Int = 0
    private var isCurrentlyAPICalling: Bool = false
    
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
    
    //MARK: API calling metod for getting posts...
    private func callAPIforPostListing(){
        
    }
}

//MARK: TableView Delegate Methods
extension PostListViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

    }
}

//MARK: TableView DataSource Methods
extension PostListViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return postList.count
        }else{
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


