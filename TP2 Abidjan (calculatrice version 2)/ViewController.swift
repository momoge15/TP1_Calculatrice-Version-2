//
//  ViewController.swift
//  TP2 Abidjan (calculatrice version 2)
//
//  Created by mbds on 29/03/ 2021.
//

import UIKit

class ViewController: UIViewController {
    var valeur:Double = 0;
    var valeurPrec:Double = 0;
    var autorisation = false;
    var operation = 0;

    
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var resultat: UILabel!
    
    @IBAction func nombres(_ sender: UIButton) {
        
       
        if(autorisation == true)
        {
            label.text = label.text! + String(sender.tag-1)
            
            autorisation = false

        }
        else
        {
            label.text = label.text! + String(sender.tag-1)
            //valeur = Double(label.text!)!
        }
        
    }
    @IBAction func operation(_ sender: UIButton) {
        if (label.text != "" && sender.tag != 16)
        {
            if(sender.tag == 17)
            {
                label.text = "0"
                autorisation = false
                resultat.text = ""
            }
            else{
                if(!autorisation)
                            {
                                if sender.tag == 11
                                {
                                    label.text = label.text! + "+"
                                }
                                else if sender.tag == 12
                                {
                                    label.text = label.text! + "-"
                                }
                                else if sender.tag == 13
                                {
                                    label.text = label.text! + "*"
                                }
                                else if sender.tag == 14
                                {
                                    label.text = label.text! + "/"
                                }
                                else if sender.tag==15
                                {
                                    label.text = label.text! + "."
                                }
                                operation = sender.tag
                                autorisation = true;
                            }
            }
            
            
            
        }
    
        else if sender.tag == 16
        {
            if(validInput())
            {
                calcule()
                resultat.text = ""
            
            }
            else
            {
                resultat.text = "Données invalide"
            }
    
            
        }
    }
    func specialCharacter (char: Character) -> Bool
        {
            if(char == "*")
            {
                return true
            }
            if(char == "/")
            {
                return true
            }
            if(char == "+")
            {
                return true
            }
            return false
        }
    func validInput() ->Bool
        {
            
            var count = 0
            var funcCharIndexes = [Int]()
            
        for char in label.text!
            {
                if(specialCharacter(char: char))
                {
                    funcCharIndexes.append(count)
                }
                count += 1
            }
            
            var previous: Int = -1
            
            for index in funcCharIndexes
            {
                if(index == 0)
                {
                    return false
                }
                
                if(index == label.text!.count - 1)
                {
                    return false
                }
                
                if (previous != -1)
                {
                    if(index - previous == 1)
                    {
                        return false
                    }
                }
                previous = index
            }
            
            return true
        }
    
    func showalert()
    {
        let alert = UIAlertController(title: "Erreur", message: "Données invalid", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Dismiss", style: .cancel, handler: {
                                        action in print("OK")
            
        }
        ))
        present(alert, animated: true)
    }
    
    func calcule()
    {
        let x : String! = label.text
        let b = NSExpression(format: x)
        let d = b.expressionValue(with: nil, context: nil) as! Double
        if(d.truncatingRemainder(dividingBy: 1) == 0)
                {
            label.text = String(format: "%.0f", d)
                }
                else
                {
                    label.text = String(format: "%.2f", d)
                }
        
        label.text! = String(d)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    


}

