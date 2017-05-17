//
//  ViewController.swift
//  MultiEnvSample
//
//  Created by Aleksandr Glagoliev on 2/21/16.
//  Copyright © 2016 io.limlab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
        
		print(Configuration.sharedInstance.apiEndpoint())
        
        #if DEV
            print("DEBUG ENVIRONMENT")
        #elseif STA
            print("STAGE ENVIRONMENT")
        #elseif PROD
            print("PRODUCTION ENVIRONMENT")
        #else
            print("ENVIRONMENT NOT DEFINED")
        #endif
        
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

