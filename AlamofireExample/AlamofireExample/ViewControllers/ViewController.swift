//
//  ViewController.swift
//  AlamofireExample
//
//  Created by Faizal on 05/03/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import SVProgressHUD
class HomeViewController: UIViewController {

    @IBOutlet weak var tableViewHome: UITableView!
    var usersArray:[User]? = []
    var filterdusersArray:[User]? = []
    
    let refreshControl = UIRefreshControl()
    var isFiltered = false
    var page = 0
    var isPaginationCall = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchData(forPage: page)
        setupView()
    }
    
    func setupView(){
        //Here we set the View related Codes
        
        //Set Refresh controller
        refreshControl.tintColor = UIColor.gray
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableViewHome.addSubview(refreshControl)
        tableViewHome.delegate = self
        //Set Search bar Header
        
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x: 0, y: 0, width: self.tableViewHome.frame.width, height: 50)
        searchBar.delegate = self
        searchBar.placeholder = "Search user"
        self.tableViewHome.tableHeaderView = searchBar
        
        
       
    }
    
    
    @objc func refresh(sender:AnyObject) {
       page = 0
        fetchData(forPage: page)
        
    }
    
    //MARK: Pagination Methods

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
      

        for cell:UITableViewCell in tableViewHome.visibleCells {
            
            if let indexPath:IndexPath = tableViewHome.indexPath(for: cell) {
                
                //If we have total number of results , add the condition below
                if indexPath.row + 1 == usersArray?.count && !isPaginationCall {
                    isPaginationCall = true
                    page = page + 1
                    fetchData(forPage: page)
                }
                
            }
            
        }
        
    }
    //MARK: Other Methods
    func fetchData(forPage page: Int){
        SVProgressHUD.show(withStatus: "Fetching..")
        
        UsersApiManager.sharedInstance.getUsersList( url: "?seed=$\(page)&page=$\(page)&results=20", success: { (data, code) in
        
            SVProgressHUD.dismiss(withDelay: 0.2)
            
            self.refreshControl.endRefreshing()
            guard code == 200 else {
                
                return
            }
            
            if let response = data as? UsersList {
                
                if let usersList = response.results {
                    if self.isPaginationCall {
                        self.usersArray = self.usersArray! + usersList
                        self.isPaginationCall = false
                    }
                    else{
                        self.usersArray = usersList
                        
                    }
                    
                }
                
              
                
            }
          
            self.tableViewHome.reloadData()
            
        }) { (error) in
            
            SVProgressHUD.dismiss(withDelay: 1)
            self.isPaginationCall = false
            
        }
        
    }
    
}

//MARK: UITableViewDataSource Methods
extension HomeViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltered ?  (self.filterdusersArray?.count)! : (self.usersArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewcell") as! ListTableViewcell
        
        let user = isFiltered ? filterdusersArray![indexPath.row] : usersArray![indexPath.row]
        
         cell.lblName.text = (user.name?.first)! + " " +  (user.name?.last)!
         cell.lblEmail.text = user.email
        cell.imgUser.imageFromServerURL((user.picture?.thumbnail)!,placeHolder: UIImage(named: "placeholder"))
        
        return cell
    }
    
    
    
}

extension HomeViewController : UISearchBarDelegate {
    
    //MARK: Other Methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        if searchText.count == 0 {
            isFiltered = false
        }
        else{
            isFiltered = true
           
            self.filterdusersArray = self.usersArray!.filter({ (item) -> Bool in
                (item.name?.first?.contains(searchText.lowercased()))! || (item.name?.last?.contains(searchText.lowercased()))!
            })
            
            
            
            
        }
        
        
        self.tableViewHome.reloadData()
        
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        
        
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        searchBar.text = ""
        isFiltered = false
        tableViewHome.reloadData()
        
    }
}
class ListTableViewcell : UITableViewCell {
    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    override func awakeFromNib() {
        imgUser.layer.cornerRadius = imgUser.layer.frame.height / 2
        imgUser.clipsToBounds = true
        
    }
}
