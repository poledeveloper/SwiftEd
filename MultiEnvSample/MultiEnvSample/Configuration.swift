//
//  Config.swift
//  MultiEnvSample
//
//  Created by Aleksandr Glagoliev on 2/22/16.
//  Copyright © 2016 io.limlab. All rights reserved.
//

import UIKit

class Configuration: NSObject {
	
    static let sharedInstance = Configuration()
	
	var configs: NSDictionary!
    var env: NSDictionary?
    var apiUrls: NSDictionary?
    var strEnvironment:String = ""
	
    override init() {
        let currentConfiguration:String = Bundle.main.object(forInfoDictionaryKey: "Config")! as! String
        print(currentConfiguration)
        
        // Get environment
        let fullNameArr = currentConfiguration.characters.split{$0 == "_"}.map(String.init)
        strEnvironment = fullNameArr.first! // Get environment
        
        if let path = Bundle.main.path(forResource: "Configuration", ofType: "plist") {
            configs = NSDictionary(contentsOfFile: path)
            // print(configs ?? "")
            
            let environments = configs?.object(forKey: "Environments") as? NSDictionary
            env = environments?.object(forKey: strEnvironment) as? NSDictionary
            
            apiUrls = configs?.object(forKey: "ApiUrls") as? NSDictionary

        }
        
    }
}

extension Configuration {
	func apiEndpoint() -> String {
		return env!.object(forKey: "api_endpoint_url") as! String
	}
	
	func loggingLevel() -> String {
		return env!.object(forKey: "logging_level") as! String
	}
}
