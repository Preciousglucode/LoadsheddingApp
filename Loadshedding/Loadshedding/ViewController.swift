//
//  ViewController.swift
//  Loadshedding
//
//  Created by Precious Omoroga on 2023/04/05.
//

import UIKit

class ViewController: UIViewController {
    var status:Status?

    override func viewDidLoad() {
        super.viewDidLoad()
        Networking.shared.getStatus { [weak self]  status, error in
            self?.status = status
        }
        // Do any additional setup after loading the view.
    }


}

