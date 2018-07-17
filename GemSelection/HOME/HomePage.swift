//
//  ViewController.swift
//  GemSelection
//
//  Created by Abhishek on 25/10/17.
//  Copyright © 2017 atlas. All rights reserved.
//

import UIKit
import DropDown
import MarqueeLabel
class HomePage: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var itemWidth: CGFloat!
    var aLabel: MarqueeLabel!
    @IBAction func buyNowBtn(_ sender: Any) {
    ShowWebView(urll: "https://khannagems.com/")
    }
    @IBOutlet weak var moreBtn: UIBarButtonItem!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBAction func menuBtnAction(_ sender: Any) {
        dropDownMain.show()
    }
    let _webView = UIWebView()
    let dropDownMain = DropDown() ; let dropDownSecondary = DropDown()
    var elementSelectedInMainDropDown:Int = 0
    override func viewWillAppear(_ animated: Bool) {

    }
override func viewDidLoad() {
        super.viewDidLoad()
    
    let width = self.view.frame.width-20 ; let height = self.view.frame.height/3
    _webView.loadHTMLString("<iframe width=\"\(width)\" height=\"\(height)\" src=\"https://www.youtube.com/embed/exSOLLQKZEM\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        initialiazeDropDownMain()
        if self.revealViewController() != nil {
                        menuBtn.target = self.revealViewController()
                        menuBtn.target = self.revealViewController()
                        menuBtn.action = #selector
                            (SWRevealViewController.rightRevealToggle(_:))
                        menuBtn.action = #selector
                            (SWRevealViewController.revealToggle(_:))
                        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
                    }
        self.revealViewController().rearViewRevealWidth = 285.0
        _webView.scrollView.isScrollEnabled = false
        _webView.scrollView.showsVerticalScrollIndicator = false
        _webView.scrollView.bounces = false
        dropDownSecondary.anchorView = moreBtn
        dropDownMain.anchorView = moreBtn
    
    let collectionViewWidth = collectionView?.frame.width
    itemWidth = (collectionViewWidth! - 30)/2.0
    
    let aframe = CGRect(x: 10, y: 0, width: collectionViewWidth! - 20, height: 40)
    aLabel = MarqueeLabel.init(frame: aframe, duration: 15, andFadeLength: 10.0)
    aLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    aLabel?.text = "Gem Selections:The only Trusted Brand for Govt. Lab Certified Gemstones, Diamonds and Jewellery since 1987."
    aLabel?.textColor = UIColor.red
    aLabel?.marqueeType = .MLContinuous
    aLabel?.leadingBuffer = 30.0
    aLabel?.trailingBuffer = 20.0
    }
    
//DROP DOWN INITIALIZATION :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    let evc = Extra()
func initialiazeDropDownMain(){
        dropDownMain.dataSource = ["Govt. Lab Certificates    ▶︎", "Testimonials","About Shipment","Membership                    ▶︎","Astrology","Puja", "Frequently Asked Ques.","About                              ▶︎", "Return Policy","Exit"]
        dropDownMain.selectionAction = { [unowned self] (index: Int, item: String) in
            self.elementSelectedInMainDropDown = index
            
            if self.elementSelectedInMainDropDown == 8{
                print("return selected")
                
                let vc = ReturnPlicyViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            if self.elementSelectedInMainDropDown == 9{
                exit(0);
            }
            if self.elementSelectedInMainDropDown == 1{
                isCerti = 1 ; ship = 0
                whichCerti = 21
                self.navigationController?.pushViewController(self.evc, animated: true)
            }
            if self.elementSelectedInMainDropDown == 2 {
                ship = 1
                self.navigationController?.pushViewController(self.evc, animated: true)
                
            }
            if self.elementSelectedInMainDropDown == 4 {
                UIApplication.shared.open(URL(string: "http://www.astropankaj.com/")!, options: [:], completionHandler: nil)
            }
            if self.elementSelectedInMainDropDown == 5 {
                UIApplication.shared.open(URL(string: "http://www.vedmandirtrust.com/")!, options: [:], completionHandler: nil)
            }
            if self.elementSelectedInMainDropDown == 6{
               self.showFaq()
            }
            self.dropDownMain.hide()
            self.showDropDownSecondary();
        }
}
    func showFaq(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "faqview") as! FaqPopUp
        isfaqcomingfromHome = true 
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func showDropDownSecondary(){
        switch elementSelectedInMainDropDown {
        case 0:
            dropDownSecondary.dataSource = ["Natural Saphire","Treated Sapphire","Heated Sapphire"]
            dropDownSecondary.show()
            dropDownSecondary.selectionAction = { [unowned self] (index: Int, item: String) in
                self.dropDownSecondary.hide()
                isCerti = 1 ; ship = 0
                whichCerti = index ; self.navigationController?.pushViewController(self.evc, animated: true)
               
            }
        case 3:
            dropDownSecondary.dataSource = ["ALL INDIA MANAGEMENT ASSOCIATIONS","INDIAN DIAMOND INSTITUTE","SURAT GEMOLOGY INSTITUTE"]
            dropDownSecondary.show()
            dropDownSecondary.selectionAction = { [unowned self] (index: Int, item: String) in
                self.dropDownSecondary.hide()
                isCerti = 1 ; ship = 0
                whichCerti = index+3 ; self.navigationController?.pushViewController(self.evc, animated: true)
                
            }
        case 7:
            dropDownSecondary.dataSource = ["Anout Us","Management Team","Pankaj Khanna","©Khanna Gems Pvt. Ltd."]
            dropDownSecondary.show()
            dropDownSecondary.selectionAction = { [unowned self] (index: Int, item: String) in
                self.dropDownSecondary.hide()
                xindex = index ; isCerti = 0 ; ship = 0
                self.navigationController?.pushViewController(self.evc, animated: true)
            }
        default:
            break
        }
}
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  
let homeData = HomeData()
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return homeData.stoneNamesUpper.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath)
            _webView.frame = CGRect(x: 0, y: 40, width: cell.frame.width, height: cell.frame.height)
            
            
            
            cell.addSubview(aLabel!)
            cell.addSubview(_webView)
            return cell
        }
        else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCell
            cell.layer.cornerRadius = 3.0
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            cell.layer.shadowRadius = 3.0;
            cell.layer.shadowOpacity = 1.0;
            cell.layer.masksToBounds = false;
            cell._upperLabel.text = homeData.stoneNamesUpper[indexPath.row]
            cell._lowerLabel.text = homeData.stoneNamesLower[indexPath.row]
            cell._stoneImage.image = homeData.stoneImages[indexPath.row]
        return cell
        }
      
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            return CGSize(width: self.collectionView!.frame.width-20, height: self.view.frame.height/2.7)
        } else {
              return CGSize(width: itemWidth, height: itemWidth + 26.0)
        }
    }

     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 20
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if section == 0{
            return 0
        }else{
            return 10
        }
    }
    /*
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderCollectionReusableView
        
        //header.addSubview(aLabel!)
        
        return header
        
    }*/
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            aLabel.restart()
            print("displaying.....")
        }
    }
    
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if(section == 1) return
    }*/
    
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
           return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 10)
        } else {
            return UIEdgeInsets(top: 5, left: 10, bottom: 35, right: 10)
            
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1{
            if (indexPath.row == 11){
                let vc = storyboard?.instantiateViewController(withIdentifier: "diamondView") as! Diamond
                isDiamondcomingFromHomePage = true
               self.navigationController?.pushViewController(vc, animated: true)
            }
            if (indexPath.item == 0 || indexPath.item == 6 || indexPath.item == 7 || indexPath.item == 9 || indexPath.item == 12 || indexPath.item == 13){
                let vc = HomeStoneSingles()
                whichSingleStone = indexPath.item
                self.navigationController?.pushViewController(vc, animated: true)
            }
            if (indexPath.row == 1 || indexPath.item == 2 || indexPath.item == 3 || indexPath.item == 4){
                  whichDetailedStone = indexPath.item
                self.performSegue(withIdentifier: "detailedstonesegue", sender: self)
                
            }
        }
        
    }
    
}

class HomeCell : UICollectionViewCell{
    @IBOutlet weak var _upperLabel: UILabel!
    @IBOutlet weak var _stoneImage: UIImageView!
    @IBOutlet weak var _lowerLabel: UILabel!

}

extension String{
    func convertHtml() -> NSAttributedString{
        guard let data = data(using: .utf8) else { print("\nNhai ho paya\n"); return NSAttributedString() }
        do{
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }catch{
            print("\nbilkul nahi ho paya\n")
            return NSAttributedString()
        }
    }
}
