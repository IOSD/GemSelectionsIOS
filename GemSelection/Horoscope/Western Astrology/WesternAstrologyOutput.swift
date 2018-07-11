
//
//  WesternAstrologyOutputViewController.swift
//  GemSelection
//
//  Created by Lakshay Chhabra on 09/07/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WesternAstrologyOutput: UIViewController {
    
    
    
   
    @IBOutlet var textView: UITextView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var goButtojn: UIButton!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var setTimeButton: UIButton!
    @IBOutlet var setDatebutton: UIButton!
    
    var day : Int = 1
    var month: Int = 1
    var year : Int = 1
    var hour : Int = 1
    var min : Int = 1
    var lon : Float = 77.1025
    var lat : Float =  28.7041
    var tzone : Float = 5.5
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
        timeLabel.isHidden = false
        goButtojn.isHidden = false
        dateLabel.isHidden = false
        nameTextField.isHidden = false
        setDatebutton.isHidden = false
        setTimeButton.isHidden = false
     
        let now = Date()
        let dateformat = DateFormatter()
        let timeFormat = DateFormatter()
        dateformat.dateFormat = "dd-MM-YYYY"
        timeFormat.dateFormat = "HH:mm"
        let dateresult = dateformat.string(from: now)
        let timeresult = timeFormat.string(from: now)
        
        dateLabel.text = dateresult
        timeLabel.text = timeresult
        
        print(selectedIndex)
       
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(handlePopUpDate), name: NSNotification.Name(rawValue: "saveDate"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handlePopUpTime), name: NSNotification.Name(rawValue: "saveTime"), object: nil)
        
    }
    
    @objc func handlePopUpDate(notification : Notification){
        let dateVC = notification.object as! DatePopUpViewController
        dateLabel.text = dateVC.date
    }
    
    @objc func handlePopUpTime(notification : Notification){
        let timeVC = notification.object as! DatePopUpViewController
        timeLabel.text = timeVC.formattedTime
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
    
    
    
    
    
    func gettingUrl(){
        
        switch selectedIndex {
        case 0:  url = "https://json.astrologyapi.com/v1/western_horoscope"
            break
        case 1:  url = "https://json.astrologyapi.com/v1/western_chart_data"
            break
        case 2:  url = "https://json.astrologyapi.com/v1/tropical_transits/daily"
            break
        case 3:  url = "https://json.astrologyapi.com/v1/tropical_transits/weekly"
            break
        case 4:  url = "https://json.astrologyapi.com/v1/tropical_transits/monthly"
            break
        case 5:  url = "https://json.astrologyapi.com/v1/solar_return_details"
            break
        case 6:  url = "https://json.astrologyapi.com/v1/solar_return_planets"
            break
        case 7:  url = "https://json.astrologyapi.com/v1/solar_return_house_cusps"
            break
        case 8:  url = "https://json.astrologyapi.com/v1/solar_return_planet_aspects"
            break
        case 9:  url = "https://json.astrologyapi.com/v1/lunar_metrics"
            break
        case 10:  url = "https://json.astrologyapi.com/v1/romantic_forecast_report/tropical"
            break
        case 11:  url = "https://json.astrologyapi.com/v1/life_forecast_report/tropical"
            break
        case 12:  url = " "
            break
        case 13:  url = " "
            break
            
        default:
            url = " "
        }
        
    }
    
    
    @IBAction func goButtonPressed(_ sender: UIButton) {
        
        
        day = Int((dateLabel.text?.components(separatedBy: "-")[0])!)!
        month = Int((dateLabel.text?.components(separatedBy: "-")[1])!)!
        year = Int((dateLabel.text?.components(separatedBy: "-")[2])!)!
        hour = Int((timeLabel.text?.components(separatedBy: ":")[0])!)!
        min = Int((timeLabel.text?.components(separatedBy: ":")[1])!)!
        
        print(day, month, year, hour, min)
        
        
        textView.isHidden = false
        timeLabel.isHidden = true
        goButtojn.isHidden = true
        dateLabel.isHidden = true
        nameTextField.isHidden = true
        setDatebutton.isHidden = true
        setTimeButton.isHidden = true
        
        
        gettingUrl()
        
        
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        let params : [String : AnyObject] = ["day":day as AnyObject,
                                             "month":month as AnyObject,
                                             "year":year as AnyObject,
                                             "hour":hour as AnyObject,
                                             "min":min as AnyObject,
                                             "lat":lat as AnyObject,
                                             "lon":lon as AnyObject,
                                             "tzone":tzone as AnyObject]
        
        
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
