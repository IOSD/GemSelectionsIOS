//
//  Perfumes.swift
//  GemSelection
//
//  Created by abhishek chaudhary on 11/01/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit

class perfumetable: UITableViewController {
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBAction func buyNow(_ sender: Any) {
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
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func kholde(){
        ShowWebView(urll: "https://khannagems.com/")
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "webrow", for: indexPath) as! WebRowinPerfumes
            cell._pricelistBtn.addTarget(self, action: #selector(kholde), for: .touchUpInside)
            let ww = cell._webView.frame.width ;  let hh = cell._webView.frame.height
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/d4riYvxGYqA?start=120\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
            return cell
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "textrow", for: indexPath) as! TextRowinPerfumes
            cell._label.attributedText = "<p align=\"left\"><font color=\"Black\" size=\"4\"><u><h1>Ittar</u></h1><font color=\"Black\" size=\"2\">The word <strong>ittar</strong> or attar is basically an Arabic word which means scent,this in turn has been derived from the Persian word Atr,meaning fragrance.Attar is a natural perfume oil derived from botanical sources. Most commonly these oils are taken from the botanical material through hydro or steam distillation. Oils can also be expressed by chemical means but generally natural perfumes which qualify as Ittar/Attars are distilled naturally. The oils obtained from the herbs flowers and wood are generally distilled into a wood base such as sandalwood and then aged. The aging period can last from one to ten years depending on the botanicals used and the results desired.<br><br>These all-natural perfumes are highly concentrated and therefore are usually offered for sale in small quantities and have traditionally been offered in decorated crystal cut type bottles or small jeweled decanters. <strong>Attars/Ittars</strong> have been used in the entire Eastern world for thousands of years. These 100% pure and natural perfumes are free of alcohol and chemicals. Natural perfumes are affordable because they are so concentrated that a small bottle will last the user several weeks, if not months. Due to the purity and the nature of oils, there is very little chance of spoilage .<br><br>Some of the first lovers of Attars/Ittars were the Mughal nobles of India. Jasmine ittar was the favorite perfume of the Nizams of the Hyderabad state. Traditionally in the Eastern world it was a customary practice of nobility to offer ittar to their guests at the time of their departure. The Attars/Ittars are traditionally given in ornate tiny crystal cut bottles called as itardans. This tradition of giving a scent to one's guests continues to this day in many parts of the Eastern world. Among Sufi worshipers the use of Attars/Ittars during meditation circles and dances is quite common.<br><br>Famous Attars/Ittars List<br><br>•Rose Attar/Ittar (Rosa damascena - Flower)<br>•Motia/Jasmin Attar/Ittar (Jasmine sambac - Flower)<br>•Mitti Attar/Ittar (Baked earth - Earth from river)<br>•Kewda Attar/Ittar (Pandanus odoritissimus - Flower)<br>•Saffron Attar/Ittar (Crocus sativa - Stigma)<br>•Agarwood/Oud Attar/Ittar (Aquilaria agallocha - Various parts)<br>•Gul Hina Attar/Ittar (Lawsonia alba - Flower)<br>•Genda/Merigold Attar/Ittar (Tagetes minuta - Flower)<br>•Champa Attar/Ittar (Michelia champaca - Flower)<br>•Bakul Attar/Ittar (Mimusops elengi - Flower)<br>•Blue Lotus Attar/Ittar (Nymphaea caerulea - Flower)<br>•Pink Lotus Attar/Ittar (Nelumbo nucifera - Flower)<br>•White Lotus Attar/Ittar (Nelumbo nucifera - Flower)<br>•Tuberose/Rajniganda Attar/Ittar (Polianthes tuberosa - Flower)<br>•White Water Lily Attar/Ittar (Nymphaea ampla - Flower)<br>•Zafari Attar/Ittar (Tagetes sp - Flower)<br>•Shamana Attar/Ittar (compound of fragrant spices, herbs, woods - Various parts)<br>•Amber Attar/Ittar (Pinus Succinifera - ----)<br>•Chameli Attar/Ittar (Jasminum Grandiflorum - Flower)<br>•Gulmohar Attar/Ittar (Painciana Regia - Flower)<br>•Juhi Attar/Ittar (Jasmine Auriculatum - Flower)<br>•Islamic Bakhur Attar/Ittar (Melaleuca Alternifolia - ----)<br>•Frangipani Attar/Ittar (Plumeria Ruera - ----)<br>•Khus Attar/Ittar (Vetiveria Zizanoides - Roots)<br>•Mogra Attar/Ittar (Abelmoschus Moschus - Flower)<br>•Loban Attar/Ittar (Styrax Benzoin - Various parts)<br>•Nakh Choya Attar/Ittar (Citrus Bigardia - Flower)<br>•Davana Attar/Ittar (Artemesia Pallens - Leaves)<br> Types of Attars/IttarsAttars/Ittars may be broadly categorized into following types of flavour or ingredients used.<br><br> Floral Attars/Ittars<br><br>Attars/Ittars manufactured from single species of flower are coming under this category. These are :-<br>•Gulab ex Rosa damascena or Rosa Edword<br>•Kewra ex Pandanus odoratissimus<br>•Motia ex Jasminum sambac<br>•Gulhina ex lawsonia inermis<br>•Chameli ex Jasminum grandiflorum<br>•Kadam ex Anthoephalus cadamba<br>Herbal <strong>Attars/Ittars</strong><br><br><strong>Attars/Ittars</strong> manufactured from combination of floral, herbal & spices come under this category.<br>Hina and its various forms viz., Shamama, Shamam –tul – Amber, Musk Amber and Musk Hina.<br><br><strong>Attars/Ittars</strong> which are neither floral nor herbal also come under this category. Ittar Mitti falls under this category and is produced by distillation of baked earth over base material.<br><br><strong>Attars/Ittars</strong> can also be classified based on their effect on human body such as<br><br>Warm <strong>Attars/Ittars</strong>'Attars/Ittars such as Musk, Amber, Kesar (Saffron), Oud, are used in winters, they increase the bodytemperature.<br><br>Cool <strong>Attars/Ittars</strong>' like Rose, Jasmine, Khus, Kewda, Mogra, are used in summers and are cooling for the body.<br><br>The Indian ittars in the past was used by the elite, particularly kings and queens. Today it is used in numerous ways<h3>Uses</h3>A major difference between synthetic perfumes and ittar is that the oil-based ittar is worn directly on your body. The inside of the wrist, behind the ears, the inside of elbow joints, back of the neck and a few other parts of your anatomy are directly dabbed with ittar. A small drop is enough to be used as a fragrance on the body. A few drops can be added to water and used with aromatic vapour lamps. A few drops of some <strong>Attars/Ittars</strong> are used with cold drinks, such as milk, to give fragrance.<h3>Culinary uses</h3>• Pan Masala and Gutka is the largest consumer of Indian ittars. The reason for using it is its extraordinary tenacity along with characteristic to withstand with tobacco note. The ittars used are Rose, Kewra, Mehndi, Hina, Shamama, Mitti, Marigold,etc<br>• Tobacco is relatively smaller segment for ittar consumption as compared to above industry. The ittars used are mainly kewra & Rose. Along with Pan masala & Gutkha it contributes to more the 75% of ittar consumption.<br>• Betel nut is also flvored with ittars such as Kewra and rose.<br>• Ittars of Rose & Kewra are used in traditional Indian sweets, for imparting flavor<br>• A few drops of some ittars are used with cold drinks, such as milk, to give fragrance.<br><h3>How to store</h3>Alcohol (common solvent for most perfumes) causes the perfume to evaporate much faster sometimes unto as much as 10 - 15 times faster. It is important to store ittar in an airtight glass vial in a cool dry place. Ittar has a permanent shelf life and some ittars become stronger and smell better when they are older.<h3>Health benefits</h3>• Owing to natural origin it is suitable for all types of skin. It is also useful in treating various skin diseases, various cosmetics, as it helps in improving skin tone and texture.<br>• Ittar oils are free from alcohol and any preservatives or chemical additives. They balance the Doshas (Vata, Pitta & Kapha) and promote the energy of the chakras<br>• Lemon oil taken internally or sniffed, is good for diabetes, asthma, boils and varicose veins. Three drops of sweet marjoram taken with a little jaggery cures migraine and hangovers. Nausea and vomiting are immediately controlled by petitgren oil.<br>• Indian ittar is increasingly being used for aromatherapy these days<br>• Jasmine extract is useful in cases of stress, hypertension and treating skin ailments. Inhaling sandalwood oil lessens stress and can stop vomiting. Applying it on the chest and throat cures dry cough.<h3>Storage:</h3>Ittar has a permanent shelf life and some <strong>Attars/Ittars</strong> become stronger and smell better when they are older.<h3>How ittars are made:</h3>The art of making these fragrances is a laborious process. There are two types of perfumes. One is extracted from herbs through the process of distillation — it takes 45 days to make them and another one to two years to mature. The second are floral perfumes which are extracted from flowers through hydro/steam distillation. \"<br><br><b>".convertHtml()
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 451
        } else {
            return UITableViewAutomaticDimension
        }
    }
}

