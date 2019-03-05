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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    //MARK: Other Methods
    func fetchData(){
        SVProgressHUD.show(withStatus: "Fetching..")
        
    }
}
//MARK: UITableViewDataSource Methods
extension HomeViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "ListTableViewcell") as! ListTableViewcell
        
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

