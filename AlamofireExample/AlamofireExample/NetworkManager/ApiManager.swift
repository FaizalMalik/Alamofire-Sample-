//
//  ApiManager.swift
//  AlamofireExample
//
//  Created by safilsunny on 05/03/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
import Alamofire

class UsersApiManager {
    
    static let sharedInstance =  UsersApiManager()

    func getUsersList( url:String, success: @escaping(_ json : Any, _ statusCode:Int )->() , failure:@escaping(_ error : NSError )->() )  {
        
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            // let dataR:NSArray=response.data
            
            switch response.result {
                
            case .success(let dataR):
                
       
                if response.response?.statusCode == 200 {
                    if let json:NSDictionary=dataR as? NSDictionary {
                        
                        if let usersList = UsersList.init(dictionary: json){
                              success(usersList, (response.response?.statusCode)!)
                        }
                        
                    }
                    
                 

                }
                else{
                    success([], (response.response?.statusCode)!)
                }
                
               
                
                break
                
                
                
                
            case .failure(let error):
                
                print("Get Appointment Api call Failed--->>>",error.localizedDescription)
                failure(error as NSError)
                break
            }
            
        }
        
    }
}




