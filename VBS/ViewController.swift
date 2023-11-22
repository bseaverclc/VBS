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
    var homeStats = [0,0,0,0,0,0]
    var awayStats = [0,0,0,0,0,0]
    
    
    
    @IBOutlet weak var OuterStackView: UIStackView!
    
    @IBOutlet weak var homeSidePane: UIStackView!
    
    @IBOutlet weak var centerPanel: UIStackView!
    
    @IBOutlet weak var awaySidePane: UIStackView!
    
    @IBOutlet weak var homeStatsPane: UIStackView!
    
    @IBOutlet weak var awayStatsPane: UIStackView!
    
    override func viewWillAppear(_ animated: Bool) {
       
        //centerPanel.removeConstraints(centerPanel.constraints)
        //centerPanel.widthAnchor.constraint(equalTo: OuterStackView.widthAnchor, multiplier: 1.0).isActive = true
        homeSidePane.isHidden = true
        awaySidePane.isHidden = true
        homeStatsPane.isHidden = true
        awayStatsPane.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //OuterStackView.distribution = .fillEqually
      // HomeButton.showsMenuAsPrimaryAction = true
          //HomeButton.changesSelectionAsPrimaryAction = true
        
        let homeClosure = {(action: UIAction) in
            var selection = action.title
            self.homeAction(selected: selection)
                
            
           }
        HomeButton.menu = UIMenu(children: [
                UIAction(title: "Kill", state: .on, handler: homeClosure),
                UIAction(title: "Block", handler: homeClosure),
                UIAction(title: "Ace", handler: homeClosure),
                UIAction(title: "Opponent Attk Err", handler: homeClosure),
                UIAction(title: "Opponent Srv Err", handler: homeClosure),
                UIAction(title: "Opp Other Err", handler: homeClosure),
            ])
    }
    

    func homeAction(selected: String){
        homeScore+=1
        HomeButton.setTitle("\(homeScore)", for: .normal)
        HomeButton.setTitle("\(homeScore)", for: .selected)
        
        switch selected {
        case "Kill":
            homeStats[0]+=1
        case "Block":
            homeStats[1]+=1
        case "Ace":
            homeStats[2]+=1
        default:
            print("nothing")
        }
    }
    
    func updateStats(){
       
    }
    

    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        var select = sender.selectedSegmentIndex
        
        switch select {
        case 0:
            homeSidePane.isHidden = true
            awaySidePane.isHidden = true
            homeStatsPane.isHidden = true
            awayStatsPane.isHidden = true
        case 1:
            homeSidePane.isHidden = true
            awaySidePane.isHidden = true
            homeStatsPane.isHidden = false
            awayStatsPane.isHidden = false
        default:
            homeSidePane.isHidden = false
            awaySidePane.isHidden = false
            homeStatsPane.isHidden = false
            awayStatsPane.isHidden = false
        }
    }
    
    
    
    @IBAction func resetAction(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Warning!", message: "Do you want to clear out all scores and stats?", preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "Yes", style: .default) { action in
            self.homeScore = 0
            self.awayScore = 0
            self.HomeButton.setTitle("\(self.homeScore)", for: .normal)
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(yes)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    

}

