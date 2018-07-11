//
//  Diamond+Gem-Tudded.swift
//  GemSelection
//
//  Created by abhishek chaudhary on 20/01/18.
//  Copyright © 2018 atlas. All rights reserved.
//
import Foundation
import UIKit
import Firebase
import SDWebImage
var ImageCounts = [Int]();var Prefixes = [""];var internalTypes = [""];var ActualNumberOfImages = [Int]()
var whichJwellery:Int = 1
class Diamond_Gem_Tudded: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var diamondTypes = ["Diamond Sets","Diamond Pendannts","Diamond Tops","Diamond Rings","Diamond Bracelets","Diamond Nose Pins","Diamond Studs"]
    var gemJwelleryTypes = ["Gem-Studded Sets","Gem-Studded Pendants","Gem-Studded Tops","Gem-Studded Rings","Gem-Studded Bracelets"]
    @IBOutlet weak var _webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(whichJwellery) == whichJwellery")
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if whichJwellery == 1 {
            return diamondTypes.count
        }
       
        else{
            return gemJwelleryTypes.count
        }
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell = tableView.dequeueReusableCell(withIdentifier: "subcell", for: indexPath)
         if whichJwellery == 1 {
            cell.textLabel?.text = diamondTypes[indexPath.row]
            return cell
        }
         /*if whichJwellery == 3*/else {
            cell.textLabel?.text = gemJwelleryTypes[indexPath.row]
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        whichDiamondToShow = indexPath.row
    }
    
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var whichDiamondToShow:Int = 0
class CollectionViewForDiamodAndJwellery: UICollectionViewController{
let notificationNme = NSNotification.Name("NotificationIdf")
    let aView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        aView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        aView.backgroundColor = UIColor.white
        NotificationCenter.default.addObserver(self, selector: #selector(checkDB), name: notificationNme, object: nil)
  
    }
    let activity = UIActivityIndicatorView();var currentImages = [UIImage]()
    func checkDB(){
        if currentImages.count == ActualNumberOfImages[whichDiamondToShow]
        {
         activity.removeFromSuperview()
            self.collectionView?.reloadData()
            self.collectionView?.isUserInteractionEnabled = true
            aView.removeFromSuperview()
        }
    }
    var kisme = ["diamond","","gem-studded"]
    override func viewWillAppear(_ animated: Bool) {
        if whichJwellery == 1 {
            ActualNumberOfImages = [80,58,49,95,37,21,26]
            ImageCounts = [80,93,77,95,39,21,34]
            Prefixes = ["DJS 7129","DP 3981","DJT 5310","DR 214","DB 98","DNS 871","DSS 1009"]
            internalTypes = ["set","pendant","tops","rings","bracelet","nosepin","studds"]
        }
        if whichJwellery == 2 {
            whichDiamondToShow = 0
            ActualNumberOfImages = [135]
            ImageCounts = [135]
            Prefixes = ["VJ 9346"]
            internalTypes = ["victorian"]
        }
        if whichJwellery == 3{
            ActualNumberOfImages = [53,36,52,74,36]
            ImageCounts = [53,41,99,89,36]
            Prefixes = ["GSJS 1649","GSP3192","GSE 5983"," GSR 2318","GSB 4983"]
            internalTypes = ["set","pendants","earrings","rings","bracelets"]
        }
        self.view.addSubview(aView)
        self.showToast(message: "Loading \(internalTypes[whichDiamondToShow]) images")
        let storage = Storage.storage();let storageRef = storage.reference();let imageInital = Prefixes[whichDiamondToShow]
        let imageSet = internalTypes[whichDiamondToShow]
        activity.activityIndicatorViewStyle = .gray;//activity.center = self.view.center
        activity.center = aView.center
        self.aView.addSubview(activity)
        activity.startAnimating()
    	self.collectionView?.isUserInteractionEnabled = false
        for intt in 1...ImageCounts[whichDiamondToShow]{
            let imageNumber = String(format: "%03d", intt)
            let reference = storageRef.child("jewellery-images/\(kisme[whichJwellery-1])/\(imageSet)/\(imageInital)\(imageNumber).png")
            reference.getData(maxSize: 23*1024*1024, completion: { (data, error) in
                if let error = error{
                    print(error.localizedDescription)
                }
                else{
                    print("success\(self.currentImages.count)")
                    print("url = ewellery-images/\(self.kisme[whichJwellery-1])/\(imageSet)/\(imageInital)\(imageNumber).png\n")
                    let imgggg = UIImage(data: data!)
                    self.currentImages.append(imgggg!)
                    if self.currentImages.count == ActualNumberOfImages[whichDiamondToShow]{
                        NotificationCenter.default.post(name: self.notificationNme, object: nil)
                    }
                }
            })
  
            }
        }

   
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return ActualNumberOfImages[whichDiamondToShow]
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewForDiamodAndJwellerycell
        if currentImages.count == ActualNumberOfImages[whichDiamondToShow]{
            print("\(indexPath.item)=")
            cell._imageView.image = currentImages[indexPath.item]
        }
        else{
       
	
        }
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }

}


class CollectionViewForDiamodAndJwellerycell: UICollectionViewCell {
    
    @IBOutlet weak var _imageView: UIImageView!
  
    
}


