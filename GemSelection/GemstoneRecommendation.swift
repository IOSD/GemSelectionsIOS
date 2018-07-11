//
//  GemstoneRecommendation.swift
//  GemSelection
//
//  Created by abhishek chaudhary on 14/01/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit
import MessageUI

class GemstoneRecommendation: UITableViewController{

    @IBAction func boyNow(_ sender: Any) {
        ShowWebView(urll: "https://khannagems.com/")

    }
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 380
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "webrow", for: indexPath) as! WebRowIngemsrecommendation
            let hh = cell._webView.frame.height ; let ww = cell._webView.frame.width
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/DRZfRX9YKmU\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "formrow", for: indexPath) as! FormRowingemsrecommendation
            cell._questionF.returnKeyType = .done
            cell._submitBtn.layer.cornerRadius = cell._submitBtn.frame.width/3.0
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0 {
//            return 184
//        } else {
//            return UITableViewAutomaticDimension
//        }
//    }
   
   
}

class WebRowIngemsrecommendation:UITableViewCell{
    @IBOutlet weak var _webView: UIWebView!
    
}
class FormRowingemsrecommendation:UITableViewCell,MFMailComposeViewControllerDelegate{
    @IBOutlet weak var _nameTF: UITextField!
    @IBOutlet weak var _pobTF: UITextField!
    @IBOutlet weak var _tobTF: UITextField!
    @IBOutlet weak var _questionF: UITextField!
    @IBOutlet weak var _submitBtn: UIButton!
    @IBAction func submitMailAction(_ sender: Any) {
            if MFMailComposeViewController.canSendMail(){
                let mailVC = MFMailComposeViewController()
                mailVC.mailComposeDelegate = self 
                mailVC.setToRecipients(["aradikhanna@gmail.com"])
                mailVC.setSubject("Gemstone Recommendation user nam: \(_nameTF.text!)")
                mailVC.setMessageBody("Place of Birth: \(_pobTF.text!)\nTime of Birth: \(_tobTF.text!)\nQuestions: \(_questionF.text!)", isHTML: false)
                	UIApplication.shared.keyWindow?.rootViewController?.present(mailVC, animated: true, completion: nil)
            }
            else{
                UIApplication.shared.keyWindow?.rootViewController?.showToast(message: "Mail App not Configured")
            }
        
        
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if result == .cancelled {
            print("cancel")
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
}
