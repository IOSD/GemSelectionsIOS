//
//  GetHoroscope.swift
//  GemSelection
//
//  Created by Lakshay Chhabra on 07/07/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class GetHoroscope: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var selectSpanButton: UIButton!
    @IBOutlet var selectSignButton: UIButton!
    @IBOutlet var spanView: UIView!
    @IBOutlet var signView: UIView!
    @IBOutlet var spanTableView: UITableView!
    @IBOutlet var signTableView: UITableView!
    @IBOutlet var textView: UITextView!
    
    let spanArray = ["Today", "Yesterday", "Tomorrow"]
    let signArray = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
    let headers = [
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept-Language": "en",
        "Authorization": "Basic NjAxNjk2Ojg1MTBlNTM3YmNjNDI0ZTE1NGEzODYwZTcwZTkyMjA5=="
    ]
    var signString : String = " "
    var spanString : String = " "
    var value : Int = 0
    var dayString : String = " "
    
    @IBOutlet var spanSelectedLabel: UILabel!
    @IBOutlet var signSelectedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupSpanView()
        setupSignView()
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.signTableView{
            return signArray.count
        }else{
            return spanArray.count
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.signTableView{
            
            let cell = signTableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = signArray[indexPath.row]
            return cell!
        }else{
            let cell = spanTableView.dequeueReusableCell(withIdentifier: "cell2")
            cell?.textLabel?.text = spanArray[indexPath.row]
            return cell!
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.signTableView{
        signString = signArray[indexPath.row]
            signSelectedLabel.text = "Selected : \(signString)"
             selectSignButton.setTitle(signString, for: .normal)
            self.signView.removeFromSuperview()
            
            
        }else{
            spanString = spanArray[indexPath.row]
            spanSelectedLabel.text = "Selected : \(spanString)"
            print("change")
            selectSpanButton.setTitle(spanString, for: .normal)

            switch indexPath.row {
            case 0: value = 0
                    break
            case 1 : value = 1
                    break
            case 2 : value = 2
                    break
            
            default:
                 value = 0
            }
            self.spanView.removeFromSuperview()
        }
    }
    
 
    func setupSignView(){
        self.signView.center = self.view.center
//        self.signView.center.y =  self.view.center.y - (self.view.frame.height / 4.0)
        
        
    }
    func setupSpanView(){
        spanView.center = self.view.center
//        self.spanView.center.y =  self.view.center.y - (self.view.frame.height / 2.0)
       
        
    }
    @IBAction func sunSignButtonPressed(_ sender: Any) {
       
       setupSignView()
        self.view.addSubview(signView)
    }
  
    @IBAction func spanButtonPressed(_ sender: Any) {
       setupSpanView()
        self.view.addSubview(spanView)
    }
    @IBAction func getHoroscopeButtonPressed(_ sender: Any) {
        
        var url : String = " "
        
        switch value {
        case 0: url = "https://json.astrologyapi.com/v1/sun_sign_prediction/daily/\(signString)"
            break
        case 1 : url = "https://json.astrologyapi.com/v1/sun_sign_prediction/daily/previous/\(signString)"
            break
        case 2 : url = "https://json.astrologyapi.com/v1/sun_sign_prediction/daily/next/\(signString)"
            break
            
        default: url = "https://json.astrologyapi.com/v1/sun_sign_prediction/daily/\(signString)"
        }
        var recieved : String = " "
        var profession : String = " "
        var personal : String = " "
        var health : String = " "
        var emotions : String = " "
        var luck : String = " "
        var travel : String = " "
        
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
       
        
        Alamofire.request(url, method: .post, headers: headers).responseJSON { (response) in
           
             if let response = response.result.value {
                let data : JSON = JSON(response)
                print("aaaaaaaaa\(data["prediction"])")
                profession = data["prediction"]["profession"].rawString()!
                personal = data["prediction"]["personal_life"].rawString()!
                health = data["prediction"]["health"].rawString()!
                emotions = data["prediction"]["emotions"].rawString()!
                luck = data["prediction"]["luck"].rawString()!
                travel = data["prediction"]["travel"].rawString()!
                
            }
            recieved = "Profession : \(profession) \n\n Health : \(health) \n\n Personal : \(personal) \n\n Emotions : \(emotions) \n\n Luck : \(luck) \n\n Travel : \(travel)"
            print("Fetched")
            self.textView.text = recieved
        }
        
        activityIndicator.stopAnimating()
        
    }
    
//    @IBAction func horoscopeButtonPressed(_ sender: UIButton) {
//        self.spanView.removeFromSuperview()
//        if sender.tag == 0 {
//            if signString == " "{
//                print("Nothing Selected")
//            }
//            else{
//                selectSignButton.setTitle(signString, for: .normal)
//            }
//            
//        }
//        self.signView.removeFromSuperview()
//        
//    }
//    
//    @IBAction func spanviewButtonPressed(_ sender: UIButton) {
//        signView.removeFromSuperview()
//        if sender.tag == 0 {
//            if spanString == " "{
//                print("Nothing Selected")
//            }
//            else{
//                print("change")
//                selectSpanButton.setTitle(spanString, for: .normal)
//            }
//            
//        }
//        self.spanView.removeFromSuperview()
//        
//        
//    }
    
}
