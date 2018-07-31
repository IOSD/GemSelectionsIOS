//
//  Extra.swift
//  GemSelection
//
//  Created by Abhishek Chaudhary on 05/01/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit
var xindex:Int = 0 ; var isCerti:Int = 0 ; var whichCerti:Int = 0 ; var ship:Int = 0
class Extra: UIViewController {

    @IBOutlet weak var _deliverView: UIView!
    @IBAction func _okBtn(_ sender: Any) {
       self.navigationController?.popToRootViewController(animated: true)
    }
    @IBOutlet weak var _textView: UITextView!
    @IBOutlet weak var _imageVIew: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        if ship == 1 {
            _textView.isHidden = true ; _imageVIew.isHidden = true ; _deliverView.isHidden = false
            self.view.backgroundColor = UIColor(white: 0.6, alpha: 1)
        } else {
            
        
        if isCerti == 0{
            _imageVIew.isHidden = true ; _textView.isHidden = false ; _deliverView.isHidden = true ; ship = 0
        if xindex == 1 {
        _textView.attributedText = "<h3>Management Team</h3><h3>Pankaj Khanna – Director, Khanna Gems Pvt. Limited</h3><br><br>Pankaj Khanna is the founder of Khanna Gems Pvt. Limited and has been the Director of Khanna Gems Pvt. Limited since its incorporation in 1997. He is a commerce graduate for Sri Venketeshwara College, Delhi University and Life Member of All India Management Association. He completed a Certificate Course in Gemology from Surat Gemology Institute (Regd.) in March 1986. He is a Life Member of Indian Diamond Institute, Surat since 2004 and has been authorized by Indian Institution of Valuers, Pune to use the title of “Chartered Valuer of Jewellery”. He is aLife Member of Consultancy Development Centre, New Delhi <br><br>Pankaj Khanna is also a renowned astrologer and has appeared in approximately 100 episodes of Star Plus program ‘Meri Sehali’ and 60 episodes of E TV program ‘Nari’. Apart from television he has also been widely covered by numerous TV channels including, CNBC, Star News and by national newspapers like The Hindustan Times and The Times of India.<h3>Anu Khanna – Director, Khanna Gems Pvt. Limited</h3><br><br>Anu Khanna has been the Director of Khanna Gems Pvt. Limited since its incorporation in 1997. She is M.Com with specialisation in Finance and Taxation from Delhi University. She has been involved in Gem & Jewellery trade since 1990.<br><br><h3>Anubha Khanna – Jewellery Designer, </h3><br>She is an artist and creates unique jewellery designs out of Gemstones and Diamonds for Khanna Gems Pvt. Limited.<br><br><h3>Aaradhya Khanna – Trainee,</h3><br><br>Aaradhya Khanna is a trainee at Khanna Gems Pvt. Limited. He is learning the art and science of handling Gem trade.<br><br><h3>A strange love story…</h3><br><br>Pankaj Khanna had a strange fascination for Gemstones and Jewellery. Even as a young child Pankaj Khanna used to visit jewellers and used to see their show – windows from outside. He always wanted to do this trade from the childhood but had no knowledge and family background for the same. He did his graduation from Sri Venketeshwara College, Delhi University and then he went to Surat to formally study Gemology and lived there for one year and did a certificate course in Gemology and wanted to start Gemstones business fulltime. He started his business venture with a meagre amount of Rs.1000 in 13th day of January 1987.<br><br> But simultaneously he had given competitive exams due to social dogmaand was selected in NTPC, a public sector undertaking. He joined NTPC on 5th March 1987.<br><br>But his heart pulled him away and in March 1994 he left the job and ventured full time into his cherished business. He started the business as a supplier to Jewellers and Astrologers across North India. <br><br>In 1997, he founded Khanna Gems Private Limited dealing in retail and wholesale of Gemstones, Diamonds, Jewellery, Handirafts, Rudraksha and yantras.Pankaj Khanna while handling the Gemstones business became a celebrity Astrologer and after the closing the shop in the evening used to work as in-house Astrologer with Taj Mahal Hotel (Taj Group of Hotels), New Delhi and with ITC Maurya Sheraton (Welcome Group), New Delhi. Mr. Khanna has also appeared in approximately 60 episodes of Star Plus program ‘Meri Sehali’ and 60 episodes of E TV program ‘Nari’, where he educated the masses about the various astrological concepts and products. Apart from television he has also been widely covered by numerous TV channels including, CNBC, Star News and by national Newspapers like The Hindustan Times and The Times of India. In 2002 <br><br>Even with limited resources and locational disadvantage Pankaj Khanna with his entrepreneurial skills has managed to create Gem Selections as a brand in the field of Gemstones in India. <br><br>He is a Life Member of All India Management Association He is a Life Member of Indian Diamond Institute, Surat since 2004 and has been authorized by Indian Institution of Valuers, Pune to use the title of “Chartered Valuer of Jewellery”. He is a Life Member of Consultancy Development Centre, New Delhi <br><br>In July 2002 Khanna Gems Pvt. Limited became the back end for all the Gemstones, Rudraksha& Yantra requirements of the Times Internet Limited.In addition to Times Internet Limited, Khanna Gems Pvt. Limited has been the back end for Gemstones requirements for www.rediff.com , www.indiainfo.com , www.homeshop18.com , www.sirindia.com . Khanna Gems Pvt. Limited is the only company in India that sells Gemstones with proper Govt. Lab Certificate, be it our brick and mortar shop in Janakpuri or our websites www.khannagems.com and www.gemselections.in. Each and every Gemstone that we sell goes through rigorous testing first at the company level and then we get each and every Gemstone certified by IGI – GTL. Khanna Gems Pvt. Limited is the benchmark for quality and transparency in the field of Gemstones.<br><br>Khanna Gems Pvt. Limited has also been the backend for handicrafts for HHEC since 2007 and Taj Khazana stores in Goa and Mumbai since 2008. <br><br><br>".convertHtml()
        }
        if xindex == 3 {
            _textView.attributedText = "<h1>Khanna Gems Private Limited</h1>Started its Operations on 1st – April – 1997 by taking over the business of Gem Selections a 10 years old firm.<br><br>The Core Business of Khanna Gems Private Limited it to procure rough Gemstones from mines and then cut and polish them.<br><br>All varieties of Precious and Semi-Precious Gemstones are dealt with at Khanna Gems Private Limite.<br><br>The Gemstones are checked for purity, efficacy and superior cutting and then send to Govt. Lab of Gem and Jewellery Export Promotion council for certification.<br><br>The entire inventory at Khanna Gems Private Limited is Govt. Lab Certified.<br><br>The Khanna Gems Private Limited is known for quality and originality of Ωits Gemstones and dependability of it dealings.<br><br><h3>Our Motto: Original Gemstones always and every time.</h3><br>".convertHtml()
        }
        if xindex == 2 {
          let imageview = UIImageView(image: #imageLiteral(resourceName: "pankaj-khanna"))
          imageview.contentMode = .scaleAspectFit
        imageview.frame = CGRect(x: 125, y: 40, width: 125, height: 116)
          _textView.addSubview(imageview)
            _textView.font = UIFont.systemFont(ofSize: 25)
            _textView.attributedText = "<br><br><br><br><br><br><br><br><br><br><br>Sh. Pankaj Khanna who is a renowned Astrologer is also a Certified Gemologist and Jewellery Valuer.He has strived hard all his life so that people are able to get:<br><br>•Original Gemstones.<br>•Gemstones with a high efficacy.<br>•Gemstones that are property abhimantrit and charged.<br>•Gemstones that come with full disclosure as to any treatment or enhancement.".convertHtml()
        }
            
        else if xindex == 0 {
            let webView = UIWebView(frame: CGRect(x: 6, y: 60, width: 340, height: 181))
            webView.loadHTMLString("<iframe width=\"343\" height=\"181\" src=\"https://www.youtube.com/embed/exSOLLQKZEM\" frameborder=\"0\" gesture=\"media\" allow=\"encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
            _textView.addSubview(webView)
            _textView.attributedText = "<h2><center>“Gem Stones is our religion” – Gem Selections<center></h2><br><br><br><br><br><br><br><br><br><br><br><br>Gem Selections came into being on 13th day of January 1987 as a proprietary concern. Its main line of business was buying raw Gem stones from the mines and getting them cut and polished (Lapidary Work) and then supplying these Gems to various Jewellers across India.<br><br>In 1994 it set up a wholesale & retail outlet in JanakPuri,New Delhi and has been handling its marketing operations from there since then. In addition to selling Gemstones it also started manufacturing and selling Diamond & Gem studded Jewellery and Handicrafts made of Semi-Precious& Rough Gems, Rudraksha and other related products.<br><br>In 1997, Khanna Gems Pvt. Limited took over Gem Selections with Pankaj Khanna and Anu Khanna as its Directors. <br><br>Judging the value and quality of Gem Stones requires specialised knowledge, training and experience. We at Gem Selections, are dedicated to the highest standards of ethics in helping our customers choose the right Gem Stones which are of the highest quality at the most affordable prices.We regularly update our market information and are always updated about whatever is new in the field of Gem Stones, Diamonds, Jewellery and our other trade products.<br><br>It is the endeavor of Gem Selections to become a benchmark of quality and customer satisfaction in every field of its operations.<br><br>Khanna Gems Pvt. Limited was incorporated on 20th January,1997 and on 1st April,1997 it took over Gem Selections. Khanna Gems Pvt. Limited deals in retail and wholesale of Gemstones, Diamonds, Jewellery, Handirafts, Rudraksha and other related products. In July 2002 Khanna Gems Pvt. Limited became the back end for all the Gemstones, Rudraksha& Yantra requirements of the Times Internet Limited (www.astrospeak.com). In addition to Times Internet Limited we have been the back end for Gem Stone requirements for www.rediff.com , www.indiainfo.com , www.homeshop18.com , www.sirindia.com . <br><br>Khanna Gems Pvt. Limited is the only company in India that sells Gemstones with proper Govt. Lab Certificate, be it our brick and mortar shop in Janakpuri or our websites www.khannagems.com and www.gemselections.in. Each and every Gemstone that we sell goes through rigorous testing first at the company level and then we get each and every Gemstone certified by IGI – GTL. Khanna Gems Pvt. Limited assures thequality and transparency in the field of Gemstones.<br><br>Khanna Gems Pvt. Limited has also been the backend for handicrafts for HHEC since 2007 and Taj Khazana stores in Goa and Mumbai since 2008. <br><br>The guiding principal of the company have been the words of Peter F Drucker “It is the credit the reputation for honest dealings and the dependability of the businessman on which depends his ultimate success or otherwise.” With this ideal the company developed a vast base of 100% satisfied customers not only across the length and breadth of India but also in foreign lands.<br><br><h3>Vision – To be the global benchmark for quality and be the biggest player in Gemstones, Diamonds and Jewellery Industry.</h3><br><br>".convertHtml()
        }
        }
        else if isCerti == 1{
            _textView.isHidden = true ; _imageVIew.isHidden = false ; _imageVIew.contentMode = .scaleAspectFit ;_deliverView.isHidden = true ; ship = 0
            if whichCerti == 0{
                _imageVIew.image = #imageLiteral(resourceName: "Natural-Pukhraj-Govt-Lab-Certificate")
            }
            if whichCerti == 1{
                _imageVIew.image = #imageLiteral(resourceName: "Treated-Sapphire")
            }
            if whichCerti == 2{
                _imageVIew.image = #imageLiteral(resourceName: "Heated-Sapphire")
            }
            if whichCerti == 3{
                _imageVIew.image = #imageLiteral(resourceName: "all-india-management")
            }
            if whichCerti == 4{
                _imageVIew.image = #imageLiteral(resourceName: "indian-diamond-institute")
            }
            else if whichCerti == 5{
                _imageVIew.image = #imageLiteral(resourceName: "surat-gemology-institute")
            }
            if whichCerti == 21{
                _imageVIew.image = #imageLiteral(resourceName: "testimonials")
            }
        }
        }
    }

}



//FAQPopUP:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
var isfaqcomingfromHome:Bool = false
class FaqPopUp: UIViewController,UITableViewDelegate,UITableViewDataSource{
    

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBAction func buyNow(_ sender: Any) {
        ShowWebView(urll: "https://khannagems.com/")

    }
    
