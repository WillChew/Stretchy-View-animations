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
    @IBOutlet weak var navBar: UIView!
    
    
    var stackView: UIStackView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let ramenImage = UIImage(named: "ramen")
        let ramenImageView = UIImageView(image: ramenImage)
        ramenImageView.contentMode = .scaleAspectFit
        
        
        let oreoImage = UIImage(named: "oreos")
        let oreoImageView = UIImageView(image: oreoImage)
        oreoImageView.contentMode = .scaleAspectFit
        oreoImageView.frame.size.height = navBar.frame.size.height/2

        
        let pizzaImage = UIImage(named: "pizza_pockets")
        let pizzaImageView = UIImageView(image: pizzaImage)
        pizzaImageView.contentMode = .scaleAspectFit
        pizzaImageView.frame.size.height = navBar.frame.size.height/2

        let poptartImage = UIImage(named: "pop_tarts")
        let poptartImageView = UIImageView(image: poptartImage)
        poptartImageView.contentMode = .scaleAspectFit
        poptartImageView.frame.size.height = navBar.frame.size.height/2

        let popsicleImage = UIImage(named: "popsicle")
        let popsicleImageView = UIImageView(image: popsicleImage)
        popsicleImageView.contentMode = .scaleAspectFit
        popsicleImageView.frame.size.height = navBar.frame.size.height/2

      
        
        
        stackView = UIStackView(arrangedSubviews: [ramenImageView, oreoImageView, pizzaImageView, poptartImageView, popsicleImageView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        stackView.isHidden = true
        
        

        self.view.layoutIfNeeded()

        
        navBar.addSubview(stackView)
        
        stackView.leftAnchor.constraint(equalTo: navBar.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: navBar.rightAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: navBar.topAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: navBar.heightAnchor).isActive = true
        
        
        
        
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        
        expandNav()
        
    }
    
    func expandNav(){
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            
            
            self.plusButtonOutlet.transform = self.plusButtonOutlet.transform.rotated(by: .pi/4)
            
            if self.navBarHeight.constant == 64 {
                self.navBarHeight.constant = 200
                
                self.stackView.isHidden = false
                self.navBar.bringSubview(toFront: self.plusButtonOutlet)
                
            } else {
                self.navBarHeight.constant = 64
                self.stackView.isHidden = true
            }
            self.view.layoutIfNeeded()
            
        }) { finished in
            
            print("plus button pressed")
        }
    }
    
    
    
    
    
}

