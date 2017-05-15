//
//  Config.swift
//  MultiEnvSample
//
//  Created by Aleksandr Glagoliev on 2/22/16.
//  Copyright © 2016 io.limlab. All rights reserved.
//

import UIKit

class Config: NSObject {
	static let sharedInstance = Config()
	
	var configs: NSDictionary!
	
	override init() {
        let currentConfiguration:String = Bundle.main.object(forInfoDictionaryKey: "Config")! as! String
		print(currentConfiguration)
        
        // Get environment
        let fullNameArr = currentConfiguration.characters.split{$0 == "_"}.map(String.init)
        let strEnvironment:String = fullNameArr[0] // Get environment
        
		let path = Bundle.main.path(forResource: "Config", ofType: "plist")!
		configs = NSDictionary(contentsOfFile: path)!.object(forKey: strEnvironment) as! NSDictionary
        print(configs)
	}
}

extension Config {
	func apiEndpoint() -> String {
		return configs.object(forKey: "api_endpoint_url") as! String
	}
	
	func loggingLevel() -> String {
		return configs.object(forKey: "logging_level") as! String
	}
}
