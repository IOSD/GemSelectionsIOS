//
//  SemiPreciousGems.swift
//  GemSelection
//
//  Created by abhishek chaudhary on 16/01/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit
import DropDown
class SemiPreciousGems: UITableViewController {

    let dropDown = DropDown()
    var whichSemipreciousGem:Int = 0 ; var semiPreciousGemsImages = [UIImage]()
    let semiPreciousGemsData = SemiPreciousGemsData()
    override func viewDidLoad() {
        super.viewDidLoad()
        dropDown.dataSource = semiPreciousGemsData.semiGemsNames
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector
                (SWRevealViewController.rightRevealToggle(_:))
            menuBtn.action = #selector
                (SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            semiPreciousGemsImages = [#imageLiteral(resourceName: "Amethist"),#imageLiteral(resourceName: "Aquamarine"),#imageLiteral(resourceName: "Black-Onyx-Cabochun"),#imageLiteral(resourceName: "Black-Onyx-cut"),#imageLiteral(resourceName: "Black-Rainbow"),#imageLiteral(resourceName: "Black-Star"),#imageLiteral(resourceName: "Blue-Topaz"),#imageLiteral(resourceName: "Aquamarine"),#imageLiteral(resourceName: "Aquamarine"),#imageLiteral(resourceName: "Aquamarine"),#imageLiteral(resourceName: "Aquamarine"),#imageLiteral(resourceName: "Aquamarine"),#imageLiteral(resourceName: "Garnet"),#imageLiteral(resourceName: "Golden-Topaz"),#imageLiteral(resourceName: "Green-Amethys"),#imageLiteral(resourceName: "Green-Flourite"),#imageLiteral(resourceName: "Green-Garnet"),#imageLiteral(resourceName: "Green-Garnet"),#imageLiteral(resourceName: "green-sapphire"),#imageLiteral(resourceName: "I-Olite"),#imageLiteral(resourceName: "Jade"),#imageLiteral(resourceName: "Jade"),#imageLiteral(resourceName: "Jade"),#imageLiteral(resourceName: "Jade"),#imageLiteral(resourceName: "Labrolite"),#imageLiteral(resourceName: "Labrolite"),#imageLiteral(resourceName: "Labrolite"),#imageLiteral(resourceName: "Lemon-Topaz"),#imageLiteral(resourceName: "Malachite"),#imageLiteral(resourceName: "Moon-Stone"),#imageLiteral(resourceName: "Opal"),#imageLiteral(resourceName: "Onyx"),#imageLiteral(resourceName: "Periodot"),#imageLiteral(resourceName: "Pink-Tourmaline"),#imageLiteral(resourceName: "Red-Onyx-Cabochun"),#imageLiteral(resourceName: "Red-Onyx-cut"),#imageLiteral(resourceName: "rhodolite-garnet"),#imageLiteral(resourceName: "Rose-Quartz"),#imageLiteral(resourceName: "Rose-Quartz"),#imageLiteral(resourceName: "Star-Ruby"),#imageLiteral(resourceName: "Golden-Topaz"),#imageLiteral(resourceName: "Golden-Topaz"),#imageLiteral(resourceName: "Golden-Topaz"),#imageLiteral(resourceName: "Tiger's-Eye-Stone"),#imageLiteral(resourceName: "Tiger's-Eye-Stone"),#imageLiteral(resourceName: "Turquoise"),#imageLiteral(resourceName: "Turquoise"),#imageLiteral(resourceName: "White-Coral"),#imageLiteral(resourceName: "White-Quartz-gemstone"),#imageLiteral(resourceName: "White-Rainbow"),#imageLiteral(resourceName: "White-topaz"),#imageLiteral(resourceName: "Zircon")]
        }
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.whichSemipreciousGem = index
            self.tableView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }

    @IBAction func buyNow(_ sender: Any) {
        ShowWebView(urll: "https://khannagems.com/")
    }
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func showDropDown(){
        dropDown.show()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "semigem", for: indexPath) as! detailOfSemiGem
        
        if whichSemipreciousGem == 45 || whichSemipreciousGem > 45 {
            let semidata2 = SemiPreciousGemsData2()
            cell._labelDetail.attributedText = semidata2.semiGemsDetail[whichSemipreciousGem-45].convertHtml()
            cell._textField.text = semiPreciousGemsData.semiGemsNames[whichSemipreciousGem]
        }
        else {
            cell._labelDetail.attributedText = semiPreciousGemsData.semiGemsDetail[whichSemipreciousGem].convertHtml()
            cell._textField.text = semiPreciousGemsData.semiGemsNames[whichSemipreciousGem]
        }
        cell._imageView.image = semiPreciousGemsImages[whichSemipreciousGem]
        cell._labelDetail.sizeToFit()
        cell._labelDetail.font = UIFont.systemFont(ofSize: 18)
        let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        cell._textField.inputView = dummyView
        dropDown.anchorView = cell._textField
        cell._textField.addTarget(self, action: #selector(showDropDown), for: .allEditingEvents)
        cell._textField.layer.borderColor = UIColor.red.cgColor
        cell._textField.layer.borderWidth = 1.0
        cell.layer.cornerRadius = 5.0
        let ww = cell._webView.frame.width ; let hh = cell._webView.frame.height
        if whichSemipreciousGem == 0 {
              cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/NkrqeqeUGdM\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        if whichSemipreciousGem == 1{
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/UPWJJumif4w\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        if whichSemipreciousGem == 5{
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/y4q_CChLywg\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        if whichSemipreciousGem == 6{
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/BknFcudGqWE\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        if whichSemipreciousGem == 8{
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/XiLaSiRumaY\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        if whichSemipreciousGem == 9{
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/J1_vW8ub-9g\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        if whichSemipreciousGem == 10{
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/7Myza1JK-ms\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        if whichSemipreciousGem == 11{
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/v6M6RVLCpi0\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        if whichSemipreciousGem == 12{
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/vWQMGTq9rSY\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        if whichSemipreciousGem == 14{
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/JYfyALad9iw\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        if whichSemipreciousGem == 15{
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/Rw-nOGY-rfU\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        if whichSemipreciousGem == 17{
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/8HyDrOy77Dk\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        if whichSemipreciousGem == 19{
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/H5GydSqT6QM\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        if whichSemipreciousGem == 24{
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/7xAExMW18qk\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        if whichSemipreciousGem == 26{
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/3ozHGflxdec\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        if whichSemipreciousGem == 28{
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/picN1x9lt3Q\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        if whichSemipreciousGem == 49{
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/JJDF54uYVdE\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        if whichSemipreciousGem == 48{
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/unB5xMpN2Vc\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        else {
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/UPWJJumif4w\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", baseURL: nil)
        }
        return cell
    }
    

}
class detailOfSemiGem: UITableViewCell{
    @IBOutlet weak var _labelDetail: UILabel!
    @IBOutlet weak var _textField: UITextField!
    @IBOutlet weak var _webView: UIWebView!
    @IBOutlet weak var _imageView: UIImageView!
    
}

