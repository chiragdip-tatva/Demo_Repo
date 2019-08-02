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
        
        self.prepareView()
        
        // Do any additional setup after loading the view.
    }
    
    private func prepareView(){
        self.activePostCounts = 0
        
        self.tableView.emptyDataSetSource = self
        self.tableView.emptyDataSetDelegate = self
        
        self.tableView.addSubview(refreshControl)
        tableView.tableFooterView = UIView()
    }
    
    //MARK: Handle refreshing event...
    @objc private func handleRefreshing(_ refreshControl:UIRefreshControl){
        self.pageNumber = 0
        self.callAPIforPostListing()
    }

    
    //MARK: API calling metod for getting posts...
    private func callAPIforPostListing(){
        isCurrentlyAPICalling = true
        APIManager.shared.callRequest(Router.getPostListing(pageNumber+1), onSuccess: { (response) in
            self.isCurrentlyAPICalling = false
            self.refreshControl.endRefreshing()
            if response.success{
                self.postList.append(contentsOf: (response.data?.arrayValue.map({ PostModel.init(parameter: $0) }))!)
                self.activePostCounts = self.postList.filter({ $0.isActivatedPost }).count
                self.tableView.reloadData()
            }else{
                print("API failed")
            }
        }) { (error) in
            self.isCurrentlyAPICalling = false
            self.refreshControl.endRefreshing()
            print("error")
        }
    }
}

//MARK: TableView Delegate Methods
extension PostListViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 1, !isCurrentlyAPICalling {
            self.callAPIforPostListing()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        }else{
            return 20.0
        }
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
            cell.postModel = postList[indexPath.row]
            cell.delegate = self
            return cell
        }else{
            return UITableViewCell()
        }
    }
}

extension PostListViewController: PostListingDelegate{
    func didSwitchTo(_ cell: PostListingCell) {
        if cell.postModel.isActivatedPost{
            self.activePostCounts += 1
        }else{
            self.activePostCounts -= 1
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

