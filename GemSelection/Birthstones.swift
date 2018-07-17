//
//  Birthstones.swift
//  GemSelection
//
//  Created by abhishek chaudhary on 16/01/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit
import DropDown
class Birthstones: UITableViewController {
    @IBAction func buyNow(_ sender: Any) {
        ShowWebView(urll: "https://khannagems.com/")
    }
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    lazy var birthstoneName = ["--Select a BirthStone--","Aries,","Taurus","Gemini ","Cancer ","Leo ","Virgo ","Libra    ","Scorpio ","Sagittarious      ","Capricorn      ","Aquarious      ","Pisces "]
    lazy var birthstoneMainName = ["--Select a BirthStone--","Coral Stone(Moonga)","White Sapphire(Safed Pukhraj)\n\tDiamond(Heera)","Emerald(Panna Stone)","Pearl(Moti)","Ruby(Manik)","Emerald(Panna Stone)","White Sapphire(Safed Pukhraj)\n\tDiamond(Heera)","Coral Stone(Moonga)","Yellow Sapphire(Pukhraj)","Blue Sapphire(Neelam)","Blue Sapphire(Neelam)","Yellow Sapphire(Pukhraj)"]
    lazy var birthstoneSecondaryName = ["--Select a BirthStone--","Red Onyx"," White Quartz \n\tZircon \n\t Aquamarine"," Peridot \n\t Green Amethyst \n\t Green Fluorite \n\t Green Garnet \n\t Green Tourmaline \n\t Green Onyx","Moonstone","Garnet \n\t Pink Tourmaline \n\t Rose Quartz \n\t Star Ruby","Peridot \n\t Green Amethyst \n\t Green Fluorite \n\t Green Garnet \n\t Green Tourmaline \n\t Green Onyx","White Quartz \n\tZircon \n\t Aquamarine","Red Onyx","Golden Topaz","I-olite \n\t BlackStar \n\t Blue Topaz \n\t Smoky Topaz \n\t Turquoise","I-olite \n\t BlackStar \n\t Blue Topaz \n\t Smoky Topaz \n\t Turquoise","Golden Topaz"]
    
    @IBOutlet var _detaiView: UIView!
    @IBOutlet weak var _textViewDetail: UITextView!
    @IBAction func closeBtn(_ sender: Any) {
        print("aayatha")
        aView.removeFromSuperview()
    }
    let dropDown = DropDown()
    let aView = UIView()
    var whichBirthstone:Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        aView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        aView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        aView.addSubview(_detaiView)
    dropDown.dataSource = birthstoneName
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.whichBirthstone = index
            if self.whichBirthstone != 0{
                self._textViewDetail.text = "Main Birthstone:\n\(self.birthstoneMainName[self.whichBirthstone])\n\nSubtitute Birthstone:\n\(self.birthstoneSecondaryName[self.whichBirthstone])"
                self._detaiView.layer.cornerRadius = 5.0
                self._detaiView.center = self.view.center
                self.view.addSubview(self.aView)
            }
            
            self.tableView.reloadData()
            
        }
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 271
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector
                (SWRevealViewController.rightRevealToggle(_:))
            menuBtn.action = #selector
                (SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
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
        return 1
    }
    @objc func showDropDown(){
        dropDown.show()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "birthstonecell", for: indexPath) as! RowinBirthstones
        let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        cell._textField.inputView = dummyView
        dropDown.anchorView = cell._textField
        cell._textField.addTarget(self, action: #selector(showDropDown), for: .allEditingEvents)
        cell._textField.layer.borderColor = UIColor.black.cgColor
        cell._textField.layer.borderWidth = 1.0
        cell.layer.cornerRadius = 5.0
        cell._textField.text = birthstoneName[whichBirthstone]
        cell._labelInfo.attributedText = "<h3>Buy Birthstones</h3><h1><br>Buying Birthstones is a not a very easy task for a layman as the Quality and Originality of Birthstones is something which is difficult to assess for any person who is not a trained Gemologist.<br><br>Now let us try to understand these two points in detail:<br><br>The quality of Gemstones implies the three things:<br><br>1.&nbsp&nbsp&nbsp<b>Colour:</b> The colour of a Birthstone is the most important factor. More eye pleasing and vibrant the colour of a Gemstone more is its price and simultaneously more is its effect.<br><br>2.&nbsp&nbsp&nbsp<b>Clarity:</b> The transparency is a very important factor that differentiates between a Stone and a Birthstone. To be effective a Birthstone has to be transparent so that it absorbs the cosmic rays in full strength and transfers it in the body of the wearer. More transparent the Birthstone better is its effect.<br><br>3.&nbsp&nbsp&nbsp<b>Luster:</b> Shine and a feeling as if a coloured light is emitting out of a Gemstone is a sign of Quality a Value for a Birthstone. You can feel this Green Light coming out of Emerald (Panna Stone), Red or Pinkish light emitting out of Ruby(Manik Stone), Blue light coming out of Blue Sapphire(Neelam Stone), Yellow light coming out of a Yellow Sapphire(Pukhraj Stone).<br><br>Originality of Birthstone is even more important because if the Birthstone is not original then all other factors are of nil value.<br><br>To determine weather a Birthstone is original is not possible for a lay man so the only solution available is to buy from Gem Selections, Janakpuri, New Delhi where you will get a Certificate of Originality from the Gemological Laboratory of Indian Gemological Institute, under the Ministry of Commerce, Govt. of India.</h1><br><br>".convertHtml()
        cell._labelInfo.sizeToFit()
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
            return UITableViewAutomaticDimension
        
    }
}
class RowinBirthstones: UITableViewCell {
    @IBOutlet weak var _textField: UITextField!
    @IBOutlet weak var _labelInfo: UILabel!
    
}
