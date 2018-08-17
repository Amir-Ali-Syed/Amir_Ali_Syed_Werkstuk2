//
//  DetailViewController.swift
//  Amir_Ali_Syed_Werkstuk2
//
//  Created by Amir Ali Syed on 17/08/2018.
//  Copyright © 2018 Amir Ali Syed. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblStationName: UILabel!
    @IBOutlet weak var lblStationAddress: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    var name = ""
    var address = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblStationName.text = NSLocalizedString("lbl_station_name", comment: "")
        self.lblStationAddress.text = NSLocalizedString("lbl_station_address", comment: "")
        self.lblName.text = name
        self.lblAddress.text = address
    }
}
