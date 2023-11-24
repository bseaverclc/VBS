//
//  ViewController.swift
//  VBS
//
//  Created by Brian Seaver on 11/22/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var AwayPlainLabel: UILabel!
    
    @IBOutlet weak var AwayLabel: UILabel!
    @IBOutlet weak var HomeLabel: UILabel!
    @IBOutlet weak var HomePlainLabel: UILabel!
    
    @IBOutlet var minusButtonOutlets: [UIButton]!
    
    @IBOutlet weak var awayServeMinusOutlet: UIButton!
    
    @IBOutlet weak var homeServeMinusOutlet: UIButton!
    @IBOutlet weak var HomeServeReceiveMinus: UIButton!
    @IBOutlet weak var HomeMoreStatsView: UIStackView!
    
   
    @IBOutlet weak var AwayMoreStatsView: UIStackView!
    
    @IBOutlet weak var HomeMinusButton: UIButton!
    
    @IBOutlet weak var AwayMinusButton: UIButton!
    
    @IBOutlet weak var HomePlainView: UIView!
    
    @IBOutlet weak var AwayPlainView: UIView!
    
    @IBOutlet weak var HomeButtonPlain: UIButton!
    @IBOutlet weak var HomeButton: UIButton!
    @IBOutlet weak var HomeView: UIView!
    
    @IBOutlet weak var awayView: UIView!
    
    @IBOutlet weak var AwayButtonPlain: UIButton!
    @IBOutlet weak var AwayButton: UIButton!
    
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    
    
    var homeKills = 0
    var homeBlocks = 0
    var homeScore = 0
    var awayScore = 0
    var homeStats = [0,0,0,0,0,0,0,0]
    var awayStats = [0,0,0,0,0,0,0,0]
    var homeServeReceives = [0,0,0,0]
    var awayServeReceives = [0,0,0,0]
    
    
   
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
       
        for but in minusButtonOutlets{
            but.titleLabel?.text = ""
        }
        
        homeServeMinusOutlet.titleLabel?.text = ""
        awayServeMinusOutlet.titleLabel?.text = ""
        
        
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
        
        let homeClosureUndo = {(action: UIAction) in
            var selection = action.title
            self.homeActionUndo(selected: selection)
            
        }
        
        let homeServeMinusClosure = {(action: UIAction) in
            var selection = action.title
            self.homeServeMinusAction(selected: selection)
            print("homeclosure")
            self.homeServeMinusOutlet.titleLabel?.text = ""
            
        }
        
        let awayServeMinusClosure = {(action: UIAction) in
            var selection = action.title
            self.awayServeMinusAction(selected: selection)
            print("awayclosure")
            self.awayServeMinusOutlet.titleLabel?.text = ""
            
        }
        
        
        
        HomeServeReceiveMinus.menu = UIMenu(children: [
            UIAction(title: "1 undo", state: .on, handler: homeServeMinusClosure),
            UIAction(title: "2 undo", handler: homeServeMinusClosure),
            UIAction(title: "3 undo", handler: homeServeMinusClosure),
           
        ])
        
        awayServeMinusOutlet.menu = UIMenu(children: [
            UIAction(title: "1 undo", state: .on, handler: awayServeMinusClosure),
            UIAction(title: "2 undo", handler: awayServeMinusClosure),
            UIAction(title: "3 undo", handler: awayServeMinusClosure),
           
        ])
        
        HomeButton.menu = UIMenu(children: [
            UIAction(title: "Kill", state: .on, handler: homeClosure),
            UIAction(title: "Block", handler: homeClosure),
            UIAction(title: "Ace", handler: homeClosure),
            UIAction(title: "Opponent Attk Err", handler: homeClosure),
            UIAction(title: "Opponent Srv Err", handler: homeClosure),
            UIAction(title: "Opp Other Err", handler: homeClosure),
            UIAction(title: "???", handler: homeClosure),
        ])
        
        HomeMinusButton.menu = UIMenu(children: [
            UIAction(title: "Kill undo", state: .on, handler: homeClosureUndo),
            UIAction(title: "Block undo", handler: homeClosureUndo),
            UIAction(title: "Ace undo", handler: homeClosureUndo),
            UIAction(title: "Opponent Attk Err undo", handler: homeClosureUndo),
            UIAction(title: "Opponent Srv Err undo", handler: homeClosureUndo),
            UIAction(title: "Opp Other Err undo", handler: homeClosureUndo),
            UIAction(title: "Score undo only", handler: homeClosureUndo),
        ])
        
        
        
        let awayClosure = {(action: UIAction) in
            var selection = action.title
            self.awayAction(selected: selection)
            print("awayclosure")
            
        }
        
        let awayClosureUndo = {(action: UIAction) in
            var selection = action.title
            self.awayActionUndo(selected: selection)
            
        }
        
        
        AwayButton.menu = UIMenu(children: [
            UIAction(title: "Kill", state: .on, handler: awayClosure),
            UIAction(title: "Block", handler: awayClosure),
            UIAction(title: "Ace", handler: awayClosure),
            UIAction(title: "Opponent Attk Err", handler: awayClosure),
            UIAction(title: "Opponent Srv Err", handler: awayClosure),
            UIAction(title: "Opp Other Err", handler: awayClosure),
            UIAction(title: "???", handler: awayClosure),
        ])
        
        
        AwayMinusButton.menu = UIMenu(children: [
            UIAction(title: "Kill undo", state: .on, handler: awayClosureUndo),
            UIAction(title: "Block undo", handler: awayClosureUndo),
            UIAction(title: "Ace undo", handler: awayClosureUndo),
            UIAction(title: "Opponent Attk Err undo", handler: awayClosureUndo),
            UIAction(title: "Opponent Srv Err undo", handler: awayClosureUndo),
            UIAction(title: "Opp Other Err undo", handler: awayClosureUndo),
            UIAction(title: "Score undo only", handler: awayClosureUndo),
            
        ])
        
    }
    
    func awayServeMinusAction(selected: String){
       
        
        switch selected {
        case "1 undo":
            if awayServeReceives[1]>0{
                awayServeReceives[1]-=1
            }
        case "2 undo":
            if awayServeReceives[2]>0{
                awayServeReceives[2]-=1
            }
        case "3 undo":
            if awayServeReceives[3]>0{
                awayServeReceives[3]-=1
            }
       
        default:
            print("nothing")
        }
        updateStats()
        
    }
    
    func homeServeMinusAction(selected: String){
       
        
        switch selected {
        case "1 undo":
            if homeServeReceives[1]>0{
                homeServeReceives[1]-=1
            }
        case "2 undo":
            if homeServeReceives[2]>0{
                homeServeReceives[2]-=1
            }
        case "3 undo":
            if homeServeReceives[3]>0{
                homeServeReceives[3]-=1
            }
       
        default:
            print("nothing")
        }
        updateStats()
        
    }
    

    func homeAction(selected: String){
        homeScore+=1
        HomeLabel.text = "\(homeScore)"
        
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
            awayServeReceives[0]+=1
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
    
    func homeActionUndo(selected: String){
        if homeScore > 0{
            homeScore-=1
        }
        HomeLabel.text = "\(homeScore)"
        switch selected {
        case "Kill undo":
            if homeStats[0]>0{
                homeStats[0]-=1
            }
            if homeStats[6]>0{
                homeStats[6]-=1
            }
        case "Block undo":
            if homeStats[1]>0{
                homeStats[1]-=1
            }
            if awayStats[3]>0{
                awayStats[3]-=1
            }
            if awayStats[6]>0{
                awayStats[6]-=1
            }
        case "Ace undo":
            if homeStats[2]>0{
                homeStats[2]-=1
            }
            if awayServeReceives[0]>0{
                awayServeReceives[0]-=1
            }
        case "Opponent Attk Err undo":
            
            if awayStats[3]>0{
                awayStats[3]-=1
            }
            if awayStats[6]>0{
                awayStats[6]-=1
            }
        case "Opponent Srv Err undo":
            if awayStats[4]>0{
                awayStats[4]-=1
            }
        case "Opp Other Err undo":
            if awayStats[5]>0{
                awayStats[5]-=1
            }
        default:
            print("nothing")
        }
        updateStats()
        
    }
    
    func awayActionUndo(selected: String){
        if awayScore > 0{
            awayScore-=1
        }
        AwayLabel.text = "\(awayScore)"
        switch selected {
        case "Kill undo":
            if awayStats[0]>0{
                awayStats[0]-=1
            }
            if awayStats[6]>0{
                awayStats[6]-=1
            }
        case "Block undo":
            if awayStats[1]>0{
                awayStats[1]-=1
            }
            if homeStats[3]>0{
                homeStats[3]-=1
            }
            if homeStats[6]>0{
                homeStats[6]-=1
            }
        case "Ace undo":
            if awayStats[2]>0{
                awayStats[2]-=1
            }
            if homeServeReceives[0]>0{
                homeServeReceives[0]-=1
            }
        case "Opponent Attk Err undo":
            if homeStats[3]>0{
                homeStats[3]-=1
            }
            if homeStats[6]>0{
                homeStats[6]-=1
            }
        case "Opponent Srv Err undo":
            if homeStats[4]>0{
                homeStats[4]-=1
            }
        case "Opp Other Err undo":
            if homeStats[5]>0{
                homeStats[5]-=1
            }
        default:
            print("nothing")
        }
        updateStats()
        
    }
    
    func awayAction(selected: String){
        awayScore+=1
        AwayLabel.text = "\(awayScore)"
        
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
            homeServeReceives[0]+=1
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
        
        var total = 0
        var num = 0
        for i in 0..<homeServeReceives.count{
            total += homeServeReceives[i]*i
            num += homeServeReceives[i]
        }
        if num != 0{
            var homeServe = Double(total)/Double(num)
            var homeServeString = String(format: "%.2f", homeServe)
            homeSrvAvgLabel.text = homeServeString
        }
        else{
            homeSrvAvgLabel.text = "NA"
        }
        
        total = 0
        num = 0
        for i in 0..<awayServeReceives.count{
            total += awayServeReceives[i]*i
            num += awayServeReceives[i]
        }
        
        if num != 0{
            var awayServe = Double(total)/Double(num)
            var awayServeString = String(format: "%.2f", awayServe)
            awaySrvAvgLabel.text = awayServeString
        }
        else{
            awaySrvAvgLabel.text = "NA"
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
            HomePlainView.isHidden = false
            AwayPlainView.isHidden = false
            HomeButtonPlain.isHidden = false
            AwayButtonPlain.isHidden = false
            HomePlainLabel.text = "\(homeScore)"
            AwayPlainLabel.text = "\(awayScore)"
        case 1:
            HomePlainView.isHidden = true
            AwayPlainView.isHidden = true
            HomeButtonPlain.isHidden = true
            AwayButtonPlain.isHidden = true
            HomeView.isHidden = false
            awayView.isHidden = false
            HomeButton.isHidden = false
            AwayButton.isHidden = false
            HomeButton.showsMenuAsPrimaryAction = true
            HomeLabel.text = "\(homeScore)"
            
            AwayButton.showsMenuAsPrimaryAction = true
            AwayLabel.text = "\(awayScore)"
            
            homeSidePane.isHidden = true
            awaySidePane.isHidden = true
            homeStatsPane.isHidden = false
            awayStatsPane.isHidden = false
            HomeMoreStatsView.isHidden = true
            AwayMoreStatsView.isHidden = true
            
            
        default :
            HomePlainView.isHidden = true
            AwayPlainView.isHidden = true
            HomeButtonPlain.isHidden = true
            AwayButtonPlain.isHidden = true
            HomeView.isHidden = false
            awayView.isHidden = false
            HomeButton.isHidden = false
            AwayButton.isHidden = false
            HomeButton.showsMenuAsPrimaryAction = true
            HomeLabel.text = "\(homeScore)"
            AwayButton.showsMenuAsPrimaryAction = true
            AwayLabel.text = "\(awayScore)"
            
            homeSidePane.isHidden = false
            awaySidePane.isHidden = false
            homeStatsPane.isHidden = false
            awayStatsPane.isHidden = false
            
            HomeMoreStatsView.isHidden = false
            AwayMoreStatsView.isHidden = false
        
            
        }
    }
    
    
    
    @IBAction func homeScoreAction(_ sender: UIButton) {
        print("homeScoreAction")
        homeScore += 1
        HomePlainLabel.text = "\(homeScore)"
       
    }
    
    @IBAction func awayScoreAction(_ sender: Any) {
        print("awayScoreAction")
        awayScore += 1
        AwayPlainLabel.text = "\(awayScore)"
    }
    
    
    
    @IBAction func resetAction(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Warning!", message: "Do you want to clear out all scores and stats?", preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "Yes", style: .default) { action in
            self.homeScore = 0
            self.awayScore = 0
            self.homeStats = [0,0,0,0,0,0,0,0]
            self.awayStats = [0,0,0,0,0,0,0,0]
            self.homeServeReceives = [0,0,0,0]
            self.awayServeReceives = [0,0,0,0]
            self.updateStats()
            self.HomeLabel.text = "\(self.homeScore)"
            self.HomePlainLabel.text = "\(self.homeScore)"
            self.AwayPlainLabel.text = "\(self.awayScore)"
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(yes)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    
    @IBAction func homeAttackAction(_ sender: UIButton) {
        feedbackGenerator.impactOccurred()
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
    
    @IBAction func homeMinusAction(_ sender: UIButton) {
        print("homeminus")
        if homeScore > 0{
            homeScore-=1
            HomePlainLabel.text = "\(homeScore)"
        }
    }
    
    
    @IBAction func awayMinusAction(_ sender: UIButton) {
        if awayScore > 0{
            awayScore-=1
            AwayPlainLabel.text = "\(awayScore)"
        }
    }
    
    
    @IBAction func homeAttackMinus(_ sender: UIButton) {
        if homeStats[6]>0{
            homeStats[6]-=1
            updateStats()
        }
    }
    
    @IBAction func homeDigsMinus(_ sender: UIButton) {
        if homeStats[7]>0{
            homeStats[7]-=1
            updateStats()
        }
    }
    
    
    @IBAction func awayAttacksMinus(_ sender: UIButton) {
        if awayStats[6]>0{
            awayStats[6]-=1
            updateStats()
        }
    }
    
    
    @IBAction func awayDigsMinus(_ sender: UIButton) {
        if awayStats[7]>0{
            awayStats[7]-=1
            updateStats()
        }
    }
    
    
    @IBAction func homeOneAction(_ sender: UIButton) {
        homeServeReceives[1]+=1
        updateStats()
    }
    
    
    @IBAction func homeTwoAction(_ sender: UIButton) {
        homeServeReceives[2]+=1
        updateStats()
    }
    
    
    @IBAction func homeThreeAction(_ sender: UIButton) {
        homeServeReceives[3]+=1
        updateStats()
    }
    
    
    @IBAction func awayOneAction(_ sender: UIButton) {
        awayServeReceives[1]+=1
        updateStats()
    }
    
    
    @IBAction func awayTwoAction(_ sender: UIButton) {
        awayServeReceives[2]+=1
        updateStats()
    }
    
    
    @IBAction func awayThreeAction(_ sender: UIButton) {
        awayServeReceives[3]+=1
        updateStats()
    }
    
    
    @IBAction func homeOneMinusAction(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began{
            if homeServeReceives[1] > 0{
                homeServeReceives[1]-=1
                print(homeServeReceives[1])
                updateStats()
            }
        }
    }
    
}

