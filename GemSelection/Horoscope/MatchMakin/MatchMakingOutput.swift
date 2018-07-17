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
              //  self.textView.text = data.rawString()
                
                switch self.selectedIndex {
                case 1:
                    
                    
                    self.textView.text = data.rawString()
                    
                    break
                case 0:
                        let name = data["female_astro_details"]["name"].rawString()!
                        let sunrise = data["female_astro_details"]["sunrise"].rawString()!
                        let sunset = data["female_astro_details"]["sunset"].rawString()!
                        let ayanmasha = data["female_astro_details"]["ayanamsha"].rawString()!
                        let gender = data["female_astro_details"]["gender"].rawString()!
                        let latitude = data["female_astro_details"]["latitude"].rawString()!
                        let hour = data["female_astro_details"]["hour"].rawString()!
                        let timezone = data["female_astro_details"]["timezone"].rawString()!
                        let longitude = data["female_astro_details"]["longitude"].rawString()!
                        let year = data["female_astro_details"]["year"].rawString()!
                        let month = data["female_astro_details"]["month"].rawString()!
                        let day = data["female_astro_details"]["day"].rawString()!
                        let minute = data["female_astro_details"]["minute"].rawString()!
                        
                        // male
                        let nameM = data["male_astro_details"]["name"].rawString()!
                        let sunriseM = data["female_astro_details"]["sunrise"].rawString()!
                        let sunsetM = data["female_astro_details"]["sunset"].rawString()!
                        let ayanmashaM = data["female_astro_details"]["ayanamsha"].rawString()!
                        let genderM = data["female_astro_details"]["gender"].rawString()!
                        let latitudeM = data["female_astro_details"]["latitude"].rawString()!
                        let hourM = data["female_astro_details"]["hour"].rawString()!
                        let timezoneM = data["female_astro_details"]["timezone"].rawString()!
                        let longitudeM = data["female_astro_details"]["longitude"].rawString()!
                        let yearM = data["female_astro_details"]["year"].rawString()!
                        let monthM = data["female_astro_details"]["month"].rawString()!
                        let dayM = data["female_astro_details"]["day"].rawString()!
                        let minuteM = data["female_astro_details"]["minute"].rawString()!
                    
                    
                        self.textView.text = "Female \n\n Name : \(name) \n Sunrise : \(sunrise) \n Sunset : \(sunset) \n Ayanmasha : \(ayanmasha) \n Gender : \(gender) \n Latitude : \(latitude) \n Hour : \(hour) \n Timezone : \(timezone) \n Longitude : \(longitude) \n Latitude : \(latitude) \n Year : \(year) \n Month : \(month) \n Day : \(day) \n Minute : \(minute) \n\n\n Male \n\n Name : \(nameM) \n Sunrise : \(sunriseM) \n Sunset : \(sunsetM) \n Ayanmasha : \(ayanmashaM) \n Gender : \(genderM) \n Latitude : \(latitudeM) \n Hour : \(hourM) \n Timezone : \(timezoneM) \n Longitude : \(longitudeM) \n Latitude : \(latitudeM) \n Year : \(yearM) \n Month : \(monthM) \n Day : \(dayM) \n Minute : \(minuteM)"
                    
                    break
                case 2:
                    let vedha = data["vedha_report"].rawString()!
                    self.textView.text = " VEDHA REPORT : \n\n \(vedha)"
                    
                    
                    break
                case 3:
                    
                    let nadi = data["female_astro_details"]["Nadi"].rawString()
                    let nakshatra = data["female_astro_details"]["Naksahtra"].rawString()
                    let vashya = data["female_astro_details"]["Vashya"].rawString()
                    let ascendant = data["female_astro_details"]["ascendant"].rawString()
                    let signLord = data["female_astro_details"]["SignLord"].rawString()
                    let paya = data["female_astro_details"]["paya"].rawString()
                    let yoni = data["female_astro_details"]["Yoni"].rawString()
                    let karan = data["female_astro_details"]["Karan"].rawString()
                    let gan = data["female_astro_details"]["Gan"].rawString()
                    let tithi = data["female_astro_details"]["Tithi"].rawString()
                    let sign = data["female_astro_details"]["sign"].rawString()
                    let varna = data["female_astro_details"]["Varna"].rawString()
                    let nameAlphabet = data["female_astro_details"]["name_alphabet"].rawString()
                    let nakshtraLord = data["female_astro_details"]["NaksahtraLord"].rawString()
                    let tatva = data["female_astro_details"]["tatva"].rawString()
                    let yunja = data["female_astro_details"]["yunja"].rawString()
                    let churan = data["female_astro_details"]["Charan"].rawString()
                    let yog = data["female_astro_details"]["Yog"].rawString()
                    //Male Record
                    let nadiM = data["male_astro_details"]["Nadi"].rawString()
                    let nakshatraM = data["male_astro_details"]["Naksahtra"].rawString()
                    let vashyaM = data["male_astro_details"]["Vashya"].rawString()
                    let ascendantM = data["male_astro_details"]["ascendant"].rawString()
                    let signLordM = data["male_astro_details"]["SignLord"].rawString()
                    let payaM = data["male_astro_details"]["paya"].rawString()
                    let yoniM = data["male_astro_details"]["Yoni"].rawString()
                    let karanM = data["male_astro_details"]["Karan"].rawString()
                    let ganM = data["male_astro_details"]["Gan"].rawString()
                    let tithiM = data["male_astro_details"]["Tithi"].rawString()
                    let signM = data["male_astro_details"]["sign"].rawString()
                    let varnaM = data["male_astro_details"]["Varna"].rawString()
                    let nameAlphabetM = data["male_astro_details"]["name_alphabet"].rawString()
                    let nakshtraLordM = data["male_astro_details"]["NaksahtraLord"].rawString()
                    let tatvaM = data["male_astro_details"]["tatva"].rawString()
                    let yunjaM = data["male_astro_details"]["yunja"].rawString()
                    let churanM = data["male_astro_details"]["Charan"].rawString()
                    let yogM = data["male_astro_details"]["Yog"].rawString()
                    
                    
                    self.textView.text = "Female \n\n Nadi : \(nadi ?? "Could not fetch") \n Naksahtra : \(nakshatra ?? "Could not fetch") \n Vashya : \(vashya ?? "Could not fetch") \n Ascendant : \(ascendant ?? "Could not fetch") \n Sign Lord : \(signLord ?? "Could not fetch") \n Paya : \(paya ?? "Could not fetch") \n  Yoni : \(yoni ?? "Could not fetch") \n  Karan : \(karan ?? "Could not fetch") \n  Gan : \(gan ?? "Could not fetch") \n  Tithi : \(tithi ?? "Could not fetch") \n  Sign : \(sign ?? "Could not fetch") \n  Varna : \(varna ?? "Could not fetch") \n  Name Alphabet : \(nameAlphabet ?? "Could not fetch") \n  Naksahtra Lord : \(nakshtraLord ?? "Could not fetch") \n  Tatva  : \(tatva ?? "Could not fetch") \n  Yunja : \(yunja ?? "Could not fetch") \n  Churan : \(churan ?? "Could not fetch") \n  Yog : \(yog ?? "Could not fetch") \n\n\n Male \n\n Nadi : \(nadiM ?? "Could not fetch") \n Naksahtra : \(nakshatraM ?? "Could not fetch") \n Vashya : \(vashyaM ?? "Could not fetch") \n Ascendant : \(ascendantM ?? "Could not fetch") \n Sign Lord : \(signLordM ?? "Could not fetch") \n Paya : \(payaM ?? "Could not fetch") \n  Yoni : \(yoniM ?? "Could not fetch") \n  Karan : \(karanM ?? "Could not fetch") \n  Gan : \(ganM ?? "Could not fetch") \n  Tithi : \(tithiM ?? "Could not fetch") \n  Sign : \(signM ?? "Could not fetch") \n  Varna : \(varnaM ?? "Could not fetch") \n  Name Alphabet : \(nameAlphabetM ?? "Could not fetch") \n  Naksahtra Lord : \(nakshtraLordM ?? "Could not fetch") \n  Tatva  : \(tatvaM ?? "Could not fetch") \n  Yunja : \(yunjaM ?? "Could not fetch") \n  Churan : \(churanM ?? "Could not fetch") \n  Yog : \(yogM ?? "Could not fetch") "

                    
                    break
                case 5:
                   
                    let manglik = data["manglik"]
                    let malePercent = manglik["male_percentage"].rawString()!
                    let femalePercent = manglik["female_percentage"].rawString()!
                    let conclusion = data["conclusion"]["match_report"].rawString()!
                    
                    self.textView.text = "Manglik Percentage \n\n Male \n \(malePercent)% \n\n Female \n \(femalePercent)% \n\n Conclusion : \n \n \(conclusion)"
                    
                    break
                case 4:
                    let name = data["male_planet_details"][0]["name"].rawString()
                    let nakshatra = data["male_planet_details"][0]["nakshatra"].rawString()
                    let house = data["male_planet_details"][0]["house"].rawString()
                    let planetAwastha = data["male_planet_details"][0]["planet_awastha"].rawString()
                    let sign = data["male_planet_details"][0]["sign"].rawString()
                    let normDegree = data["male_planet_details"][0]["normDegree"].rawString()
                    let nakshtraLord = data["male_planet_details"][0]["nakshatraLord"].rawString()
                    let speed = data["male_planet_details"][0]["speed"].rawString()
                    let fullDegree = data["male_planet_details"][0]["fullDegree"].rawString()
                    
                    self.textView.text = "Name : \(name ?? "Could not fetch") \n Nakshatra : \(nakshatra ?? "Couldnot fetch") \n House : \(house ?? "Couldnot fetch" ) \n Planet Awastha : \(planetAwastha ?? "Couldnot fetch") \n Sign : \(sign ?? "Couldnot fetch") \n NormDegree: \(normDegree ?? "Couldnot fetch") \n Nakshatra Lord : \(nakshtraLord ?? "Couldnot fetch") \n Speed : \(speed ?? "Couldnot fetch") \n Full Degree : \(fullDegree ?? "Couldnot fetch")"
                    break
                   
                case 6:
                    let report = data["conclusion"]["match_report"].rawString()!
                    self.textView.text = "Report : \n\n \(report)"
    
                    break
                case 7:
                    self.textView.text = data.rawString()
                    
                    break
                case 8:
                    
                   self.textView.text = data.rawString()
                   
                    break
                case 9:
                    let aPercent = data["ashtakoota_percentage"].rawString()!
                    let rPercent = data["rajju_match_percentage"].rawString()!
                    let vPercent = data["vedha_match_percentage"].rawString()!
                    let mMatch = data["manglik_match_percentage"].rawString()!
                    let mPercent = data["match_percentage"].rawString()!
                    
                    self.textView.text = "Points \n\n Ashtakoota : \(aPercent) \n\n Rajju : \(rPercent) \n\n Vedha Match : \(vPercent) \n\n Manglik Match Percent : \(mMatch) \n\n Match Percent : \(mPercent)"
                    
                    break
                case 10:
                    
                    self.textView.text = data.rawString()
                    break
                
                    
                default: self.textView.text = data.rawString()
                    
                }
            }
            
            activityIndicator.stopAnimating()
            
            
        }
        
        
    }
    

}
