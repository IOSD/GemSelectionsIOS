//
//  MatchMakingOutput.swift
//  GemSelection
//
//  Created by Lakshay Chhabra on 09/07/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MatchMakingOutput: UIViewController, UITextFieldDelegate {
    
    
    
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var textField1: UITextField!
    
    @IBOutlet var date1: UILabel!
    @IBOutlet var time1: UILabel!
    @IBOutlet var time2: UILabel!
    @IBOutlet var date2: UILabel!
    
    @IBOutlet var place2: UILabel!
    @IBOutlet var place1: UILabel!
    @IBOutlet var partner2Label: UILabel!
    @IBOutlet var partnerLabel: UILabel!
    @IBOutlet var detailsLabel: UILabel!
    @IBOutlet var time1Button: UIButton!
    
    @IBOutlet var time2Button: UIButton!
    @IBOutlet var date2Button: UIButton!
    @IBOutlet var date1Button: UIButton!
    @IBOutlet var submitButton: UIButton!
    
    var whichButton : Int = 1
    var day1 : Int = 1
    var month1: Int = 1
    var year1 : Int = 1998
    var hour1 : Int = 1
    var min1 : Int = 1
    var lon1 : Float = 77.1025
    var lat1 : Float =  28.7041
    var tzone1 : Float = 5.5
    var day2 : Int = 1
    var month2: Int = 1
    var year2 : Int = 1998
    var hour2 : Int = 1
    var min2 : Int = 1
    var lon2 : Float = 77.1025
    var lat2 : Float =  28.7041
    var tzone2 : Float = 5.5
    var places1 : String = "New Delhi"
    var places2 : String = "New Delhi"
    var countryCode1 : String = "IN"
    var countryCode2 : String = "IN"
    
    let headers = [
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept-Language": "en",
        "Authorization": "Basic NjAxNjk2Ojg1MTBlNTM3YmNjNDI0ZTE1NGEzODYwZTcwZTkyMjA5=="
    ]
    
    var selectedIndex : Int = 0
    var url : String = " "
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.isHidden = true
        textField1.isHidden = false
        textField2.isHidden = false
        detailsLabel.isHidden = false
        partnerLabel.isHidden = false
        partner2Label.isHidden = false
        time1.isHidden = false
        time2.isHidden = false
        date1.isHidden = false
        date2.isHidden = false
        time1Button.isHidden = false
        time2Button.isHidden = false
        date1Button.isHidden = false
        date2Button.isHidden = false
        submitButton.isHidden = false
        place1.isHidden = false
        place2.isHidden = false
        
        textField1.delegate = self
        textField2.delegate = self

        let now = Date()
        let dateformat = DateFormatter()
        let timeFormat = DateFormatter()
        dateformat.dateFormat = "dd-MM-YYYY"
        timeFormat.dateFormat = "HH:mm"
        let dateresult = dateformat.string(from: now)
        let timeresult = timeFormat.string(from: now)
        
        date1.text = dateresult
        time1.text = timeresult
        date2.text = dateresult
        time2.text = timeresult
    }
    
    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }

    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(handlePopUpDate), name: NSNotification.Name(rawValue: "saveDate"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handlePopUpTime), name: NSNotification.Name(rawValue: "saveTime"), object: nil)
        
    }
    
    @objc func handlePopUpDate(notification : Notification){
        let dateVC = notification.object as! DatePopUpViewController
        if whichButton == 0 {
        date1.text = dateVC.date
        }
        if whichButton == 2 {
            date2.text = dateVC.date
        }
    }
    
    @objc func handlePopUpTime(notification : Notification){
        let timeVC = notification.object as! DatePopUpViewController
        if whichButton == 1 {
            time1.text = timeVC.formattedTime
        }
        if whichButton == 3 {
            time2.text = timeVC.formattedTime
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDate" {
            let popup = segue.destination as! DatePopUpViewController
            popup.showTimePicker = false
        }
        if segue.identifier == "toTime" {
            let popup = segue.destination as! DatePopUpViewController
            popup.showTimePicker = true
        }
    }
    
    
    @IBAction func timeDateButtonPressed(_ sender: UIButton) {
        
        if sender.tag == 0 {
            whichButton = 0
            performSegue(withIdentifier: "toDate", sender: nil)
            
        }
        if sender.tag == 1 {
            whichButton = 1
            performSegue(withIdentifier: "toTime", sender: nil)
            
        }
        if sender.tag == 2 {
            whichButton = 2
            performSegue(withIdentifier: "toDate", sender: nil)
            
        }
        if sender.tag == 3 {
             whichButton = 3
            performSegue(withIdentifier: "toTime", sender: nil)
           
        }
        
    }
    
    func gettingUrl(){
        
        switch selectedIndex {
        case 0:  url = "https://json.astrologyapi.com/v1/match_birth_details"
            break
        case 1:  url = "https://json.astrologyapi.com/v1/match_ashtakoot_points"
            break
        case 2:  url = "https://json.astrologyapi.com/v1/match_obstructions"
            break
        case 3:  url = "https://json.astrologyapi.com/v1/match_astro_details"
            break
        case 4:  url = "https://json.astrologyapi.com/v1/match_planet_details"
            break
        case 5:  url = "https://json.astrologyapi.com/v1/match_making_report"
            break
        case 6:  url = "https://json.astrologyapi.com/v1/match_simple_report"
            break
        case 7:  url = "https://json.astrologyapi.com/v1/match_making_detailed_report"
            break
        case 8:  url = "https://json.astrologyapi.com/v1/match_dashakoot_points"
            break
        case 9:  url = "https://json.astrologyapi.com/v1/match_percentage"
            break
        case 10:  url = "https://json.astrologyapi.com/v1/partner_report"
            break
       
            
        default:
            url = "https://json.astrologyapi.com/v1/match_birth_details"
        }
        
    }
    func findPlace(){
        if textField1.text != "" && textField2.text != "" {
            places1 = textField1.text!
            places2 = textField2.text!
        }
        let params1 : [String : AnyObject] = ["place" : places1 as AnyObject, "maxRows" : 1 as AnyObject]
        
        let url1 = "https://json.astrologyapi.com/v1/geo_details"
        
        Alamofire.request(url1, method: .post, parameters: params1, encoding: URLEncoding.httpBody , headers: headers).responseJSON { (response) in
            if let response = response.result.value {
                let data : JSON = JSON(response)
                print("aaaaaaaaa\(data)")
                
                 if let string = data["geonames"][0]["latitude"].rawString()
                {
                
                    if let latString = Float(string) {
                    self.lat1 = latString
                    print(self.lat1)
                    }
                }
                
                    if let string2 = data["geonames"][0]["longitude"].rawString(){
                        if let lonString = Float(string2) {
                        self.lon1 = lonString
                        self.countryCode1 = data["geonames"][0]["longitude"].rawString()!
                        print(self.lon1)
                        }
                    }
                    
            }
                
                print(self.lat1)
         }
        
            let params2 : [String : AnyObject] = ["place" : self.places1 as AnyObject, "maxRows" : 1 as AnyObject]
        
            Alamofire.request(url1, method: .post, parameters: params2, encoding: URLEncoding.httpBody , headers: self.headers).responseJSON { (response) in
            if let response = response.result.value {
                let data : JSON = JSON(response)
                print("aaaaaaaaa\(data)")
                
                if let string = data["geonames"][0]["latitude"].rawString()
                {
                    
                    if let latString = Float(string) {
                        self.lat2 = latString
                        print(self.lat2)
                    }
                }
                
                if let string2 = data["geonames"][0]["longitude"].rawString(){
                    if let lonString = Float(string2) {
                        self.lon2 = lonString
                        self.countryCode2 = data["geonames"][0]["longitude"].rawString()!
                        print(self.lon2)
                    }
                }
          }
      
        }
        
      
        
    }
    
    
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        textView.isHidden = false
        textField1.isHidden = true
        textField2.isHidden = true
        detailsLabel.isHidden = true
        partnerLabel.isHidden = true
        partner2Label.isHidden = true
        time1.isHidden = true
        time2.isHidden = true
        date1.isHidden = true
        date2.isHidden = true
        time1Button.isHidden = true
        time2Button.isHidden = true
        date1Button.isHidden = true
        date2Button.isHidden = true
        submitButton.isHidden = true
        place1.isHidden = true
        place2.isHidden = true
        
        findPlace()
        gettingUrl()
        
        
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        let params : [String : AnyObject] = ["m_day":day1 as AnyObject,
                                             "m_month":month1 as AnyObject,
                                             "m_year":year1 as AnyObject,
                                             "m_hour":hour1 as AnyObject,
                                             "m_min":min1 as AnyObject,
                                             "m_lat":lat1 as AnyObject,
                                             "m_lon":lon1 as AnyObject,
                                             "m_tzone":tzone1 as AnyObject,
                                             "f_day":day2 as AnyObject,
                                             "f_month":month2 as AnyObject,
                                             "f_year":year2 as AnyObject,
                                             "f_hour":hour2 as AnyObject,
                                             "f_min":min2 as AnyObject,
                                             "f_lat":lat2 as AnyObject,
                                             "f_lon":lon2 as AnyObject,
                                             "f_tzone":tzone2 as AnyObject]
        
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.httpBody , headers: headers).responseJSON { (response) in
            
            print(self.url)
            if let response = response.result.value {
                let data : JSON = JSON(response)
                print("aaaaaaaaa\(data)")
                self.textView.text = data.rawString()
            }
            UIApplication.shared.endIgnoringInteractionEvents()
            activityIndicator.stopAnimating()
            
            
        }
        
        
    }
    

}
