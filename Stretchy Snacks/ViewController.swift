//
//  ViewController.swift
//  Stretchy Snacks
//
//  Created by Will Chew on 2018-07-19.
//  Copyright © 2018 Will Chew. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate{
    
    @IBOutlet weak var plusButtonOutlet: UIButton!
    @IBOutlet weak var navBarHeight: NSLayoutConstraint!
    @IBOutlet weak var navBar: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var ramenImageView: UIImageView!
    var oreoImageView: UIImageView!
    var pizzaImageView: UIImageView!
    var poptartImageView: UIImageView!
    var popsicleImageView: UIImageView!
    
    
    
    var stackView: UIStackView!
    var foodTitles: [String] = []
    var tapGesture = UITapGestureRecognizer()

    @objc func handleTap(){
        
        print("ramen")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        
        
        let ramenImage = UIImage(named: "ramen")
        ramenImageView = UIImageView(image: ramenImage)
        ramenImageView.contentMode = .scaleAspectFit
        ramenImageView.isUserInteractionEnabled = true
        ramenImageView.addGestureRecognizer(self.tapGesture)
        ramenImageView.tag = 1

        
        let oreoImage = UIImage(named: "oreos")
        oreoImageView = UIImageView(image: oreoImage)
        oreoImageView.contentMode = .scaleAspectFit
        oreoImageView.isUserInteractionEnabled = true
        oreoImageView.tag = 2


        
        let pizzaImage = UIImage(named: "pizza_pockets")
        pizzaImageView = UIImageView(image: pizzaImage)
        pizzaImageView.contentMode = .scaleAspectFit
        pizzaImageView.isUserInteractionEnabled = true
        pizzaImageView.tag = 3

        
        let poptartImage = UIImage(named: "pop_tarts")
        poptartImageView = UIImageView(image: poptartImage)
        poptartImageView.contentMode = .scaleAspectFit
        poptartImageView.isUserInteractionEnabled = true
        poptartImageView.tag = 4
        

        let popsicleImage = UIImage(named: "popsicle")
        popsicleImageView = UIImageView(image: popsicleImage)
        popsicleImageView.contentMode = .scaleAspectFit
        popsicleImageView.isUserInteractionEnabled = true
        popsicleImageiew.tag = 5


      
        
        
        stackView = UIStackView(arrangedSubviews: [ramenImageView, oreoImageView, pizzaImageView, poptartImageView, popsicleImageView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        stackView.isHidden = true
        
        

       

        
        navBar.addSubview(stackView)

        stackView.leftAnchor.constraint(equalTo: navBar.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: navBar.rightAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: navBar.topAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: navBar.heightAnchor).isActive = true
        
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        

         self.view.layoutIfNeeded()
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
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return foodTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FoodNameCell", for: indexPath) as? FoodNameCellTableViewCell else {
            fatalError("Failed")
        }
        
        
        cell.foodNameLabel.text = foodTitles[indexPath.row]
        return cell
        
    }
}
    



    
    
    
    
    


