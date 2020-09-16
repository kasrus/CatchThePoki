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
    
    var isAlertCalled = false
    var player: Player!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player()
        
        //loading the name stored & display it on the welcome screen
        let storedName = UserDefaults.standard.object(forKey: "name")
        if let newName = storedName as? String {
            player.name = newName
            nameLabel.text = newName
         
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        nameText.text = ""
        if nameLabel.text != "" {
            userNameCreated()
        } else {
            createUserName()
        }
    }
    func createUserName () {
        nameText.text = ""
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
    
    @IBAction func saveClicked(_ sender: Any) {
        createAlert()
        if !isAlertCalled {
            player.name = nameText.text!
            player.score = 0
            UserDefaults.standard.set(nameText.text!, forKey: "name")
            nameLabel.text = nameText.text!
            userNameCreated()
       
        } else {
            createUserName()
        }
    }
    
    func userNameCreated () {
        nameView.isHidden = true
        playView.isHidden = false
        showNotNameButton()
    }
    
    func showNotNameButton() {
        if nameLabel.text != "" {
            notNameButton.setTitle("Not \(nameLabel.text!) ?", for: UIControl.State.normal)
            notNameButton.isHidden = false
        }
    }
    
    @IBAction func startGame(_ sender: Any) {
        performSegue(withIdentifier: "toPokiVC", sender: nil)
    }
    
    @IBAction func notNameClicked(_ sender: Any) {
        nameLabel.text = ""
        createUserName()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPokiVC" {
            let destinationVC = segue.destination as! PokiVC
            destinationVC.player = player
        }
    }
    
}

