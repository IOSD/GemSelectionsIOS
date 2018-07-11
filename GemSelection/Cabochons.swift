//
//  Cabochons.swift
//  GemSelection
//
//  Created by abhishek chaudhary on 16/01/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit
import DropDown
class Cabochons: UITableViewController {
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBAction func buyNow(_ sender: Any) {
        ShowWebView(urll: "https://khannagems.com/")
    }
    var cabochonNames = [" Ruby Cabochon"," Emerald Cabochon"," Blue Sapphire Cabochon"]
    var cabochondetails = ["Ruby Cabochons are available from 5Rt to 41Rt sizes. Prices vary from 550/Rt to 11000/Rt as per the quality of the Gemstones. ","Emerald Cabochons are available from 5Rt to 41Rt sizes. Prices vary from 550/Rt to 11000/Rt as per the quality of the Gemstones."," Blue Sapphire Cabochons are available from 5Rt to 41Rt sizes. Prices vary from 550/Rt to 11000/Rt as per the quality of the Gemstones."]
    var caboconWebLinks = ["<iframe width=\"350\" height=\"169\" src=\"https://www.youtube.com/embed/9y4KM5FflE8\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>","","<iframe width=\"350\" height=\"169\" src=\"https://www.youtube.com/embed/9gKJXyLSBp4\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"]
    var caboconImages = [#imageLiteral(resourceName: "ruby-cabochon"),#imageLiteral(resourceName: "emerald-cabochon"),#imageLiteral(resourceName: "blue-sapphire-cabochon")]

     var whichStone:Int = 0
    let dropDown = DropDown()
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
        dropDown.dataSource = [" Ruby Cabochon"," Emerald Cabochon"," Blue Sapphire Cabochon"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            self.whichStone = index
            self.tableView.reloadData()
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
        return 2
    }
    func showDropDown(){
        dropDown.show()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "selectioncell", for: indexPath) as! SelectionRowcabo
            let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            cell._textFieldSelection.inputView = dummyView
            dropDown.anchorView = cell._textFieldSelection
            cell._textFieldSelection.addTarget(self, action: #selector(showDropDown), for: .allEditingEvents)
            cell._textFieldSelection.layer.borderColor = UIColor.black.cgColor
            cell._textFieldSelection.layer.borderWidth = 1.0
            cell.layer.cornerRadius = 5.0
            cell._textFieldSelection.text = cabochonNames[whichStone]
              return cell
        } else {
          
            let cell = tableView.dequeueReusableCell(withIdentifier: "webviewcobococel", for: indexPath) as! WebViewinCabo
         
            cell._label.text = cabochondetails[whichStone]
            cell._imageVIew.image = caboconImages[whichStone]
            cell._webView.loadHTMLString(caboconWebLinks[whichStone], baseURL: nil)
            return cell
        }
    }
    
   
    
   
}

    class SelectionRowcabo: UITableViewCell {
        @IBOutlet weak var _textFieldSelection: UITextField!
        
}

    class WebViewinCabo:UITableViewCell{
        @IBOutlet weak var _imageVIew: UIImageView!
        @IBOutlet weak var _label: UILabel!
        @IBOutlet weak var _webView: UIWebView!
        
}
