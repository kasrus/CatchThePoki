//
//  ViewController.swift
//  CatchThePoki
//
//  Created by Kasumi Ruslim on 9/4/20.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
   
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var playView: UIView!
    @IBOutlet weak var notNameButton: UIButton!
    
    
    var userName: String!
    var isAlertCalled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        if let newName = storedName as? String {
            userName = newName
            nameLabel.text = userName
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        nameText.text = ""
        if nameLabel.text != "" {
            nameView.isHidden = true
            playView.isHidden = false
            showNotNameButton()
        } else {
            nameView.isHidden = false
            playView.isHidden = true
            notNameButton.isHidden = true
        }
    }
    
    func showNotNameButton() {
        if nameLabel.text != "" {
            notNameButton.isHidden = false
            notNameButton.setTitle("Not \(nameLabel.text!) ?", for: UIControl.State.normal)
        }
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        UserDefaults.standard.set(nameText.text!, forKey: "name")
        nameLabel.text = nameText.text!
        createAlert()
        if !isAlertCalled {
            showNotNameButton()
            nameView.isHidden = true
            playView.isHidden = false
            userName = nameText.text!
        } else {
            nameView.isHidden = false
            playView.isHidden = true
            nameText.text = ""
        }
    }
    
    @IBAction func startGame(_ sender: Any) {
        performSegue(withIdentifier: "toPokiVC", sender: nil)
    }
    
    @IBAction func notNameClicked(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "name")
        userName = ""
        nameLabel.text = ""
        nameView.isHidden = false
        playView.isHidden = true
        notNameButton.isHidden = true
    }
    
    func createAlert () {
        if nameLabel.text == "" && nameText.text == "" {
            let alert = UIAlertController(title: "Error", message: "Please enter a user name", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            isAlertCalled = true
        } else {
            isAlertCalled = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPokiVC" {
            let destinationVC = segue.destination as! PokiVC
            destinationVC.userName = userName
        }
    }
    
}

