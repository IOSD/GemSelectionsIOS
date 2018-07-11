//
//  GemstoneAstrology.swift
//  GemSelection
//
//  Created by abhishek chaudhary on 14/01/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit

class GemstoneAstrology: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
    }

  

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "webroww", for: indexPath) as! WebRowinAstrology
            let hh = cell._webView.frame.height ; let ww = cell._webView.frame.width
            cell._webView.loadHTMLString("<iframe width=\"\(ww)\" height=\"\(hh)\" src=\"https://www.youtube.com/embed/TByLvRR0oLk\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "textroww", for: indexPath) as! TextRowinAstrology
            cell._label.text = ""
            cell._label.sizeToFit()
                        return cell
            
        }
      
    }
 

    
}

class WebRowinAstrology:UITableViewCell{
    @IBOutlet weak var _webView: UIWebView!
    
}
class TextRowinAstrology:UITableViewCell{
    @IBOutlet weak var _label: UILabel!
    
}
