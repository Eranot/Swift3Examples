//
//  MainViewController.swift
//  AcessandoHardware
//
//  Created by Unochapeco unochapeco on 03/11/16.
//  Copyright © 2016 Unochapeco unochapeco. All rights reserved.
//

import UIKit
import SystemConfiguration.CaptiveNetwork

class MainViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        label.text = getSSID()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func getSSID() -> String? {
        
        let interfaces = CNCopySupportedInterfaces()
        if interfaces == nil {
            return nil
        }
        
        let interfacesArray = interfaces as! [String]
        if interfacesArray.count <= 0 {
            return nil
        }
        
        let interfaceName = interfacesArray[0] as String
        let unsafeInterfaceData =    CNCopyCurrentNetworkInfo(interfaceName as CFString)
        if unsafeInterfaceData == nil {
            return nil
        }
        
        let interfaceData = unsafeInterfaceData as! Dictionary <String,AnyObject>
        print(unsafeInterfaceData)
        
        return interfaceData["BSSID"] as? String
    }
}
