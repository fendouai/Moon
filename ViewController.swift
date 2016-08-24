//
//  ViewController.swift
//  Moon
//
//  Created by fendouai on 16/8/24.
//  Copyright © 2016年 fendouai. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController ,UITextViewDelegate{

    @IBOutlet weak var textview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        self.textview.text=String(response.result)
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

