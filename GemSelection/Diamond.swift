//
//  Diamond.swift
//  GemSelection
//
//  Created by Abhishek Chaudhary on 07/01/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit
var isDiamondcomingFromHomePage:Bool = false
class Diamond: UITableViewController {
lazy var text  = ""
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBAction func buyNow(_ sender: Any) {
        ShowWebView(urll: "https://khannagems.com/")
    }
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
        isDiamondcomingFromHomePage = false
    }
 
    override func viewWillAppear(_ animated: Bool) {
        if isDiamondcomingFromHomePage == true {
            let leftBarBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_arrow_back_white"), style: .plain, target: self, action: #selector(back))
            self.navigationItem.leftBarButtonItem = leftBarBtn
        }
            if isDiamondcomingFromHomePage == false{
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
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
   text = "<p align=\"left\"><br><strong>Heera Stone</strong>: When buying a Heera Stone beware – market is full of Heera Stone or diamond that is fake/ looks like Heera or is filled Stone. The most difficult to understand is a filled Heera Stone which is often sold with a certificate that talks of its Natural Origin but falls short in giving details of any kind of filling in it.<br><br>So, before buying the <strong>Heera Stone</strong> visit Gem Selections, Shop No. 8, A-3 Block, Janakpuri, New Delhi -110058 so that you are able to understand what a filled <strong>Heera Stone</strong> is and what to check before buying a Heera Stone.<br><br>Benefits of wearing Heera Stone:<br>1. <strong>Heera Stone</strong> is a Gemstone of planet Venus and is its ruling Lord is goddess Laxmi.<br>2. One who wears a <strong>Heera Stone</strong> starts looking attractive because it is the Gemstone of Venus the planet of attraction.<br>3. Increase in wealth is seen, because Venus i.e., Shukra is the planet of Ashwaria and Vaibhav.<br>4. Love from the people you cherish is visible and the person becomes good looking and attractive.<br>5. Megha shakti increases and the person has a robust health.<br>6. One who wears a <strong>Heera Stone</strong> automatically becomes fashionable. <br><br>The slightly misshapen octahedral shape of this rough diamond crystal in matrix is typical of the mineral. Its lustrous faces also indicate that this crystal is from a primary deposit. <br><br><b><a href=\"Govt-Lab-Certified-Diamonds.htm\" title=\"Govt Lab Certified Diamonds\">Govt Lab Certified Diamonds</a>::<a href=\"Certified-Diamonds.htm\" title=\"Certified Diamonds\">Certified Diamonds</a>::<a href=\"Solitaire-Rings.htm\" title=\"Solitaire Rings\">Solitaire Rings</a>::<a href=\"Loose-Solitaires.htm\" title=\"Loose Solitaires\">Loose Solitaires</a>::<a href=\"Loose-Diamonds.htm\" title=\"Loose Diamonds\">Loose Diamonds</a>::</b><br><br><h3>1. What is Heera Stone called English?</h3><br><br><strong>Heera Stone</strong> is called Diamond in English. It should better be referred to as Natural Diamond. <br><br><h3>2. Why is a Heera Stone worn by people?</h3><br><br><strong>Heera Stone</strong> is the Gemstone of Venus i.e., Shukra in astrology. Its ruling deity is Lakshmiji. It gives wealth, good fortunes, attractive body and fame to the wearer.<br><br><h3>3. Price of Heera Stone.</h3><br><br>The price of <strong>Heera Stone</strong>, like all Gemstones, is dependent on its quality i.e., Colour, Clarity, Shine and Carat Weight.<br>Astrological Heera Stones of 1 carat can range from Rs.20,000 to Rs.75,000 per carat<br>Fine Heera Stones can range Rs. 1,25,000 to Rs.2,25,000 per carat.<br>Smaller Gemstone of Heera will cost less e.g., a fine 10 cent Heera stone can cost Rs.3000 to Rs.5000 only.<br><br><h3>4. Where to buy Heera Stone in Delhi?</h3><br><br>Gem Selections, Janakpuri, New Delhi is the only place where you can buy Natural Heera Stone with proper Govt. Lab Certificate and Bill.<br>You know, Gemstones with Natural Origin and without any Treatment are only available at Gem Selections. This is the reason, why people from the entire globe flock to Gem Selections to buy <strong>Heera Stone</strong>.<br><br><h3>5. How to identify a Heera Stone?</h3><br><br>Identification of Heera Stone by a lay man is nearly impossible. The only way to find weather a Heera Stone is real or not is to buy a Govt. Lab Certified <strong>Heera Stone</strong>.<br><br><br><br><h3>Heera Stone Properties</h3>CategoryNative minerals<br>Formula :: C<br>Strunz :: 1.CB.10a<br>Crystal :: Cubicsystem :: Hexoctahedral class<br><h3>Heera Stone Identification</h3>Formula mass:: 12.01 g/mol <br>Color:: Typically yellow, brown or gray to colorless. Less often blue, green, black, translucent white, pink, violet, orange, purple and red.<br>Crystal habit:: Octahedral<br>Twinning:: Spinel law common (yielding \"macle\")<br>Cleavage:: 111 (perfect in four directions)<br>Fracture:: Conchoidal (shell-like)<br>Mohs scale hardness:: 10 (defining mineral)<br>Luster:: Adamantine<br>Streak:: Colorless<br>Diaphaneity:: Transparent to subtransparent to translucent<br>Specific gravity:: 3.52±0.01<br>Density:: 3.5–3.53 g/cm3<br>Polish luster ::Adamantine<br>Optical properties:: Isotropic<br>Refractive index:: 2.418 (at 500 nm)<br>Birefringence::None<br>Pleochroism::None<br>Dispersion::0.044<br>Melting point ::Pressure dependent<br><br><strong>Heera Stone</strong> (Heera) is the stone of planet Venus, SHUKRA. by Hindu Shastras, SHUKRA is the son of MAHARISHI BHRAGU.<br>One face of an uncut octahedral diamond, showing trigons (of positive and negative relief) formed by natural chemical etching<br><br>Diamonds are thought to have been first recognized and mined in India, <br><br>significant alluvial deposits of the stone could be found many centuries ago along the rivers Penner, Krishna and Godavari. Diamonds have been known in India for at least 3,000 years but most likely 6,000 years<br><br><strong>Heera Stone</strong>. According to Vedic Astrology, Diamond represents the planet Venus. Diamond is a very effective Gemstone.<br><br><strong>Heera Stone</strong> (Shukra/Venus Stone). Heera Stone(Diamond). Most attractive to the eyes, the diamond is famous for its play of colors.<br><br> Heera was a magic stone of great power and served to drive away nocturnal specters;<br><br>Heera Stone: Stone Benefits and Heera Gemstone Properties. Diamond – the emperor of gemstones – is also the purest derivative in mineralogy.<h3>Benefits of Diamond in Astrology</h3> <strong>Heera Stone</strong> helps increase the intellectual power of the person. This helps increase the patience level of the person.<br><br>This can lead to a life of prosperity, happiness and fullness.<br><br><strong>Heera Stone</strong> gives us power, energy, sex energy, sexual activeness, It is also used in Energy enhancer.<br><br>It is favorable to wear this gemstone when attraction towards opposite sex increases. <br><br><strong>Heera Stone</strong> (Diamond) is the symbol of beauty, luxuries, comforts and glamour.<br><br>Everything about Diamond, (Heera stone) the gemstone for Venus. Diamond is called Hira in Hindi/ Sanskrit and attributed to Shukra. Know size, quality, weight.<br><br><strong>Heera Stone</strong> are mined in South Africa, India, Tanzania, USA, Canada and Russia. High quality Diamonds are rare and only gems that are not synthetic or man-made should be worn for astrological purposes .<br><br><strong>Heera Stone</strong> are the hardest material on this planet and that a diamond is forever, well we put it under the press and put the legend to the test.<br><br><strong>Heera Stone</strong> should be worn only after the proper analysis of a persons horoscope. Watch this video in details to know who can wear a Diamond and also learn the proper astrological indication of wearing this gemstone.<br><br><strong>Heera Stone</strong> is the most sought after gemstone which brings to the wearer the energy of the planet venus. This gemstone can be worn by the person who has a well placed Venus in his/her astrology birth chart.<br><br><strong>Heera Stone</strong>Glamour, Luxury & Beauty with the help of Astrology. Venus is d planet of name, fame & wealth.<br><br>About <strong>Heera Stone</strong> Certificates A diamond grading certificate is a report given by an independent and professional gemological laboratory<br><br><strong>Heera Stone</strong> are formed deep within the Earth about 100 miles or so below the surface.<br><br>Many people believe that diamonds are formed from the metamorphism of coal. <br><br>This may lack the resonance of De Beers’s “A Diamond is Forever”, one of the great slogans of the 20th century. But, by paying a backhanded compliment to the threat from synthetics, it shows the industry is becoming less complacent. These days, any industry that thinks anything can last forever is ripe for toppling.<br><br> The Diamond Approach is a contemporary teaching that developed within the context of awareness of both ancient spiritual teachings<br><br>"
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 240
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let width = 343; let height = 162
            let cell = tableView.dequeueReusableCell(withIdentifier: "webcelldiamond", for: indexPath) as! diamondweb
            cell._webView.loadHTMLString("<iframe width=\"\(width)\" height=\"\(height)\" src=\"https://www.youtube.com/embed/TCWMjYKcvpY\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
            return cell
        }
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ringcell", for: indexPath)	
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "diamondtextcell", for: indexPath) as! diamondtext
            cell._label.attributedText = text.convertHtml()
            cell._label.sizeToFit()
            return cell
        }

    }
   
    
}

class diamondweb: UITableViewCell {
    @IBOutlet weak var _webView: UIWebView!
    
}
class diamondtext: UITableViewCell {
    @IBOutlet weak var _label: UILabel!
    
}
