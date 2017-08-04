//
//  ViewController.swift
//  Project2
//
//  Created by Abhishek Jaykrishna Khapare on 7/25/17.
//  Copyright © 2017 Abhishek Jaykrishna Khapare. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        scoreLabel.text = "Score : \(score)"
        
        askQuestion()
    }
    
    func askQuestion(action : UIAlertAction! = nil){
        
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        
        title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            scoreLabel.text = "Score : \(score)"
        }else {
            title = "Wrong"
            
            if score == 0 {
                let alert = UIAlertController(title: title, message: "Game Over", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                
                present(alert, animated: true)
                return
            }
            score -= 1
            scoreLabel.text = "Score : \(score)"
            
            
        }
        
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(alert, animated: true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

