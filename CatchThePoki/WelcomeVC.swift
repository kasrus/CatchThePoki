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
    @IBOutlet weak var notName: UIButton!
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var playView: UIView!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        if let newName = storedName as? String {
            userName = newName
            nameLabel.text = userName
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        if nameLabel.text != "" {
            nameView.isHidden = true
            playView.isHidden = false
            notName.setTitle("Not \(nameLabel.text!)", for: UIControl.State.normal) 
        } else {
            nameView.isHidden = false
            playView.isHidden = true
        }
    }
    @IBAction func saveClicked(_ sender: Any) {
        UserDefaults.standard.set(nameText.text!, forKey: "name")
        nameLabel.text = nameText.text!
        nameText.text = ""
        nameView.isHidden = true
    }
    
    @IBAction func startGame(_ sender: Any) {
        if nameLabel.text == "" && nameText.text == "" {
            createAlert()
        }
        performSegue(withIdentifier: "toPokiVC", sender: nil)
    }
    
    @IBAction func deletePlayer(_ sender: Any) {
        
    }
    func createAlert () {
        let alert = UIAlertController(title: "Error", message: "Please enter a user name", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPokiVC" {
            let destinationVC = segue.destination as! PokiVC
            destinationVC.userName = userName
        }
    }
    
}

