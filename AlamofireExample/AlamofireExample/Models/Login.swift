/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Login {
	public var uuid : String?
	public var username : String?
	public var password : String?
	public var salt : String?
	public var md5 : String?
	public var sha1 : String?
	public var sha256 : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let login_list = Login.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Login Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Login]
    {
        var models:[Login] = []
        for item in array
        {
            models.append(Login(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let login = Login(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Login Instance.
*/
	required public init?(dictionary: NSDictionary) {

		uuid = dictionary["uuid"] as? String
		username = dictionary["username"] as? String
		password = dictionary["password"] as? String
		salt = dictionary["salt"] as? String
		md5 = dictionary["md5"] as? String
		sha1 = dictionary["sha1"] as? String
		sha256 = dictionary["sha256"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.uuid, forKey: "uuid")
		dictionary.setValue(self.username, forKey: "username")
		dictionary.setValue(self.password, forKey: "password")
		dictionary.setValue(self.salt, forKey: "salt")
		dictionary.setValue(self.md5, forKey: "md5")
		dictionary.setValue(self.sha1, forKey: "sha1")
		dictionary.setValue(self.sha256, forKey: "sha256")

		return dictionary
	}

}