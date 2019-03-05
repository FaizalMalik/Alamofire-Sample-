/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Results {
	public var gender : String?
	public var name : Name?
	public var location : Location?
	public var email : String?
	public var login : Login?
	public var dob : Dob?
	public var registered : Registered?
	public var phone : String?
	public var cell : String?
	public var id : Id?
	public var picture : Picture?
	public var nat : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let results_list = Results.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Results Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Results]
    {
        var models:[Results] = []
        for item in array
        {
            models.append(Results(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let results = Results(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Results Instance.
*/
	required public init?(dictionary: NSDictionary) {

		gender = dictionary["gender"] as? String
		if (dictionary["name"] != nil) { name = Name(dictionary: dictionary["name"] as! NSDictionary) }
		if (dictionary["location"] != nil) { location = Location(dictionary: dictionary["location"] as! NSDictionary) }
		email = dictionary["email"] as? String
		if (dictionary["login"] != nil) { login = Login(dictionary: dictionary["login"] as! NSDictionary) }
		if (dictionary["dob"] != nil) { dob = Dob(dictionary: dictionary["dob"] as! NSDictionary) }
		if (dictionary["registered"] != nil) { registered = Registered(dictionary: dictionary["registered"] as! NSDictionary) }
		phone = dictionary["phone"] as? String
		cell = dictionary["cell"] as? String
		if (dictionary["id"] != nil) { id = Id(dictionary: dictionary["id"] as! NSDictionary) }
		if (dictionary["picture"] != nil) { picture = Picture(dictionary: dictionary["picture"] as! NSDictionary) }
		nat = dictionary["nat"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.gender, forKey: "gender")
		dictionary.setValue(self.name?.dictionaryRepresentation(), forKey: "name")
		dictionary.setValue(self.location?.dictionaryRepresentation(), forKey: "location")
		dictionary.setValue(self.email, forKey: "email")
		dictionary.setValue(self.login?.dictionaryRepresentation(), forKey: "login")
		dictionary.setValue(self.dob?.dictionaryRepresentation(), forKey: "dob")
		dictionary.setValue(self.registered?.dictionaryRepresentation(), forKey: "registered")
		dictionary.setValue(self.phone, forKey: "phone")
		dictionary.setValue(self.cell, forKey: "cell")
		dictionary.setValue(self.id?.dictionaryRepresentation(), forKey: "id")
		dictionary.setValue(self.picture?.dictionaryRepresentation(), forKey: "picture")
		dictionary.setValue(self.nat, forKey: "nat")

		return dictionary
	}

}