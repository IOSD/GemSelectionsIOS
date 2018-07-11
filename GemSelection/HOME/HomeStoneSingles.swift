//
//  HomeStoneSingles.swift
//  GemSelection
//
//  Created by abhishek chaudhary on 17/01/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit
var whichSingleStone:Int = 0
class HomeStoneSingles: UIViewController {
    @IBOutlet weak var _imageOfstone: UIImageView!
    @IBAction func buyNow(_ sender: Any) {
        ShowWebView(urll: "https://khannagems.com/")
    }
    @IBAction func viewVideoofStone(_ sender: Any) {
        
    }
    @IBOutlet weak var _textViewDetail: UITextView!
    @IBOutlet weak var _buyNow: UIButton!
    @IBOutlet weak var _viewVideo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
     _viewVideo.layer.borderColor = UIColor.orange.cgColor
        _viewVideo.layer.borderWidth = 1.0
        _viewVideo.layer.cornerRadius = 5.0
        _textViewDetail.layer.borderColor = UIColor.gray.cgColor
        _textViewDetail.layer.borderWidth = 1.0
        _textViewDetail.layer.cornerRadius = 5.0
        _buyNow.layer.borderColor = UIColor.orange.cgColor
        _buyNow.layer.borderWidth = 1.0
        _buyNow.layer.cornerRadius = 5.0
    }
    override func viewWillAppear(_ animated: Bool) {
        let homeData = HomeData()
        _imageOfstone.image = homeData.stoneImages[whichSingleStone]
        switch whichSingleStone {
        case 0:
            _textViewDetail.text = homeData.bainganiDetails[0]
        case 6:
            _textViewDetail.text = homeData.gulabiDetails[0]
        case 7:
            _textViewDetail.text = homeData.pitambraiNeelamDetails[0]
        case 9:
            _textViewDetail.text = homeData.motiDetails[0]
        case 12:
            _textViewDetail.text = homeData.safedPukhrajDetails[0]
        case 13:
            _textViewDetail.text = homeData.haraPukhrajDetails[0]
        default:
            return
        }
        
    }

   

}
