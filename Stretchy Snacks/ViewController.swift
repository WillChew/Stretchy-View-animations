//
//  ViewController.swift
//  Stretchy Snacks
//
//  Created by Will Chew on 2018-07-19.
//  Copyright © 2018 Will Chew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plusButtonOutlet: UIButton!
    @IBOutlet weak var navBarHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func plusButtonPressed(_ sender: UIButton) {
        
    expandNav()
//        navBarHeight.constant = 200
    }
    
    func expandNav(){
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.navBarHeight.constant = self.navBarHeight.constant == 64 ? 200 : 64
            self.plusButtonOutlet.transform = self.plusButtonOutlet.transform.rotated(by: .pi/4)
            self.view.layoutIfNeeded()
        }) { finished in
            print("plus button pressed")
        }
    }
    
    
    
    
    
}

