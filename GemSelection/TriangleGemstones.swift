//
//  TriangleGemstones.swift
//  GemSelection
//
//  Created by abhishek chaudhary on 15/01/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit


class TriangleGemstones: UICollectionViewController {
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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
var tiangulargemsNames = ["Golden Topaz","Lemon Topaz","Green Amethyst","Rose Quartz","Green fluorite","Smoky Topaz","Green Onyx","White Quartz"]
   lazy var triangularImages = [#imageLiteral(resourceName: "Triangular-Golden-Topaz"),#imageLiteral(resourceName: "Triangular-Lemon-Topaz"),#imageLiteral(resourceName: "Triangular-Green-Amethyst"),#imageLiteral(resourceName: "Triangular-rose-quartz"),#imageLiteral(resourceName: "Triangular-green-fluorite"),#imageLiteral(resourceName: "Triangular-Smoky-Topaz"),#imageLiteral(resourceName: "Triangular-Green-Onyx"),#imageLiteral(resourceName: "Triangular-White-Quartz")]

   

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return triangularImages.count
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "trianglecell", for: indexPath) as! Trianglegemcell
            cell._bigLabel.text = "Triangular Gemstones are known to have special powers of healing and energising us. Gems of this shape when worn as pendants have more than normal effect and they do not loose there power when they are worn for long periods. There aura instead of weakning gets stronger and stronger. Wear these to get special benefits in your life. They come with Govt. Certificate and quality which comes with our 24 years of experience "
            cell._bigLabel.sizeToFit()
            cell.frame.size.width = (self.collectionView?.frame.width)!-20
           cell.frame.size.height = 192
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "trianglecell1", for: indexPath) as! Trianglegemcell
            cell.layer.cornerRadius = 3.0
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            cell.layer.shadowRadius = 3.0;
            cell.layer.shadowOpacity = 1.0;
            cell.layer.masksToBounds = false;
            cell._imageview.image = triangularImages[indexPath.item]
            cell._nameofgem.text = tiangulargemsNames[indexPath.item]
            return cell
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1{
           whichTriangularGem = indexPath.item
        }
    }
}
var whichTriangularGem:Int = 0
class triangleDetail:UIViewController{
    @IBOutlet weak var _textView: UITextView!
    
