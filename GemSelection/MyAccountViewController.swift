//
//  MyAccountViewController.swift
//  GemSelection
//
//  Created by Lakshay Chhabra on 30/07/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit

class MyAccountViewController: UIViewController {

    @IBOutlet var menuBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector
                (SWRevealViewController.rightRevealToggle(_:))
            menuBtn.action = #selector
                (SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
    }

}
    
}
