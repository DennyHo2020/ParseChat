//
//  LoginViewController.swift
//  Chat
//
//  Created by Denny Ho on 10/3/18.
//  Copyright © 2018 Denny Ho. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        newUser.username = usernameField.text!
        newUser.password = passwordField.text!
        
        newUser.signUpInBackground {
            (success: Bool, error: Error?) in
            if success
            {
                print("created user")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else{
                print("Error:")
                print(error!.localizedDescription)
                print(error.debugDescription)
                
            }
        }
    }
    
    @IBAction func onLogin(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!)
        { (user: PFUser?, error: Error?) in
            
            if user != nil {
                print("you're logged in!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
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
