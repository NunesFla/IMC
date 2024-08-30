//
//  ViewController.swift
//  IMC
//
//  Created by Flavio Nunes on 24/08/24.
//  Copyright © 2024 Flavio Nunes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var setTfWeight: UITextField!
    @IBOutlet weak var setTfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var setIvResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(setTfWeight.text!), let height = Double(setTfHeight.text!) {
            imc = weight / (height*height)
            showResults()
        }
    }
    
    func showResults() {
        var result: String = ""
        var image: String = ""
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                 result = "Sobrepeso"
                 image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        
        lbResult.text = "\(Int(imc)): \(result)"
        setIvResult.image = UIImage(named: image)
        viResult.isHidden = false
        view.endEditing(true)
    }
}

