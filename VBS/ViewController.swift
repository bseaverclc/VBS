//
//  ViewController.swift
//  VBS
//
//  Created by Brian Seaver on 11/22/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var HomeButton: UIButton!
    var homeKills = 0
    var homeBlocks = 0
    var homeScore = 0
    var awayScore = 0
    
    @IBOutlet weak var OuterStackView: UIStackView!
    
    @IBOutlet weak var homeSidePane: UIStackView!
    
    @IBOutlet weak var centerPanel: UIStackView!
    
    @IBOutlet weak var awaySidePane: UIStackView!
    
    override func viewWillAppear(_ animated: Bool) {
       
        //centerPanel.removeConstraints(centerPanel.constraints)
        //centerPanel.widthAnchor.constraint(equalTo: OuterStackView.widthAnchor, multiplier: 1.0).isActive = true
        homeSidePane.isHidden = true
        awaySidePane.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //OuterStackView.distribution = .fillEqually
      // HomeButton.showsMenuAsPrimaryAction = true
          //HomeButton.changesSelectionAsPrimaryAction = true
        
        let homeClosure = {(action: UIAction) in
            self.homeScore+=1
            self.HomeButton.setTitle("\(self.homeScore)", for: .normal)
            self.HomeButton.setTitle("\(self.homeScore)", for: .selected)
            var selection = action.title
            switch selection {
            case "Kill":
                self.homeKills+=1
            case "Block":
                self.homeBlocks+=1
            default:
                print("nothing")
            }
                
            
           }
        HomeButton.menu = UIMenu(children: [
                UIAction(title: "Kill", state: .on, handler: homeClosure),
                UIAction(title: "Block", handler: homeClosure),
              
            ])
    }
    



}

