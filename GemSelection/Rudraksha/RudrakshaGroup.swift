

import UIKit
//rudrakshaHome::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
class rudrakshahomecell: UITableViewCell{
    
    @IBOutlet weak var webView: UIWebView!
    
}
class RudrakshaHome: UITableViewController {
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    @IBAction func buyBtn(_ sender: Any) {
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

  

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "singlecell", for: indexPath) as! rudrakshahomecell
        cell.webView.loadHTMLString("<iframe width=\"\(cell.webView.frame.size.width)\" height=\"\(cell.webView.frame.size.height)\" src=\"https://www.youtube.com/embed//Qd1hHh_vEkA\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)

        cell.webView.scrollView.isScrollEnabled = false
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1500
    }
    
}




//rudrakshaBeads:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

class RBwebviewcell: UITableViewCell {
    @IBOutlet weak var webview: UIWebView!
    
}

class RBcells: UITableViewCell {
    @IBOutlet weak var upperlabel1: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var lowerlabel1: UILabel!
    @IBOutlet weak var upperlabel2: UILabel!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var lowerlabel2: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
}

class RudrakashBeadsView: UITableViewController {
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    @IBAction func buyBtn(_ sender: Any) {
        ShowWebView(urll: "https://khannagems.com/")
  
        
    }
    var beadimages = [#imageLiteral(resourceName: "One-mukhi-rudraksha-2"),#imageLiteral(resourceName: "two-mukhi-rudraksha"),#imageLiteral(resourceName: "three-mukhi-rudraksha"),#imageLiteral(resourceName: "four-mukhi-rudraksha"),#imageLiteral(resourceName: "five-mukhi-rudraksha"),#imageLiteral(resourceName: "six-mukhi-rudraksha"),#imageLiteral(resourceName: "seven-mukhi-rudraksha"),#imageLiteral(resourceName: "eight-mukhi-rudraksha"),#imageLiteral(resourceName: "nine-mukhi-rudraksha"),#imageLiteral(resourceName: "ten-mukhi-rudraksha"),#imageLiteral(resourceName: "eleven-mukhi-rudraksha"),#imageLiteral(resourceName: "twelve-mukhi-rudraksha"),#imageLiteral(resourceName: "thirteen-mukhi-rudraksha"),#imageLiteral(resourceName: "fourteen-mukhi-rudraksha"),#imageLiteral(resourceName: "fifteen-mukhi-rudraksha"),#imageLiteral(resourceName: "fifteen-mukhi-rudraksha"),#imageLiteral(resourceName: "seventeen-mukhi-rudraksha"),#imageLiteral(resourceName: "eighteen-mukhi-rudraksha"),#imageLiteral(resourceName: "nineteen-mukhi-rudraksha"),#imageLiteral(resourceName: "twenty-mukhi-rudraksha"),#imageLiteral(resourceName: "twentyone-mukhi-rudraksha"),#imageLiteral(resourceName: "twentyone-mukhi-rudraksha"),#imageLiteral(resourceName: "ganesh-rudraksha"),#imageLiteral(resourceName: "gauri-shanker-rudraksha")]
    var upperlabel = ["ONE MUKHI","TWO MUKHI","THREE MUKHI","FOUR MUKHI","FIVE MUKHI","SIX MUKHI","SEVEN MUKHI","EIGHT MUKHI","NINE MUKHI","TEN MUKHI","ELEVEN MUKHI","TWELVE MUKHI","THIRTEEN MUKHI","FOURTEEN MUKHI","FIFTEEN MUKHI","SIXTEEN MUKHI","SEVENTEEN MUKHI","EIGHTEEN MUKHI","NINETEEN MUKHI","TWENTY MUKHI","TWENTY ONE MUKHI","TRIJUTI","GANESH","GAURI SHANKAR"]

    var videos = [""]
    
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
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else{
            return 12
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

    
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "webviewrow", for: indexPath) as! RBwebviewcell
            let height = cell.webview.frame.size.height; let width = cell.frame.size.width-10
            cell.webview.loadHTMLString("<iframe width=\"\(width)\" height=\"\(height)\" src=\"https://www.youtube.com/embed/exSOLLQKZEM\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
            cell.webview.scrollView.isScrollEnabled = false
            cell.webview.scrollView.bounces = false
             return cell
                }
        
        else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "beadrow", for: indexPath) as! RBcells
                    cell.upperlabel1.text = upperlabel[indexPath.row+indexPath.row]
                    cell.upperlabel2.text = upperlabel[indexPath.row+indexPath.row+1]
                    cell.image1.image = beadimages[indexPath.row+indexPath.row]
                    cell.image2.image = beadimages[indexPath.row+indexPath.row+1]
            whichrow = indexPath.row
            return cell
    }
    }
    var whichrow = 1
    
    func showVideo(){
        
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 243
        }
        else{
            return 270
            
        }
    }
 
}

//rudrakshaMala:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

class RudrakshaMala: UITableViewController{
    @IBAction func buyBtn(_ sender: Any) {
        ShowWebView(urll: "https://khannagems.com/")
     
        
    }
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "malacell", for: indexPath)
        return cell
    }

    
}
    
//rudrakshaBracelets:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

class RudrakshBraceletCell: UITableViewCell {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var imageview1: UIImageView!
    @IBOutlet weak var imageview2: UIImageView!
    
}

class RudrakshaBracelet: UITableViewController{
    
    @IBAction func buyBtn(_ sender: Any) {
        ShowWebView(urll: "https://khannagems.com/")
 
        
    }
    var braceltimages = [#imageLiteral(resourceName: "rudrakshabracelet"),#imageLiteral(resourceName: "rudraksha-bracelet1"),#imageLiteral(resourceName: "rudraksha-pearl-bracelet"),#imageLiteral(resourceName: "seven-mukhi-rudraksha-bracelet")]
    var braceletlabels = ["RUDRAKSHA BRACELET","TWO MUKHI RUDRAKSHA BRACELET","THREE MUKHI RUDRAKSHA BRACELET","PEARL AND RUDRAKSHA COMBINATION"]
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else{
            return 2
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var finalcell = UITableViewCell()
        if indexPath.section ==  0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "1strow", for: indexPath)
            finalcell = cell
        }
            
        if(indexPath.section == 1){
           
            let cell = tableView.dequeueReusableCell(withIdentifier: "braceletimagerow", for: indexPath) as! RudrakshBraceletCell
                    cell.imageview1.image = braceltimages[indexPath.row+indexPath.row]
                                cell.imageview2.image = braceltimages[indexPath.row+indexPath.row+1]
                    cell.label1.text = braceletlabels[indexPath.row+indexPath.row]
                    cell.label1.text = braceletlabels[indexPath.row+indexPath.row+1]
                finalcell = cell
        }
    return finalcell
    
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 44
        }
        else{
            return 270
        }
    }

}


//rudrakshaYugal:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

class RudrakshaYugal: UITableViewController{
    @IBAction func buyBtn(_ sender: Any) {
        ShowWebView(urll: "https://khannagems.com/")
        
        
    }
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "singlecell", for: indexPath)
        return cell
    }
    
    
}
