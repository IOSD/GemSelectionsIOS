//
//  AstrolgyMainViewController.swift
//  GemSelection
//
//  Created by Lakshay Chhabra on 09/07/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit

class AstrolgyMainViewController: UIViewController {

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
        // Do any additional setup after loading the view.
    }

    
    @IBAction func matchMakin(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MatchMaking", bundle: nil)
        let output = storyboard.instantiateViewController(withIdentifier: "matchMaking") as! MatchMaking
        
        self.navigationController?.pushViewController(output, animated: true)
    }
    @IBAction func westernAstrology(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "WesternAstrology", bundle: nil)
        let output = storyboard.instantiateViewController(withIdentifier: "westernAstrology") as! WesternAstrology
        
        
        self.navigationController?.pushViewController(output, animated: true)
    }
    @IBAction func dailyHoroscope(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let output = storyboard.instantiateViewController(withIdentifier: "GetHoroscope") as! GetHoroscope
        self.navigationController?.pushViewController(output, animated: true)
    }
    
    @IBAction func indianAstrology(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "IndianAstrology", bundle: nil)
        let output = storyboard.instantiateViewController(withIdentifier: "indianAstrology") as! IndianAstrology
        
       
        self.navigationController?.pushViewController(output, animated: true)
    }
    
    
}
