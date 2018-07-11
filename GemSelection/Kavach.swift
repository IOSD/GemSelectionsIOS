//
//  Kavach.swift
//  GemSelection
//
//  Created by Abhishek Chaudhary on 06/01/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit

class Kavach: UITableViewController {
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBAction func buynow(_ sender: Any) {
        ShowWebView(urll: "https://khannagems.com/")
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
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 240
   
        //Background Image
        let backgroundImage = UIImage.init(named: "Gemselection")
        let midX = self.view.frame.width / 3
        let midY = self.view.frame.height / 2
        let backgroundImageView = UIImageView.init(frame: CGRect(x: midX, y: midY, width: midX, height: midY))
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFit
        backgroundImageView.alpha = 0.1
        
        self.view.insertSubview(backgroundImageView, at: 0)
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func openShop(){
         UIApplication.shared.open(URL(string: "https:khannagems.com/")!, options: [:], completionHandler: nil)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "shopnowrow", for: indexPath) as! Shopnow
            cell._shopNowBtn.layer.borderWidth = 4.0
            cell._shopNowBtn.layer.borderColor = UIColor.black.cgColor
            cell._shopNowBtn.addTarget(self, action: #selector(openShop), for: .touchUpInside)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "kavachtextrow", for: indexPath) as! KavachText
            cell._label.attributedText = "<font color=\"pink\"><h2>We deal in following 'Kavach' Products</h2></font><h3>Nazar Suraksha Kavach</h3><br> Nazar Suraksha Kavach to ward off the evil eye,<br><br><br>Evil eye is a look that is believed by all cultures to be able to cause injury or bad luck on the person at whom it is directed for reasons of envy or dislike.<br><br>The term also refers to the power attributed to certain persons, of inflicting injury or bad luck by such an envious or ill wishing look.<br><br>It usually affects infants and children; they are more vulnerable to evil eye. However, Successful adults are at great risk of harms from evil eye.<br><br>This Nazar Suraksha Kavach is made as per the traditional practice and is available in three forms<br>There are various Yantra’s in use some are for improving Bhagya others to improve wealth and still others to ward off enemies. Yantra are of three kinds <br><br>Wrist band<br>Pendent<br>Wall hanging<br><br>The use of these protects one from evil eye and bad luck. People of all ages should use it to protect themselves and their families.<br>It safeguards both the health and wealth of the family.<li>The term also refers to the power attributed to certain persons, of inflicting injury or bad luck by such an envious or ill wishing look.</li><li>It usually affects infants and children; they are more vulnerable to evil eye. However, Successful adults are at great risk of harms from evil eye.</li><li>This Nazar Suraksha Kavach is made as per the traditional practice and is available in three forms</li><li>Wrist band</li><li>Pendent</li><li>Wall hanging</li><li>The use of these protects one from evil eye and bad luck. People of all ages should use it to protect themselves and their families.</li><li>It safeguards both the health and wealth of the family.</li><br><br>Rs. 1100.00<br><br><h3><u>About Baglamukhi Kavach</h3></u><br>This is all about <strong>Baglamukhi Kavach</strong>, which is used to demolish enemies. If affixed at place of work, <strong>Baglamukhi Kavach</strong> gives complete victory over competitors. Widely used for victory in elections and court cases, it should be wear on Tuesday after praying to God to finish all enemies.Shri <strong>Baglamukhi Kavach</strong>, This is a Kavach, which is used to demolish enemies. it gives complete victory over competitors. Widely used for victory in elections and court cases, <br><br><h3>Devi KAVACH</h3><h3>Durga Kavach</h3> is a powerful Kavach for attaining desires, to remove difficulties and to conquer enemies. Durga Kavach bestows wealth and property and protects the person from all sorts of dangers.Worship of this Kavach as per Adhayaya 4 sloka 17 of Durga Saptashati removes poverty. It also gives results when used in neck, arm or on body. <strong>Durga Kavach</strong> is most famous Kavach is very effective. If used with faith it is the most powerful Kavach.<br><br><strong>Durga Kavach</strong> is of Shri Durga Ambe Maa. <strong>Durga Kavach</strong> is worshipped particularly during Navratras and on Ashtami tithi . <strong>Durga Kavach</strong> is a powerful Kavach for attaining desires, to remove difficulties and to conquer enemies <strong>Durga Kavach</strong> bestows wealth and property and protects the person from all sorts of dangers. It also gives result when used in neck, arm or on body. Kavach can be defined as visual mantras which have been used since the days of Yajur Veda and Brahminical Text to remove the malefic effects of certain evil forces (Rakshisi Shakti) and to Strengthen the positive forces (Davik Shakti) <br><br><h3>Hanuman Kavach</h3><br>Fearless and Powerful – Capable of taking on full armies single handily but still devoted and disciplined. This is the nature of Hanuman Kavach It has the powers of the wind god (Pawan putra). Regular puja of Hanuman Kavach fasting on Tuesday and placing a Shri Hanuman Kavach both at the place of worship and in one’s sitting room brings fearless nature, all the evil forces remain at bey and the person is victorious in all his pursuits. <br><h3>NARAYAN KAVACH</h3><br><h3>Panch Mukhi Rudraksha Kavach</h3><br><h3>About Shani Kavach</h3><br>Shani Kavach enhance the benefic effects and curtail the malefic effects of Saturn. If worshipped regularly then it gives the person a strong connection with the omnipotent, thus it enhances the spiritual power. The person gets creative in more than one ways. It improves the social status and gives one authority. People varying from Sadhus to executives worship it for its special benefits.<br><br>".convertHtml()
                 cell._label.sizeToFit()
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 156
        } else {
            return UITableViewAutomaticDimension
        }
    }
}

class Shopnow: UITableViewCell {
    @IBOutlet weak var _shopNowBtn: UIButton!
    
}
class KavachText: UITableViewCell {
    @IBOutlet weak var _label: UITextView!
    
}
