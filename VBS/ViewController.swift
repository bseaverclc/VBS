//
//  ViewController.swift
//  VBS
//
//  Created by Brian Seaver on 11/22/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var HomeButtonPlain: UIButton!
    @IBOutlet weak var HomeButton: UIButton!
    @IBOutlet weak var HomeView: UIView!
    
    @IBOutlet weak var awayView: UIView!
    
    @IBOutlet weak var AwayButtonPlain: UIButton!
    @IBOutlet weak var AwayButton: UIButton!
    
    var homeKills = 0
    var homeBlocks = 0
    var homeScore = 0
    var awayScore = 0
    var homeStats = [0,0,0,0,0,0,0,0]
    var awayStats = [0,0,0,0,0,0,0,0]
   
    @IBOutlet weak var homeKillPctLabel: UILabel!
    
    @IBOutlet weak var homeSrvAvgLabel: UILabel!
    
    @IBOutlet weak var awayKillPctLabel: UILabel!
    
    @IBOutlet weak var awaySrvAvgLabel: UILabel!
    
    @IBOutlet var homeStatsLabels: [UILabel]!
    
    @IBOutlet var awayStatsLabels: [UILabel]!
    
    
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
        HomeView.isHidden = true
        awayView.isHidden = true
        HomeButton.isHidden = true
        AwayButton.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      //  OuterStackView.distribution = .fillEqually
      // HomeButton.showsMenuAsPrimaryAction = false
       // AwayButton.showsMenuAsPrimaryAction = false
         //HomeButton.changesSelectionAsPrimaryAction = true
        
        let homeClosure = {(action: UIAction) in
            var selection = action.title
            self.homeAction(selected: selection)
                print("homeclosure")

           }
        HomeButton.menu = UIMenu(children: [
                UIAction(title: "Kill", state: .on, handler: homeClosure),
                UIAction(title: "Block", handler: homeClosure),
                UIAction(title: "Ace", handler: homeClosure),
                UIAction(title: "Opponent Attk Err", handler: homeClosure),
                UIAction(title: "Opponent Srv Err", handler: homeClosure),
                UIAction(title: "Opp Other Err", handler: homeClosure),
            ])
        
        let awayClosure = {(action: UIAction) in
            var selection = action.title
            self.awayAction(selected: selection)
                print("awayclosure")

           }
        AwayButton.menu = UIMenu(children: [
                UIAction(title: "Kill", state: .on, handler: awayClosure),
                UIAction(title: "Block", handler: awayClosure),
                UIAction(title: "Ace", handler: awayClosure),
                UIAction(title: "Opponent Attk Err", handler: awayClosure),
                UIAction(title: "Opponent Srv Err", handler: awayClosure),
                UIAction(title: "Opp Other Err", handler: awayClosure),
            ])
    }
    

    func homeAction(selected: String){
        homeScore+=1
        HomeButton.setTitle("\(homeScore)", for: .normal)
        HomeButton.setTitle("\(homeScore)", for: .selected)
        
        switch selected {
        case "Kill":
            homeStats[0]+=1
            homeStats[6]+=1
        case "Block":
            homeStats[1]+=1
            awayStats[3]+=1
            awayStats[6]+=1
        case "Ace":
            homeStats[2]+=1
        case "Opponent Attk Err":
            awayStats[3]+=1
            awayStats[6]+=1
        case "Opponent Srv Err":
            awayStats[4]+=1
        case "Opp Other Err":
            awayStats[5]+=1
        default:
            print("nothing")
        }
        updateStats()
        
    }
    
    func awayAction(selected: String){
        awayScore+=1
        AwayButton.setTitle("\(awayScore)", for: .normal)
        AwayButton.setTitle("\(awayScore)", for: .selected)
        
        switch selected {
        case "Kill":
            awayStats[0]+=1
            awayStats[6]+=1
        case "Block":
            awayStats[1]+=1
            homeStats[3]+=1
            homeStats[6]+=1
        case "Ace":
            awayStats[2]+=1
        case "Opponent Attk Err":
            homeStats[3]+=1
            homeStats[6]+=1
        case "Opponent Srv Err":
            homeStats[4]+=1
        case "Opp Other Err":
            homeStats[5]+=1
        default:
            print("nothing")
        }
        updateStats()
        
    }
    
    
    
    func updateStats(){
        for i in 0 ..< homeStatsLabels.count{
            homeStatsLabels[i].text = "\(homeStats[i])"
        }
        
        for i in 0 ..< awayStatsLabels.count{
            awayStatsLabels[i].text = "\(awayStats[i])"
        }
        
        if homeStats[6] != 0{
            var homePercent = (Double(homeStats[0] - homeStats[3]))/Double(homeStats[6])
            var homePercentString = String(format: "%.3f", homePercent)
            homeKillPctLabel.text = homePercentString
        }
        else{
            homeKillPctLabel.text = "0.000"
        }
        
        if awayStats[6] != 0{
            var awayPercent = (Double(awayStats[0] - awayStats[3]))/Double(awayStats[6])
            var awayPercentString = String(format: "%.3f", awayPercent)
            awayKillPctLabel.text = awayPercentString
        }
        else{
            awayKillPctLabel.text = "0.000"
        }
    }
    

    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        var select = sender.selectedSegmentIndex
        
        switch select {
        case 0:
            homeSidePane.isHidden = true
            awaySidePane.isHidden = true
            homeStatsPane.isHidden = true
            awayStatsPane.isHidden = true
            HomeView.isHidden = true
            awayView.isHidden = true
            HomeButton.isHidden = true
            AwayButton.isHidden = true
            HomeButtonPlain.isHidden = false
            AwayButtonPlain.isHidden = false
            HomeButtonPlain.setTitle("\(homeScore)", for: .normal)
            AwayButtonPlain.setTitle("\(awayScore)", for: .normal)
        case 1:
            HomeButtonPlain.isHidden = true
            AwayButtonPlain.isHidden = true
            HomeView.isHidden = false
            awayView.isHidden = false
            HomeButton.isHidden = false
            AwayButton.isHidden = false
            HomeButton.showsMenuAsPrimaryAction = true
            HomeButton.setTitle("\(homeScore)", for: .normal)
            
            AwayButton.showsMenuAsPrimaryAction = true
            AwayButton.setTitle("\(awayScore)", for: .normal)
            
            homeSidePane.isHidden = true
            awaySidePane.isHidden = true
            homeStatsPane.isHidden = false
            awayStatsPane.isHidden = false
        default :
            HomeButtonPlain.isHidden = true
            AwayButtonPlain.isHidden = true
            HomeView.isHidden = false
            awayView.isHidden = false
            HomeButton.isHidden = false
            AwayButton.isHidden = false
            HomeButton.showsMenuAsPrimaryAction = true
            HomeButton.setTitle("\(homeScore)", for: .normal)
            AwayButton.showsMenuAsPrimaryAction = true
            AwayButton.setTitle("\(awayScore)", for: .normal)
            
            homeSidePane.isHidden = false
            awaySidePane.isHidden = false
            homeStatsPane.isHidden = false
            awayStatsPane.isHidden = false
        
            
        }
    }
    
    
    
    @IBAction func homeScoreAction(_ sender: UIButton) {
        print("homeScoreAction")
        homeScore += 1
        HomeButtonPlain.setTitle("\(homeScore)", for: .normal)
        HomeButtonPlain.setTitle("\(homeScore)", for: .selected)
    }
    
    @IBAction func awayScoreAction(_ sender: Any) {
        print("awayScoreAction")
        awayScore += 1
        AwayButtonPlain.setTitle("\(awayScore)", for: .normal)
        AwayButtonPlain.setTitle("\(awayScore)", for: .selected)
    }
    
    
    
    @IBAction func resetAction(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Warning!", message: "Do you want to clear out all scores and stats?", preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "Yes", style: .default) { action in
            self.homeScore = 0
            self.awayScore = 0
            self.homeStats = [0,0,0,0,0,0,0,0]
            self.awayStats = [0,0,0,0,0,0,0,0]
            self.updateStats()
            self.HomeButton.setTitle("\(self.homeScore)", for: .normal)
            self.HomeButtonPlain.setTitle("\(self.homeScore)", for: .normal)
            self.AwayButton.setTitle("\(self.homeScore)", for: .normal)
            self.AwayButtonPlain.setTitle("\(self.homeScore)", for: .normal)
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(yes)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    
    @IBAction func homeAttackAction(_ sender: UIButton) {
        homeStats[6]+=1
        updateStats()
        
    }
    
    @IBAction func homeDigAction(_ sender: UIButton) {
        homeStats[7]+=1
        updateStats()
    }
    
    
    @IBAction func awayAttackAction(_ sender: UIButton) {
        awayStats[6]+=1
        updateStats()
    }
    

    @IBAction func awayDigsAction(_ sender: UIButton) {
        awayStats[7]+=1
        updateStats()
    }
}

