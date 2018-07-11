//
//  DesignJwellery.swift
//  GemSelection
//
//  Created by abhishek chaudhary on 19/01/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit
import Firebase
var isPhoto:Bool = false
class DesignJwellery: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
let imagePicker = UIImagePickerController()
    let storage = Storage.storage()
    @IBOutlet weak var _imageofJwellery: UIImageView!
    @IBOutlet weak var _nameTF: UITextField!
    @IBOutlet weak var _emailTF: UITextField!
    @IBOutlet weak var _numberTF: UITextField!
    @IBAction func submitBtn(_ sender: Any) {
        guard let name = _nameTF.text else {
            showToast(message: "Enter Name")
            return
        }
      
        guard let email = _emailTF.text else {
            showToast(message: "Enter Email")
            return
        }
        guard let number = _numberTF.text else {
            showToast(message: "Enter Contact Number")
            return
        }
        guard let imageofJwellery = _imageofJwellery.image else {
            showToast(message: "capture a image")
            return
        }
        
        let storageRef = storage.reference()
        let imagesRef = storageRef.child("orders").child("order.jpg__\(name)_\(email)_\(number).jpg")
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
       let uploadTask = imagesRef.putData(UIImageJPEGRepresentation(imageofJwellery, 1.0)!, metadata: metaData) { (data, error) in
            if error != nil{
                print("erro id \(error?.localizedDescription ?? "kuch aaya")")
            }
            else{
                print("\nupload successfull")
            }
        }
        let activity = UIActivityIndicatorView()
        activity.activityIndicatorViewStyle = .gray
        uploadTask.observe(.resume) { _ in
            activity.center = self.view.center
            self.view.addSubview(activity)
            activity.startAnimating()
        }
        uploadTask.observe(.success) { (_) in
        activity.stopAnimating()
            activity.removeFromSuperview()
            self.showToast(message: "Thank You, Upload Successful. We will get in touch With you.")
        }
        uploadTask.observe(.failure) { (_) in
            self.showToast(message: "Failed")
            activity.removeFromSuperview()
        }
    }
    @IBAction func retakeBtn(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
            present(imagePicker, animated: true, completion: nil)
        }
    }
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: imagePicker.sourceType)!
     	ref = Database.database().reference()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
            if isPhoto == false{
                present(imagePicker, animated: true, completion: nil)
                isPhoto = true
            }

        }
        if let userID = Auth.auth().currentUser?.uid{
            ref.child("users").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let username = value?["name"] as? String ?? ""
            let email = value?["email"] as? String ?? ""
            let phoneNumber = value?["contact"] as? String ?? ""
                self._nameTF.text = username
                self._emailTF.text = email
                self._numberTF.text = phoneNumber
            
        }) { (error) in
            print("\nerror = \(error.localizedDescription)")
            }}
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        _imageofJwellery.image = chosenImage
        dismiss(animated: true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        _numberTF.resignFirstResponder()
        _emailTF.resignFirstResponder()
        _numberTF.resignFirstResponder()
    }
}
