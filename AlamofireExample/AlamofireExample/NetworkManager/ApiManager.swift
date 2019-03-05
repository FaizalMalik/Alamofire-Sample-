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

    func getUsersList( headers:Dictionary<String, String>? ,url:String, success: @escaping(_ json : Any, _ statusCode:Int )->() , failure:@escaping(_ error : NSError )->() )  {
        
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            // let dataR:NSArray=response.data
            
            switch response.result {
                
            case .success(let dataR):
                
                let json:NSDictionary=dataR as! NSDictionary;
       
                if response.response?.statusCode == 200 {
                    
                    
                    success([], (response.response?.statusCode)!)
                    
                }
               
                else{
                    success(json, (response.response?.statusCode)!)
                    
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