    var triangularGemsInfo = [""]
    override func viewDidLoad() {
        super.viewDidLoad()
        triangularGemsInfo = ["Ideally suited for people born in Zodiac signs ruled by Jupiter i.e., Sagittarius and Pisces, the Golden Topaz is also recommended as a lucky gem of Scorpio and Aries. Benefits: An effective gem, which almost acts as a mental tonic, the Golden Topaz confers dignity and nobility of character. One gets innovative ideas by wearing this gem, and learns to control anger and also turning one's energies positively. Who should wear it? Ideally suited for people born in Zodiac signs ruled by Jupiter i.e., Sagittarius and Pisces, the Golden Topaz is also recommended as a lucky gem of Scorpio and Aries. Quality : Premium<br><br>Weight : 11.25 Ratti Rs. 2100.00<br>Weight : 21.00 Ratti Rs. 4200.00","Triangular Lemon Topaz are known to have special powers of healing and energising us. Gems of this shape when worn as pendants have more than normal effect and they do not loose there power when they are worn for long periods. There aura instead of weakning gets stronger and stronger. Wear these to get special benefits in your life. They come with Govt. Certificate and quality which comes with our 24 years of experience.<br><br>Weight : 11.25 Ratti Rs. 2100.00<br>Weight : 21.00 Ratti Rs. 4200.00<br>","Violet-purple in colour, Amethyst is one gemstone with an excellent lustre and transparency. Found in a number of cuts like oval, drop mixed cuts, step cuts, the distribution of colour in striking patches, and bands is characteristic. In case of Amethyst, when you see it with a lens, you will see inclusions and a series of discontinuous wavy parallel lines. Benefits: It is traditionally considered, a great help, in getting rid of intoxication. It is even said that if you drink wine in a cup made of Amethyst, it will loose its intoxicating effect. This stone is believed to heal females suffering from gynecological problems. Also widely used by people involved in occult sciences, as it is said to have impart strong spiritual powers. Who should wear it? The Greeks believed that use of this gem gave un-ending love and affection. Amethyst is a birthstone of people born in February but others may also wear it. This gem is useful in controlling one's tendency of getting distracted, switching so often from one activity to the other. Since it brings about financial stability, it is of great help to those who find it difficult to manage their financial affairs. <br><br>Weight : 11.25 Ratti Rs. 2100.00<br>Weight : 21.00 Ratti Rs. 4200.00<br>","Triangular Rose quartz is one of the most desirable varieties of quartz. The pink to rose red color is completely unique, unlike any other pink mineral species. The color is caused by iron and titanium impurities. Rose quartz is used as an ornamental stone and as a gemstone. Rose quartz is found in Madagascar, India, Germany and several localities in the USA. Much rose quartz was extracted from a famous site near Custer, South Dakota, but now, most of the worlds supply of good carvable rose quartz comes from Brazil. Brazil is also the only source of true well formed crystals of rose quartz. If rutile needles are present in the rose quartz then a star effect or asterism is sometimes seen. The star is best seen when light is viewed through the rose quartz. Pink quartz (rose quartz) allows you to be in touch with your basic self. It will allow you to get to know your true self and to love that true self in all its beauty. It can also allow you to communicate internally with your spirit guides, which means you may or may not be aware of them but they are teaching you all the same. Rose Quartz is a good stone for someone who has trouble loving themselves or accepting love from another because they do not believe that they are worthy of being loved. Opens Heart Chakra Rose quartz is the most powerful for dealing with affairs of the heart. It opens up the heart for both giving and receiving love. It soothes negative influences. This stone is good for dealing with issues on an emotional level. A stone from the heart and for the heart. It helps one to be able to love themselves. A good stone for dealing with a \"broken heart.\" The rose quartz is also good for helping one to release childhood traumas, neglect, lack of love, self-esteem. The best stone for opening the 4th chakra.<br><br>Weight : 11.25 Ratti Rs. 2100.00<br>Weight : 21.00 Ratti Rs. 4200.00<br>","Green Florite is a very beautiful Gemstone. Green in colour it is an excellent substitute of Emerald and a Gem Stone of planet Mercury and Ganesha. It is said to bring wealth and serinity. It calms the nervous system, reduces the anxiety and improves the communicaation skills of the wearer. Green Florite can improve the confidence level of the person also.<br><br>Weight : 11.25 Ratti Rs. 2100.00<br>Weight : 21.00 Ratti Rs. 4200.00<br>","A brilliant Gem of smoky colour used extensively to ward off evil spirits, Smoky Topaz is especially useful for people facing unfulfilled love. Besides giving one success in love, it is said to protect the wearer from depressions and sleeplessness. Benefits: It has great spiritual, medicinal and super natural power that holds the faith of many and is of immense use to people interested in occult. Also useful in healing eye infections, eye sores, stomach ailments, stomach ulcers, throat infections, giddiness and blood poisoning. Who should wear it? This is a highly recommended colour for research scholars and those who want to acquire a flair for creativity.<br><br>Weight : 11.25 Ratti Rs. 2100.00<br>Weight : 21.00 Ratti Rs. 4200.00<br>","Hard, tough and durable, Onyx is ideal for carving and engraving or fashioning into beads, spheres and bowls, making paper weights, pen holders, book ends and boxes. Used in inexpensive jewellery Onyx is also used for stone inlay work. With its consecutive layers of different colours, it makes excellent material for cameos and some variegated pieces are used for the carving of multi-coloured figurines. Benefits: Used instead of Emerald, Onyx gives good comprehension power and the power to deeply analyse a situation before reacting to it. Mostly used by astrologers to give better business acumen and management skills. Who should wear it? People interested in politics should use it. It restores confidence in life and love. And though it comes in different shades like red, blue, green, yellow, black and white, but astrologically the best suited for wearing, as a ring stone is green onyx. <br><br>Weight : 11.25 Ratti Rs. 2100.00<br>Weight : 21.00 Ratti Rs. 4200.00<br>","White Quartz is a plain white stone, which lacks a bit in luster but makes up for it in its extreme clarity; it also gives out a unique shine. Benefits: It has a cooling and soothing effect on one who's both looking on and wearing it. If worn in such a way that it touches the skin then it cools down the person and gives him inner peace. s Who should wear it? This gem has the highest occult power and is used extensively by Sadhus and other people who want to get special heavenly powers. It is useful in combating stress-related problems if worn in 50 ct. plus sizes.<br><br>Weight : 11.25 Ratti Rs. 2100.00<br>Weight : 21.00 Ratti Rs. 4200.00<br>"]
_textView.attributedText = triangularGemsInfo[whichTriangularGem].convertHtml()
        _textView.font = UIFont.systemFont(ofSize: 20)
    }
}

class Trianglegemcell:UICollectionViewCell{
    @IBOutlet weak var _imageview: UIImageView!
    @IBOutlet weak var _nameofgem: UILabel!
    @IBOutlet weak var _bigLabel: UILabel!
    }



