//
//  ViewController.swift
//  NavigationExperiment3ProgrammaticContainerChild
//
//  Created by Albert Yu on 5/7/20.
//  Copyright © 2020 AlbertDemo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    
    lazy var blueViewController: UIViewController! = {
      return self.storyboard?.instantiateViewController(withIdentifier: "viewOne")
    }()

    lazy var orangeViewController: UIViewController! = {
      return self.storyboard?.instantiateViewController(withIdentifier: "viewTwo")
    }()
    
    

    
    let storyboardNew = UIStoryboard(name: "Main", bundle: .main)
    

    
    @IBOutlet weak var gradientView: UIView!
    @IBAction func viewOneButtonPressed(_ sender: Any) {
        view.sendSubviewToBack(orangeViewController.view)
    }
    
    @IBAction func viewTwoButtonPressed(_ sender: Any) {
        view.sendSubviewToBack(blueViewController.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientView.setGradeientBackground(colorOne: .greenApples, colorTwo: .white, colorThree: .surfsUp)
        setupViews()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupViews(){
        addChild(blueViewController)
        view.addSubview(blueViewController.view)
        blueViewController.didMove(toParent: self)
        view.sendSubviewToBack(blueViewController.view)
            
        
        

        addChild(orangeViewController)
        view.addSubview(orangeViewController.view)

               
        orangeViewController.didMove(toParent: self)
        view.sendSubviewToBack(orangeViewController.view)
    }


}

