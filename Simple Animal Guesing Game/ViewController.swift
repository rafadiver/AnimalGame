//
//  ViewController.swift
//  Simple Animal Guesing Game
//
//  Created by Fam Aguirre on 16/04/17.
//  Copyright © 2017 Uberbliss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTitlerlabel: UILabel!
    @IBOutlet weak var imvImageView: UIImageView!
    @IBOutlet weak var btnButton1Label: UIButton!
    @IBOutlet weak var btnButton2Label: UIButton!
    
    var imageArray = [#imageLiteral(resourceName: "COCODRILE"), #imageLiteral(resourceName: "HIPOPOTAMUS"), #imageLiteral(resourceName: "LION"), #imageLiteral(resourceName: "GORILLA")]
    var animalNamesArray = ["Crocodrile", "Hipopotamus", "lion", " Gorilla"]
    var randomNumber : Int?
    var lastRandomNumber: Int?
    var animalChoice : String?
    var wrongAnimalChoice: String?
    var ButtonWithCorrectChoice: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setButtonTitle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressButton1(_ sender: UIButton) {
        switch ButtonWithCorrectChoice! {
        case 0:
            lblTitlerlabel.text = " Thats Correct"
        case 1:
            lblTitlerlabel.text = " Not quite, try again"
        default:
            break
        }
    }
    
    @IBAction func pressButton2(_ sender: UIButton) {
        switch ButtonWithCorrectChoice! {
        case 0:
            lblTitlerlabel.text = " Wrong"
        case 1:
            lblTitlerlabel.text = " Thats Correct"
        default:
            break
        }
    }
    
    func ChooceImage () {
        randomNumber = Int(arc4random_uniform(4))
        if (randomNumber == lastRandomNumber){
        ChooceImage()
        }
        lastRandomNumber = randomNumber
        imvImageView.image = imageArray[randomNumber!]
    }
    
    func setChoice() {
        ChooceImage()
        animalChoice = animalNamesArray[randomNumber!]
        let randomWrongChoice = Int(arc4random_uniform(4))
        if (randomWrongChoice == randomNumber){
        setChoice()
        }
        wrongAnimalChoice = animalNamesArray[randomWrongChoice]
    }
    
    func setButtonTitle() {
        setChoice()
        ButtonWithCorrectChoice = Int(arc4random_uniform(2))
        
        switch ButtonWithCorrectChoice! {
        case 0:
            btnButton1Label.setTitle(animalChoice, for: UIControlState.normal)
            btnButton2Label.setTitle(wrongAnimalChoice, for: UIControlState.normal)
        case 1:
            btnButton1Label.setTitle(wrongAnimalChoice, for: UIControlState.normal)
            btnButton2Label.setTitle(animalChoice, for: UIControlState.normal)
        default:
            break
        }
    }
    
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        setButtonTitle()
        lblTitlerlabel.text?.removeAll()
    }
}


    


