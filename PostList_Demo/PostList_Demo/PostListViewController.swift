//
//  ViewController.swift
//  PostList_Demo
//
//  Created by Chiragdip on 02/08/19.
//  Copyright © 2019 MAC190. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class PostListViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var btnActivatePostCount: UIButton!
    
    private var postList = [PostModel]()
    
    private var activePostCounts: Int = 0 {
        didSet{
            self.btnActivatePostCount.setTitle("\(self.activePostCounts)", for: .normal)
        }
    }
    
    //MARK: Pagination related params
    private var pageNumber: Int = 0
    private var isCurrentlyAPICalling: Bool = false
    
    lazy private var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(PostListViewController.handleRefreshing(_:)), for: UIControl.Event.valueChanged)
        return refreshControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    private func prepareView(){
        self.activePostCounts = 0
        
        self.tableView.emptyDataSetSource = self
        self.tableView.emptyDataSetDelegate = self
        
        tableView.tableFooterView = UIView()
        self.tableView.addSubview(refreshControl)
    }
    
    //MARK: Handle refreshing event...
    @objc private func handleRefreshing(_ refreshControl:UIRefreshControl){
        self.pageNumber = 0
        self.callAPIforPostListing()
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
        if indexPath.section == 0 {
            let cell = tableView.dequeueCellFromNIB(PostListingCell.self)
            return UITableViewCell()
        }else{
            return UITableViewCell()
        }
    }
}


extension PostListViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate{
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let emptyMsg = "No data retrieved."
        let myAttribute = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30.0)]
        let myAttrString = NSAttributedString(string: emptyMsg, attributes: myAttribute)
        return myAttrString
    }
}

