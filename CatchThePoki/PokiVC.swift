//
//  PokiVC.swift
//  CatchThePoki
//
//  Created by Kasumi Ruslim on 9/4/20.
//

import UIKit

class PokiVC: UIViewController {
    
    var userName: String!
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        highScoreLabel.text = "\(userName!)'s High Score:"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