class WebRowinPerfumes: UITableViewCell{
    @IBOutlet weak var _webView: UIWebView!
    @IBOutlet weak var _pricelistBtn: UIButton!
    
}
class TextRowinPerfumes: UITableViewCell{
    @IBOutlet weak var _label: UILabel!
    
}







class PerfumeCollection: UICollectionViewController,UICollectionViewDelegateFlowLayout{
var perfumeImages = [#imageLiteral(resourceName: "chandan-attar"),#imageLiteral(resourceName: "motia-attar"),#imageLiteral(resourceName: "gulab-attar"),#imageLiteral(resourceName: "chameli-attar"),#imageLiteral(resourceName: "musk-attar"),#imageLiteral(resourceName: "Kewara-attar"),#imageLiteral(resourceName: "Khuskhus-attar"),#imageLiteral(resourceName: "Rat-ke-Rani-attar"),#imageLiteral(resourceName: "Shama-attar")]
var perfumeNames = ["Chandan","Motia","Gulab","Chameli","Musk","Kewara","Khuskhus","Rat Ke Rani","Shama"]
var perfumeDetails = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _textViewwr.backgroundColor = UIColor(white: 0, alpha: 0.6)
        perfumeDetails = ["<font color=\"black\" font face=\"Verdana\" size=\"2\">Ittar Chandan: Code: AIT 04<br><br>This is made by taking out oil from sandal wood. Its aroma is considered auspicious in all religious ceremonies. It should be used while performing the rites in daily puja. Its fragrance brings peace and tranquility to mind and soul. Beneficial for people suffering from hypertension.<br><br>Price :Rs.250.00<br><br><br><b>VENUS &nbsp &nbsp:&nbsp &nbsp GULAB (Attars/Ittars)<br>MARS&nbsp&nbsp &nbsp:&nbsp &nbsp&nbsp MOTIA (Attars/Ittars)<br>MERCURY &nbsp &nbsp:&nbsp &nbsp CHANDAN (Attars/Ittars)<br>SUN &nbsp &nbsp:&nbsp &nbsp MOTIA (Attars/Ittars)<br>JUPITER &nbsp &nbsp:&nbsp &nbsp KEWARA (Attars/Ittars)<br>MOON &nbsp &nbsp:&nbsp &nbsp RAAT KI RANI (Attars/Ittars)<br>SATURN &nbsp &nbsp:&nbsp &nbsp CHAMELI (Attars/Ittars)<br>RAHU &nbsp &nbsp:&nbsp &nbsp KHUSKHUS (Attars/Ittars)<br>KETU &nbsp &nbsp:&nbsp &nbsp SHAMA (Attars/Ittars)<br></b></font>","<font color=\"black\" font face=\"Verdana\" size=\"2\">Ittar Motia: Code: AIT 04<br><br>Attar of <strong>Motia attar</strong> is used during the worship of Lord Shiva. It is considered to be connected with the aroma of deep forests of lower Himalaya region where Lord Shiva used to move with his followers. Its smell helps in reaching the inner self and is thus used during meditation to get deeper within fast and for lasting peace with one’s own self. People suffering from sleeplessness use it to get rid of their problem and are able to sleep fast. Men are automatically attracted towards women who use this ittar.<br><br>Price :Rs.250.00<br><br><br><b>VENUS &nbsp &nbsp:&nbsp &nbsp GULAB (Attars/Ittars)<br>MARS&nbsp&nbsp &nbsp:&nbsp &nbsp&nbsp MOTIA (Attars/Ittars)<br>MERCURY &nbsp &nbsp:&nbsp &nbsp CHANDAN (Attars/Ittars)<br>SUN &nbsp &nbsp:&nbsp &nbsp MOTIA (Attars/Ittars)<br>JUPITER &nbsp &nbsp:&nbsp &nbsp KEWARA (Attars/Ittars)<br>MOON &nbsp &nbsp:&nbsp &nbsp RAT KE RANI (Attars/Ittars)<br>SATURN &nbsp &nbsp:&nbsp &nbsp CHAMELI (Attars/Ittars)<br>RAHU &nbsp &nbsp:&nbsp &nbsp KHUSKHUS (Attars/Ittars)<br>KETU &nbsp &nbsp:&nbsp &nbsp SHAMA (Attars/Ittars)<br></b></font>","<font color=\"black\" font face=\"Verdana\" size=\"2\">Ittar Gulab: Code: AIT 04<br><br>Made after crushing <strong>gulab Attar</strong> (rose) petals, its aroma wards off depressions and brings vibrancy to the user. This <strong>gulab Attar</strong> is widely used in puja of Lord Ganesha. It also ignites a desire for romance and love. People unable to come to terms with loss of a loved one may carry sadness in their heart for years. When the body (heart or mind) are out of balance, we become more vulnerable to illness. <strong>gulab Attar</strong> may help gently dissolve blockages and feelings of disappointment and pain.<br><br>Price :Rs.250.00<br><br><br><b>VENUS &nbsp &nbsp:&nbsp &nbsp GULAB (Attars/Ittars)<br>MARS&nbsp&nbsp &nbsp:&nbsp &nbsp&nbsp MOTIA (Attars/Ittars)<br>MERCURY &nbsp &nbsp:&nbsp &nbsp CHANDAN (Attars/Ittars)<br>SUN &nbsp &nbsp:&nbsp &nbsp MOTIA (Attars/Ittars)<br>JUPITER &nbsp &nbsp:&nbsp &nbsp KEWARA (Attars/Ittars)<br>MOON &nbsp &nbsp:&nbsp &nbsp RAAT KI RANI (Attars/Ittars)<br>SATURN &nbsp &nbsp:&nbsp &nbsp CHAMELI (Attars/Ittars)<br>RAHU &nbsp &nbsp:&nbsp &nbsp KHUSKHUS (Attars/Ittars)<br>KETU &nbsp &nbsp:&nbsp &nbsp SHAMA (Attars/Ittars)<br></b></font>","<font color=\"black\" font face=\"Verdana\" size=\"2\">Ittar Chameli: Code: AIT 04<br><br>This <strong>Chameli Attar</strong> is used in headaches and for getting relief from a heavy head feeling which result from excessive noise and general botheration. This <strong>Chameli Attar</strong> is also used in the worship of Lord Krishna. It is used for giving fragrance to the water with which Lord Krishna is given bath with. In all the rituals connected with Lord Krishna this is extensively used.<br><br>Price :Rs.250.00<br><br><br><b>VENUS &nbsp &nbsp:&nbsp &nbsp GULAB (Attars/Ittars)<br>MARS&nbsp&nbsp &nbsp:&nbsp &nbsp&nbsp MOTIA (Attars/Ittars)<br>MERCURY &nbsp &nbsp:&nbsp &nbsp CHANDAN (Attars/Ittars)<br>SUN &nbsp &nbsp:&nbsp &nbsp MOTIA (Attars/Ittars)<br>JUPITER &nbsp &nbsp:&nbsp &nbsp KEWARA (Attars/Ittars)<br>MOON &nbsp &nbsp:&nbsp &nbsp RAAT KI RANI (Attars/Ittars)<br>SATURN &nbsp &nbsp:&nbsp &nbsp CHAMELI (Attars/Ittars)<br>RAHU &nbsp &nbsp:&nbsp &nbsp KHUSKHUS (Attars/Ittars)<br>KETU &nbsp &nbsp:&nbsp &nbsp SHAMA (Attars/Ittars)<br></b></font>","<font color=\"black\" font face=\"Verdana\" size=\"2\">Ittar Musk: Code: AIT 04<br><br>In Hindi it is known as Musk-a-amber. It is derived from the juice of mixture of flowers. <strong>Musk ittar</strong> is used mostly in tantrik rites. Diyas containing this ittar mixed in oil are lit to attract goddess Laxmi.<br><br>This <strong>Musk ittar</strong> is also used successfully by males who want to woo the opposite sex. This is said to give an unfair advantage to a male. <br><br>Price :Rs.250.00<br><br><br><b>VENUS &nbsp &nbsp:&nbsp &nbsp GULAB (Attars/Ittars)<br>MARS&nbsp&nbsp &nbsp:&nbsp &nbsp&nbsp MOTIA (Attars/Ittars)<br>MERCURY &nbsp &nbsp:&nbsp &nbsp CHANDAN (Attars/Ittars)<br>SUN &nbsp &nbsp:&nbsp &nbsp MOTIA (Attars/Ittars)<br>JUPITER &nbsp &nbsp:&nbsp &nbsp KEWARA (Attars/Ittars)<br>MOON &nbsp &nbsp:&nbsp &nbsp RAAT KI RANI (Attars/Ittars)<br>SATURN &nbsp &nbsp:&nbsp &nbsp CHAMELI (Attars/Ittars)<br>RAHU &nbsp &nbsp:&nbsp &nbsp KHUSKHUS (Attars/Ittars)<br>KETU &nbsp &nbsp:&nbsp &nbsp SHAMA (Attars/Ittars)<br></b></font>","<font color=\"black\" font face=\"Verdana\" size=\"2\">Ittar Kewara: Code: AIT 04<br><br><br><br><br>Price :Rs.250.00<br><br><br><b>VENUS &nbsp &nbsp:&nbsp &nbsp GULAB (Attars/Ittars)<br>MARS&nbsp&nbsp &nbsp:&nbsp &nbsp&nbsp MOTIA (Attars/Ittars)<br>MERCURY &nbsp &nbsp:&nbsp &nbsp CHANDAN (Attars/Ittars)<br>SUN &nbsp &nbsp:&nbsp &nbsp MOTIA (Attars/Ittars)<br>JUPITER &nbsp &nbsp:&nbsp &nbsp KEWARA (Attars/Ittars)<br>MOON &nbsp &nbsp:&nbsp &nbsp RAT KE RANI (Attars/Ittars)<br>SATURN &nbsp &nbsp:&nbsp &nbsp CHAMELI (Attars/Ittars)<br>RAHU &nbsp &nbsp:&nbsp &nbsp KHUSKHUS (Attars/Ittars)<br>KETU &nbsp &nbsp:&nbsp &nbsp SHAMA (Attars/Ittars)<br></b></font>","<font color=\"black\" font face=\"Verdana\" size=\"2\">Ittar Khuskhus: Code: AIT 04<br><br><br><br><br><br>Price :Rs.250.00<br><br><br><b>VENUS &nbsp &nbsp:&nbsp &nbsp GULAB (Attars/Ittars)<br>MARS&nbsp&nbsp &nbsp:&nbsp &nbsp&nbsp MOTIA (Attars/Ittars)<br>MERCURY &nbsp &nbsp:&nbsp &nbsp CHANDAN (Attars/Ittars)<br>SUN &nbsp &nbsp:&nbsp &nbsp MOTIA (Attars/Ittars)<br>JUPITER &nbsp &nbsp:&nbsp &nbsp KEWARA (Attars/Ittars)<br>MOON &nbsp &nbsp:&nbsp &nbsp RAT KE RANI (Attars/Ittars)<br>SATURN &nbsp &nbsp:&nbsp &nbsp CHAMELI (Attars/Ittars)<br>RAHU &nbsp &nbsp:&nbsp &nbsp KHUSKHUS (Attars/Ittars)<br>KETU &nbsp &nbsp:&nbsp &nbsp SHAMA (Attars/Ittars)<br></b></font>","<font color=\"black\" font face=\"Verdana\" size=\"2\">Ittar raat ki rani: Code: AIT 04<br><br><br><br><br><br>Price :Rs.250.00<br><br><br><b>VENUS &nbsp &nbsp:&nbsp &nbsp GULAB (Attars/Ittars)<br>MARS&nbsp&nbsp &nbsp:&nbsp &nbsp&nbsp MOTIA (Attars/Ittars)<br>MERCURY &nbsp &nbsp:&nbsp &nbsp CHANDAN (Attars/Ittars)<br>SUN &nbsp &nbsp:&nbsp &nbsp MOTIA (Attars/Ittars)<br>JUPITER &nbsp &nbsp:&nbsp &nbsp KEWARA (Attars/Ittars)<br>MOON &nbsp &nbsp:&nbsp &nbsp RAT KE RANI (Attars/Ittars)<br>SATURN &nbsp &nbsp:&nbsp &nbsp CHAMELI (Attars/Ittars)<br>RAHU &nbsp &nbsp:&nbsp &nbsp KHUSKHUS (Attars/Ittars)<br>KETU &nbsp &nbsp:&nbsp &nbsp SHAMA (Attars/Ittars)<br></b></font>","<font color=\"black\" font face=\"Verdana\" size=\"2\">Ittar Shama: Code: AIT 04<br><br><br><br><br><br>Price :Rs.250.00<br><br><br><b>VENUS &nbsp &nbsp:&nbsp &nbsp GULAB (Attars/Ittars)<br>MARS&nbsp&nbsp &nbsp:&nbsp &nbsp&nbsp MOTIA (Attars/Ittars)<br>MERCURY &nbsp &nbsp:&nbsp &nbsp CHANDAN (Attars/Ittars)<br>SUN &nbsp &nbsp:&nbsp &nbsp MOTIA (Attars/Ittars)<br>JUPITER &nbsp &nbsp:&nbsp &nbsp KEWARA (Attars/Ittars)<br>MOON &nbsp &nbsp:&nbsp &nbsp RAT KE RANI (Attars/Ittars)<br>SATURN &nbsp &nbsp:&nbsp &nbsp CHAMELI (Attars/Ittars)<br>RAHU &nbsp &nbsp:&nbsp &nbsp KHUSKHUS (Attars/Ittars)<br>KETU &nbsp &nbsp:&nbsp &nbsp SHAMA (Attars/Ittars)<br></b></font>"]
    }
    @IBAction func closeBtn(_ sender: Any) {
        _textViewwr.removeFromSuperview()

    }
    @IBOutlet var _textViewwr: UIView!
    
    @IBOutlet weak var _textView: UITextView!
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
        return perfumeImages.count
        }
    };func kholde(){
        ShowWebView(urll: "https://khannagems.com/")
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "perfumecell1", for: indexPath) as! PerfumeCollectionCell
            cell._priceBtn.addTarget(self, action: #selector(kholde), for: .touchUpInside)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "perfumecell", for: indexPath) as! PerfumeCollectionCell
            cell._perfumeImage.image = perfumeImages[indexPath.item]
            cell._perfumeName.text = perfumeNames[indexPath.item]
            cell.contentView.layer.cornerRadius = 2.0
            cell.contentView.layer.borderWidth = 1.0
            cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
            cell.contentView.layer.masksToBounds = true
            
            return cell
        }
    
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
        
        _textView.attributedText = perfumeDetails[indexPath.item].convertHtml()
        self.view.addSubview(_textViewwr)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            return CGSize(width: 370, height: 265)
        } else {
            return CGSize(width: 178, height: 265)
        }
    }
    
    
}

class PerfumeCollectionCell: UICollectionViewCell{
    @IBOutlet weak var _perfumeImage: UIImageView!
    @IBOutlet weak var _perfumeName: UILabel!
    @IBOutlet weak var _priceBtn: UIButton!
    
}
