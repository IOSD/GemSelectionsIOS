//
//  MainMenu.swift
//  GemSelection
//
//  Created by Abhishek on 05/11/17.
//  Copyright © 2017 atlas. All rights reserved.
//

import UIKit
import MessageUI
import MapKit
import Firebase
var isloggedin:Int = 0
class MainMenu: UITableViewController,MFMailComposeViewControllerDelegate {
    var handle: AuthStateDidChangeListenerHandle? ;  var ref: DatabaseReference!
    var rowIdentifierssection1 = ["loginrow","myAccount","preciousgemstonerow","diamondrow","jwelleryrow", "astrology","semipreciousgemsrow","triangulargemsrow","cabochonrow","birthstonesrow","gemstonesandastrologyrow","gemstonerecommendationrow","rudraksharow","handicraftsrow","perfumerow","stoneidolsrow","yantrarow","saphaticitemsrow","japamalarow","kavachrow","faqrow"]
    var rowIdentifierssection2 = ["connectwithusrow","callusrow","mailusrow","visitusrow"]
    var rowIdentifierssection3 = ["sharerow","rateapprow"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
     
    }
    var currentUser	= "GemSelections"
    
    var currentUserEmail = "(A Unit of Khanna Gems Pvt. Limited)"
    override func viewWillAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            let user = Auth.auth().currentUser
            self.currentUser = (user?.displayName)!
            self.currentUserEmail = (user?.email)!
            isloggedin = 1
        } else {
          print("na hao")
        }
    
    }
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return rowIdentifierssection1.count
        case 1:
            return rowIdentifierssection2.count
        case 2:
            return rowIdentifierssection3.count
        default:
            return 3
        }
        
    }

    @objc func signOutUser(){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
             currentUser = "GemSelections"
             currentUserEmail = "(A Unit of Khanna Gems Pvt. Limited)"
            isloggedin = 0
            let indexpath = IndexPath(row: 0, section: 0)
            self.tableView.reloadRows(at: [indexpath], with: .top)

        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            print("aala maaf")
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var finalcell = UITableViewCell()
        
        if(indexPath.section == 0){
            if indexPath.row == 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: rowIdentifierssection1[indexPath.row], for: indexPath) as! loginRow
                cell._userEmail.text = currentUserEmail
                cell._userName.text = currentUser
                cell._logoutBtn.addTarget(self, action: #selector(signOutUser), for: .touchDown)
                if isloggedin == 0{
                    cell._loginBtn.isUserInteractionEnabled = true ; cell._logoutBtn.isUserInteractionEnabled = false
                    cell._loginBtn.setTitleColor(UIColor.white, for: .normal)
                    cell._logoutBtn.setTitleColor(UIColor.gray.withAlphaComponent(0.5), for: .normal)
                }
                else if isloggedin == 1{
                    cell._logoutBtn.isUserInteractionEnabled = true ; cell._loginBtn.isUserInteractionEnabled = false
                    cell._logoutBtn.setTitleColor(UIColor.white, for: .normal)
                    cell._loginBtn.setTitleColor(UIColor.gray.withAlphaComponent(0.5), for: .normal)
                }
                finalcell = cell
            }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: rowIdentifierssection1[indexPath.row], for: indexPath)
                finalcell = cell
            }
        }
        if(indexPath.section == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: rowIdentifierssection2[indexPath.row], for: indexPath)
            finalcell = cell
            
        }
        if(indexPath.section == 2){
            let cell = tableView.dequeueReusableCell(withIdentifier: rowIdentifierssection3[indexPath.row], for: indexPath)
            finalcell = cell
            
        }
        return finalcell

    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Contact"
        }
        if section == 2 {
            return "Spread The Word!"
        }
        else{
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            if indexPath.row == 0{
                return 196
            }
            else{
                return 44
            }
        }
        else{
            return 44
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 4{
                print("Astrology")
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let output = storyboard.instantiateViewController(withIdentifier: "astrology") as! AstrolgyMainViewController
                self.navigationController?.pushViewController(output, animated: true)
                
            }
            if indexPath.row == 13{
                print("13")
            };if indexPath.row == 15{
                print("15")
                whichJss = 15
            };if indexPath.row == 16{
                print("16")
                whichJss = 16
            }
            
        }
        if indexPath.section == 1 {
            if indexPath.row == 1{
                callPhone()
            }
            if indexPath.row == 2{
              showMail()
                
            }
           
        }
        
    }
    
 
    
    func callPhone(){
        let alert = UIAlertController(title: "Call Us", message: "Which Phone Number ?", preferredStyle: .alert)
        let number1 = UIAlertAction(title: "+919213932017", style: .default, handler: { (action) in
            if let url = URL(string: "tel://\("+919213932017")"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        })
        let number2 = UIAlertAction(title: "+919999136878", style: .default, handler: { (action) in
            if let url = URL(string: "tel://\("+919999136878")"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(number1) ; alert.addAction(number2) ; alert.addAction(cancel)
        self.revealViewController().revealToggle(animated: true)
        self.revealViewController().frontViewController.present(alert, animated: true, completion: nil)
    }
    func showMail(){
        if MFMailComposeViewController.canSendMail(){
            let mailVC = MFMailComposeViewController()
            mailVC.mailComposeDelegate = self
            mailVC.setToRecipients(["care@khannagems.com"])
            revealViewController().revealToggle(animated: false)
            self.revealViewController().frontViewController.present(mailVC, animated: true, completion: nil)
        }
        else{
            self.revealViewController().frontViewController.showToast(message: "Mail App not Configured")
        }
    }
func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if result == .cancelled {
            print("cancel")
        }
        controller.dismiss(animated: true, completion: nil)
    }
    }

class loginRow:UITableViewCell{
    @IBOutlet weak var _logoutBtn: UIButton!
    @IBOutlet weak var _loginBtn: UIButton!
    @IBOutlet weak var _userName: UILabel!
    @IBOutlet weak var _userEmail: UILabel!
    
}



class VistUs: UIViewController{
    @IBOutlet weak var _locateBtn: UIButton!
    @IBOutlet weak var _directionBtn: UIButton!
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
        _locateBtn.layer.borderWidth = 4.0
        _locateBtn.layer.borderColor = UIColor(red: 202, green: 167, blue: 87, alpha: 1.0).cgColor
        _directionBtn.layer.borderWidth = 4.0
        _directionBtn.layer.borderColor = UIColor(red: 202, green: 167, blue: 87, alpha: 1.0).cgColor
    }
    @IBAction func _locationAction(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.google.co.in/maps/place/Gem+Selections/@28.621027,77.0766403,17z/data=!3m1!4b1!4m5!3m4!1s0x390d04c805992bd5:0xd1f831c24cf6e237!8m2!3d28.621027!4d77.078829?hl=en")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func _directionAction(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.google.co.in/maps/dir/Janakpuri+WestMetro+Station,+Shivaji+Marg,+Janakpuri+District+Center,+Janakpuri,+New+Delhi,+Delhi/Gem+Selections,+Shop+No..+8%26+11,+A+-3,+DDA+MARKET,+Janakpuri,+Block+A3,+Janakpuri,+New+Delhi,+Delhi+110058/@28.6252913,77.0714624,16z/data=!3m1!4b1!4m14!4m13!1m5!1m1!1s0x390d04c0f23874db:0x7f63d009f51b7a06!2m2!1d77.077761!2d28.629448!1m5!1m1!1s0x390d04c805992bd5:0xd1f831c24cf6e237!2m2!1d77.078829!2d28.621027!3e0?hl=en")!, options: [:], completionHandler: nil)
    }
    
}
