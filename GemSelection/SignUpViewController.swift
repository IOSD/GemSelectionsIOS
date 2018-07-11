//
//  SignUpViewController.swift
//  GemSelection
//
//  Created by Bhavin on 29/05/18.
//  Copyright © 2018 atlas. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var signUpName: UITextField!
    @IBOutlet weak var signUpEmail: UITextField!
    @IBOutlet weak var signUpPassword: UITextField!
    @IBOutlet weak var signUpPhone: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        //view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpUserBtn(_ sender: Any) {
        guard let name = signUpName.text else {
            return
        };guard let email = signUpEmail.text else {
            return
        };guard let password = signUpPassword.text else {
            return
        };guard let phone = signUpPhone.text else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            else{
                isloggedin = 1
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = name
                changeRequest?.commitChanges { (error) in
                    print("\n\nho gya change")
                }
                self.ref.child("users").child(user!.uid).child("contact").setValue(phone)
                self.ref.child("users").child(user!.uid).child("email").setValue(email)
                self.ref.child("users").child(user!.uid).child("name").setValue(name)
                self.performSegue(withIdentifier: "signinsuccess", sender: self)
            }
            
        }}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        signUpName.resignFirstResponder()
        signUpEmail.resignFirstResponder()
        signUpPassword.resignFirstResponder()
        signUpPhone.resignFirstResponder()
        
        
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
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
