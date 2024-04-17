//
//  IntroVC.swift
//  PersonalityQuiz
//
//  Created by Ananaya on 13/04/24.
//


import UIKit

class IntroVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startQuizPressed(_ sender: Any) {
        performSegue(withIdentifier: "startQuiz", sender: nil)
    }
    
    @IBAction func unwindToIntroVc(segue: UIStoryboardSegue) {}
    
}
