//
//  HomeStonesDetailed.swift
//  GemSelection
//
//  Created by abhishek chaudhary on 17/01/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit
import DropDown
var whichDetailedStone:Int = 1
class HomeStonesDetailed: UITableViewController {
    @IBOutlet var _priceView: UIView!
    @IBOutlet weak var _textViewDetail: UITextView!
    @IBAction func closeBtn(_ sender: Any) {
        aView.removeFromSuperview()
    }
    let dropDownType = DropDown() ; let dropDownQuantityPrice = DropDown() ; let dropDownQuantityPrice2 = DropDown() ;//let dropDownSubQuantityPrice = DropDown() ;
    let aView = UIView()
    let homeData = HomeData()
    let pannaHomeData = HomePannaStoneData() ; let pukhrajHomeData = HomePukhrajStoneData(); let rubyHomeData = HomeRubyStoneData();let neelamHomeData = NeelamHomeData()
    var whichSubStone:Int = 0 ; var whichSubQuality:Int = 0 ; var whichSubQuality2:Int = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        aView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        aView.backgroundColor = UIColor.black.withAlphaComponent(0.4) ;  _priceView.center = self.view.center
        _priceView.layer.cornerRadius = 5.0
        aView.addSubview(_priceView)
        self._textViewDetail.font = UIFont.systemFont(ofSize: 18)
        if whichDetailedStone == 1 {
            dropDownType.dataSource = pannaHomeData.pannaStones
        }
        if whichDetailedStone == 2 {
            dropDownType.dataSource = pukhrajHomeData.pukhrajTypes
        }
        if whichDetailedStone == 3 {
            dropDownType.dataSource = rubyHomeData.rubyTypes
        }
        if whichDetailedStone == 4 {
            dropDownType.dataSource = neelamHomeData.neelamTypes
        }
        dropDownType.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.whichSubStone = index
            let indexxx = IndexPath(row: 1, section: 0)
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: indexxx, at: .top, animated: true)
            
            }
        dropDownQuantityPrice.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.whichSubQuality = index
            self.tableView.reloadData()
            if whichDetailedStone == 1 {
                self._textViewDetail.text = self.pannaHomeData.emerald_quantities[index]
            }
            if whichDetailedStone == 2{
                self._textViewDetail.text = self.pukhrajHomeData.ceylonPukhrajQuantities[index]
            }
            if whichDetailedStone == 3{
                self._textViewDetail.text = self.rubyHomeData.rubyQuantities1[index]
            }
            if whichDetailedStone == 4{
                self._textViewDetail.text = self.neelamHomeData.neelamQuantity1[index]
            }
            self.dropDownQuantityPrice.hide()
            UIApplication.shared.keyWindow?.addSubview(self.aView)
            }
        dropDownQuantityPrice2.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.whichSubQuality2 = index
            if whichDetailedStone == 2{
                self._textViewDetail.text = self.pukhrajHomeData.bangkokPukhrajQuantities[index]
            }
            if whichDetailedStone == 3{
                self._textViewDetail.text = self.rubyHomeData.rubyQuantities2[index]
            }
            if whichDetailedStone == 4{
                self._textViewDetail.text = self.neelamHomeData.neelamQuantity2[index]
            }
            self.dropDownQuantityPrice2.hide()
             UIApplication.shared.keyWindow?.addSubview(self.aView)
        }
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 240
}
    
    override func viewWillAppear(_ animated: Bool) {
        switch whichDetailedStone {
        case 1:
            dropDownQuantityPrice.dataSource = pannaHomeData.pannaStonesQualities
        case 2:
            dropDownQuantityPrice.dataSource = pukhrajHomeData.ceylonPukhrajQuantitiesName
            dropDownQuantityPrice2.dataSource = pukhrajHomeData.bangkokPukhrajQuantitiesName
        case 3:
            dropDownQuantityPrice.dataSource = rubyHomeData.rubyquatitiesName1
            dropDownQuantityPrice2.dataSource = rubyHomeData.rubyquatitiesName2
        case 4:
            dropDownQuantityPrice.dataSource = neelamHomeData.neelamQuantityNames1
            dropDownQuantityPrice2.dataSource = neelamHomeData.neelamQuantityNames2
        default:
            return
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        whichSubStone = 0 ; whichSubQuality = 0; whichSubQuality2 = 0
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func showDropDownType(){
        dropDownType.show()
    }
    func showDropDownQuantity(){
        dropDownQuantityPrice.show()
    }
    func showDropDownQuantity2(){
        dropDownQuantityPrice2.show()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
             let cell = tableView.dequeueReusableCell(withIdentifier: "webcellsd", for: indexPath) as!webRowinStoneDetailed
            cell._textFieldtype.layer.borderWidth = 1.0 ; cell._textFieldtype.layer.borderColor = UIColor.red.cgColor
            cell._textFieldQuantity.layer.borderWidth = 1.0 ; cell._textFieldQuantity.layer.borderColor = UIColor.red.cgColor
            cell._textFieldQuantity.layer.cornerRadius = 5.0 ; cell._textFieldtype.layer.cornerRadius = 5.0
            cell._textFieldQuantity2.layer.borderWidth = 1.0 ; cell._textFieldQuantity2.layer.borderColor = UIColor.red.cgColor
            cell._textFieldQuantity2.layer.cornerRadius = 5.0 ; cell._textFieldQuantity2.layer.cornerRadius = 5.0
           
            let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            cell._textFieldtype.inputView = dummyView ; cell._textFieldQuantity.inputView = dummyView
            cell._textFieldQuantity2.inputView = dummyView
            dropDownType.anchorView = cell._textFieldtype
            dropDownQuantityPrice.anchorView = cell._textFieldQuantity ;dropDownQuantityPrice2.anchorView = cell._textFieldQuantity2
            cell._textFieldtype.addTarget(self, action: #selector(showDropDownType), for: .allEditingEvents)
            cell._textFieldQuantity.addTarget(self, action: #selector(showDropDownQuantity), for: .allTouchEvents)
            cell._textFieldQuantity2.addTarget(self, action: #selector(showDropDownQuantity2), for: .allEvents)
            cell._imageView.image = homeData.stoneImages[whichDetailedStone]
            cell._labelTitle.text = homeData.stoneNamesUpper[whichDetailedStone]
if whichDetailedStone == 1{
    cell._labelType.text = "Types of Emeralds:" ; cell._labelType.font = UIFont.italicSystemFont(ofSize: 15)
    cell._labelQuantity.text = "Select Quantity to know price"; cell._labelQuantity.font = UIFont.italicSystemFont(ofSize: 15)
            cell._textFieldtype.text = pannaHomeData.pannaStones[whichSubStone]
            cell._textFieldQuantity.text = pannaHomeData.pannaStonesQualities[whichSubQuality]
            cell._labelTitle.textColor = UIColor.green
    cell._webView.loadHTMLString("<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KC4t6RbeB9Y\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
    cell._labelQuantity2.isHidden = true ; cell._textFieldQuantity2.isHidden = true
}
if whichDetailedStone == 2{
    cell._labelType.text = "Types of Pukhraj:" ; cell._labelType.font = UIFont.italicSystemFont(ofSize: 15)
    cell._labelQuantity.text = "1.SEYLON PUKHRAj:"
    cell._labelQuantity2.text = "2.BANGKOK PUKHRAJ:"
    cell._webView.loadHTMLString("<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KC4t6RbeB9Y\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
   cell._textFieldtype.text = pukhrajHomeData.pukhrajTypes[whichSubStone]
   cell._textFieldQuantity.text = pukhrajHomeData.ceylonPukhrajQuantitiesName[whichSubQuality]
    cell._textFieldQuantity2.text = pukhrajHomeData.bangkokPukhrajQuantitiesName[whichSubQuality2]
    
}
if whichDetailedStone == 3{
                cell._labelType.text = "Types of Rubies:" ; cell._labelType.font = UIFont.italicSystemFont(ofSize: 15)
                cell._labelQuantity.text = "1.NON - HEATED MANIK:"
                cell._labelQuantity2.text = "2.HEATED MANIK:"
                cell._webView.loadHTMLString("<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KC4t6RbeB9Y\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
                cell._textFieldtype.text = rubyHomeData.rubyTypes[whichSubStone]
                cell._textFieldQuantity.text = rubyHomeData.rubyquatitiesName1[whichSubQuality]
                cell._textFieldQuantity2.text = rubyHomeData.rubyquatitiesName2[whichSubQuality2]
                
            }
if whichDetailedStone == 4{
                cell._labelType.text = "Types of Neelam:" ; cell._labelType.font = UIFont.italicSystemFont(ofSize: 15)
                cell._labelQuantity.text = "1.CEYLON NEELAM:"
                cell._labelQuantity2.text = "2.BANGKOK NEELAM:"
                cell._webView.loadHTMLString("<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KC4t6RbeB9Y\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
                cell._textFieldtype.text = neelamHomeData.neelamTypes[whichSubStone]
                cell._textFieldQuantity.text = neelamHomeData.neelamQuantityNames1[whichSubQuality]
                cell._textFieldQuantity2.text = neelamHomeData.neelamQuantityNames2[whichSubQuality2]
                
            }
            
            return cell
            
}
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "textcellsd", for: indexPath) as! detailTextrowinStoneDetailed
            
   if whichDetailedStone == 1{
            if (whichSubStone == 0){
            cell._labelDetailAbout.text = pannaHomeData.aboutPannaStone[0]
            cell._imageViewofselectedType.isHidden = true
            }
            if (whichSubStone == 1){
                cell._labelDetailAbout.text = pannaHomeData.emeraldCabochon[0]
                cell._imageViewofselectedType.isHidden = true
            }
            if (whichSubStone == 2){
                cell._labelDetailAbout.text = pannaHomeData.zambianEmerald[0]
                cell._imageViewofselectedType.image = pannaHomeData.pannaSubStonesImages[whichSubStone]
                cell._imageViewofselectedType.isHidden = false

            }
            if (whichSubStone == 3){
                cell._labelDetailAbout.text = pannaHomeData.columbianEmerald[0]
                cell._imageViewofselectedType.image = pannaHomeData.pannaSubStonesImages[whichSubStone]
             cell._imageViewofselectedType.isHidden = false
                
            }
            if (whichSubStone == 4){
                cell._labelDetailAbout.text = pannaHomeData.brazilianEmerald[0]
                cell._imageViewofselectedType.image = pannaHomeData.pannaSubStonesImages[whichSubStone]
                 cell._imageViewofselectedType.isHidden = false
            }
            if (whichSubStone == 5){
                cell._labelDetailAbout.text = pannaHomeData.swatEmerald[0]
                cell._imageViewofselectedType.image = pannaHomeData.pannaSubStonesImages[whichSubStone]
                 cell._imageViewofselectedType.isHidden = false
    }}
    if whichDetailedStone == 2{
        print("\naaya yha pe")
        if whichSubStone == 0{
            cell._labelDetailAbout.text = pukhrajHomeData.pukhrajInfo[0]
            cell._imageViewofselectedType.isHidden = true
        }
        if (whichSubStone == 1){
            cell._labelDetailAbout.text = pukhrajHomeData.ceylonPukhraj[0]
            cell._imageViewofselectedType.image = pukhrajHomeData.pukhrajImages[whichSubStone];            cell._imageViewofselectedType.isHidden = false
        }
        if whichSubStone == 2{
            cell._labelDetailAbout.text = pukhrajHomeData.bangkokPoukhraj[0]
            cell._imageViewofselectedType.isHidden = true
        }
        if (whichSubStone == 1){
            cell._labelDetailAbout.text = pukhrajHomeData.treatedPukhraj[0]
            cell._imageViewofselectedType.image = pukhrajHomeData.pukhrajImages[whichSubStone];            cell._imageViewofselectedType.isHidden = false
        }
    }
            if whichDetailedStone == 3{
                if whichSubStone == 0{
                    cell._labelDetailAbout.text = rubyHomeData.aboutRuby[0]
                    //cell._imageViewofselectedType.isHidden = true
                }
                if whichSubStone == 1{
                    cell._labelDetailAbout.text = rubyHomeData.indianRuby[0]
                    //cell._imageViewofselectedType.isHidden = true
                }
                if whichSubStone == 2{
                    cell._labelDetailAbout.text = rubyHomeData.africanRuby[0]
                    //cell._imageViewofselectedType.isHidden = true
                }
                if whichSubStone == 3{
                    cell._labelDetailAbout.text = rubyHomeData.newBurmaRuby[0]
                    //cell._imageViewofselectedType.isHidden = true
                }
                if whichSubStone == 4{
                    cell._labelDetailAbout.text = rubyHomeData.oldBurmaRuby[0]
                    //cell._imageViewofselectedType.isHidden = true
                }
                if whichSubStone == 5{
                  ShowWebView(urll: "http://gemselections.in/ruby-identification.htm")
                }
                
            }
            if whichDetailedStone == 4{
                if whichSubStone == 0{
                    cell._labelDetailAbout.text = neelamHomeData.neelamInfo[0]
                    //cell._imageViewofselectedType.isHidden = true
                }
                if whichSubStone == 1{
                    cell._labelDetailAbout.text = neelamHomeData.ceylonNeelam[0]
                    //cell._imageViewofselectedType.isHidden = true
                }
                if whichSubStone == 2{
                    cell._labelDetailAbout.text = neelamHomeData.bangkokNeelam[0]
                    //cell._imageViewofselectedType.isHidden = true
                }
                
            }

            return cell
        }
   
    }
    

 
}

class webRowinStoneDetailed: UITableViewCell {
    @IBOutlet weak var _imageView: UIImageView!
    @IBOutlet weak var _labelTitle: UILabel!
    @IBOutlet weak var _webView: UIWebView!
    @IBOutlet weak var _labelType: UILabel!
    @IBOutlet weak var _textFieldtype: UITextField!
    @IBOutlet weak var _labelQuantity: UILabel!
    @IBOutlet weak var _textFieldQuantity: UITextField!
    @IBOutlet weak var _labelQuantity2: UILabel!
    @IBOutlet weak var _textFieldQuantity2: UITextField!
    
}
class detailTextrowinStoneDetailed: UITableViewCell{
    @IBOutlet weak var _imageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var _imageViewofselectedType: UIImageView!
    @IBOutlet weak var _labelDetailAbout: UILabel!
    @IBOutlet weak var _textFieldSelectedQuantity: UITextField!
    
}
