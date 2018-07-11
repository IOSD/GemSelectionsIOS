//
//  ConnectWithUs.swift
//  GemSelection
//
//  Created by Abhishek Chaudhary on 03/01/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit

class ConnectWithUs: UITableViewController {
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
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
    lazy var rowIdentifier = ["fb","twitter","Instagram","Youtube","linkedin","flickr","snapchat","pinterest","tumblr","stumbleupon","googleplus","vk","follo"]
    lazy var rowLinks = ["https://www.facebook.com/GemSelections.in/","https://www.twitter.com/Gem_Selections",        "https://www.instagram.com/gemselections/","https://www.youtube.com/channel/UCt3nkzLE2NKMuwu3V0KQtbw",        "https://www.linkedin.com/company/khanna-gems-pvt.-limited","https://www.flickr.com/photos/gemselections/","https://www.snapchat.com/","https://www.pinterest.com/gemselections01/","https://gemselections.tumblr.com/","https://www.stumbleupon.com/stumbler/GemSelections","https://plus.google.com/+GemSelectionsNewDelhi", "https://vk.com/gemselectionsindia","https://www.follo.in/pankajkhanna","http://gemselections.blogspot.in/?m=1"]
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowIdentifier.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: rowIdentifier[indexPath.row], for: indexPath)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 6{
            showToast(message: "Find Us on Snapchat as 'gemselections'")
        }
        else{
            UIApplication.shared.open(URL(string: rowLinks[indexPath.row])!, options: [:], completionHandler: nil)
        }
    }
}


