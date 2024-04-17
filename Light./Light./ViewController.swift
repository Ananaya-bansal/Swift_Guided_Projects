//
//  ViewController.swift
//  Light.
//
//  Created by Ananaya on 07/04/24.
//

import UIKit

class ViewController: UIViewController {
    var lightOn = true

    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI()

        // Do any additional setup after loading the view.
    }


func UpdateUI() {
    view.backgroundColor = lightOn ? .white : .black
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        lightOn.toggle()
        UpdateUI()
       
    }
}

