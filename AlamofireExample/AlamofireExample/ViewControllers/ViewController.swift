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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchData()
    }
    
    
    //MARK: Other Methods
    func fetchData(){
        SVProgressHUD.show(withStatus: "Fetching..")
        
        UsersApiManager.sharedInstance.getUsersList( url: "https://randomuser.me/api/?seed=$0&page=$0&results=20", success: { (data, code) in
        
            SVProgressHUD.dismiss(withDelay: 0.2)
            

            guard code == 200 else {
                
                return
            }
            
            if let response = data as? UsersList {
                self.usersArray = response.results
                
            }
          
            self.tableViewHome.reloadData()
            
        }) { (error) in
            
            SVProgressHUD.dismiss(withDelay: 1)
            
            
        }
        
    }
}

//MARK: UITableViewDataSource Methods
extension HomeViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.usersArray?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewcell") as! ListTableViewcell
        let user = usersArray![indexPath.row]
        
         cell.lblName.text = (user.name?.first)! + " " +  (user.name?.last)!
         cell.lblEmail.text = user.email
        cell.imgUser.imageFromServerURL((user.picture?.thumbnail)!,placeHolder: UIImage(named: "placeholder"))
        return cell
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

