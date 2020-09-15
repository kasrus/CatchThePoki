//
//  PokiVC.swift
//  CatchThePoki
//
//  Created by Kasumi Ruslim on 9/4/20.
//

import UIKit

class PokiVC: UIViewController {
    
    var player: Player!

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!

    @IBOutlet weak var poki1: UIImageView!
    @IBOutlet weak var poki2: UIImageView!
    @IBOutlet weak var poki3: UIImageView!
    @IBOutlet weak var poki4: UIImageView!
    @IBOutlet weak var poki5: UIImageView!
    @IBOutlet weak var poki6: UIImageView!
    @IBOutlet weak var poki7: UIImageView!
    @IBOutlet weak var poki8: UIImageView!
    @IBOutlet weak var poki9: UIImageView!
    
    var timer = Timer()
    var timeCounter = 15
    var myPoki:[UIImageView] = []
    var score = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        myPoki = [poki1, poki2, poki3,
                  poki4, poki5, poki6,
                  poki7, poki8, poki9]
               
        for i in 0 ..< 9 {
            myPoki[i].isUserInteractionEnabled = true
        }
       
    }
    
    func startTimer () {
        timerLabel.text = "\(timeCounter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }
    
    @objc func increaseScore () {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func timerFunction () {
        whereIsPoki(myPoki)
        
        timeCounter -= 1
        timerLabel.text = "\(timeCounter)"
        
        if timeCounter == 0 {
            alertPlayAgain()
            timer.invalidate()
            highScoreLabel.text = "\(player.name!)'s High Score: \(score)"
        }
    }
    
    func whereIsPoki(_ poki: [UIImageView]) {
        let randomInt = Int.random(in: 0 ..< 9)
        
        for i in 0 ..< 9 where i != randomInt{
            poki[i].isHidden = true
        }
        poki[randomInt].isHidden = false
        let pokiGesture = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        poki[randomInt].addGestureRecognizer(pokiGesture)
    }
    
    func alertPlayAgain () {
        let alert = UIAlertController(title: "Time's Up!", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
            self.timeCounter = 15
            self.score = 0
            self.startTimer()
        }
        
        alert.addAction(okButton)
        alert.addAction(replayButton)
        self.present(alert, animated: true, completion: nil)
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
