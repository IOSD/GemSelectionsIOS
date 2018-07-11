//
//  ReturnPlicyViewController.swift
//  GemSelection
//
//  Created by Bhavin on 05/06/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit
import WebKit

class ReturnPlicyViewController: UIViewController, WKUIDelegate{

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var policyLabel: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Return Policy"
        
        let myURL = URL(string: "https:/www.youtube.com/embed/RyxQ1DsK4Kg")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)

        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