    @IBAction func whileBuying(_ sender: Any) {
        value = "RyxQ1DsK4Kg"
        tableView.reloadData()
    }
    
    @IBOutlet var tableView: UITableView!
    @IBAction func buyinDelhi(_ sender: Any) {
        value = "1W8xZ-D-Gpo"
        tableView.reloadData()
    }
    
    @IBAction func purchasingGems(_ sender: Any) {
        value = "mdOWDD0YA7c"
        tableView.reloadData()
    }
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
    
    
    @IBAction func wearGems(_ sender: Any) {
        value = "TByLvRR0oLk"
        tableView.reloadData()
    }
    
    @IBAction func gemWork(_ sender: Any) {
        value = "DRZfRX9YKmU"
        tableView.reloadData()
    }
    
    @IBAction func identifySapphire(_ sender: Any) {
        value = "0q_Dy1xjrLY"
        tableView.reloadData()
    }
    @IBAction func pearlsCare(_ sender: Any) {
        value = "RB4rEmG0b5c"
        tableView.reloadData()
    }
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
        isfaqcomingfromHome = false
    }
    override func viewWillAppear(_ animated: Bool) {
        if isfaqcomingfromHome == true {
            let leftBarBtn = UIBarButtonItem(image:#imageLiteral(resourceName: "ic_arrow_back_white"), style: .plain, target: self, action: #selector(back))
            self.navigationItem.leftBarButtonItem = leftBarBtn
        }
        if isfaqcomingfromHome == false{
            if self.revealViewController() != nil {
                menuBtn.target = self.revealViewController()
                menuBtn.target = self.revealViewController()
                menuBtn.action = #selector
                    (SWRevealViewController.rightRevealToggle(_:))
                menuBtn.action = #selector
                    (SWRevealViewController.revealToggle(_:))
                self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            }}
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    var value = "mdOWDD0YA7c"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "webrow", for: indexPath) as! webrowinfaq
            let width = self.view.frame.width-20 ; let height = self.view.frame.height/3
            cell._webView.loadHTMLString("<iframe width=\"\(359)\" height=\"\(139)\" src=\"https://www.youtube.com/embed/\(value)\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "faqrow", for: indexPath)
            return cell
            
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 150
        } else {
            return 350
        }
    }
    
}
class webrowinfaq: UITableViewCell {
    @IBOutlet weak var _webView: UIWebView!
    
}






