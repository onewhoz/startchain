//
//  ProfileViewController.swift
//  StartChain
//
//  Created by Max Dovhopolyi on 6/19/22.
//

import UIKit





class TestProfileViewController: UIViewController, UIScrollViewDelegate {
    
    
    
    
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!

   
    
  
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        title = "Hello \(UserInfo.first_name!)"
        navigationController?.title = ""
        scrollView.delegate = self
        
        let textLabel = UILabel()
        textLabel.numberOfLines = 0
        textLabel.backgroundColor = UIColor.clear
        textLabel.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
       
    
        
        //textLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        textLabel.text  = "Reasons for colonizing Mars include curiosity, the potential for humans to provide more in-depth observational research than uncrewed rovers, economic interest in its resources, and the possibility that the settlement of other planets could decrease the likelihood of human extinction. Difficulties and hazards include radiation exposure during a trip to Mars and on its surface, toxic soil, low gravity, the isolation that accompanies Mars' distance from Earth, a lack of water, and cold temperatures."
        textLabel.textAlignment = .center
        
        let textLabel1 = UILabel()
        textLabel1.numberOfLines = 0
        textLabel1.backgroundColor = UIColor.clear
        textLabel1.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
       
    
        
        //textLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        textLabel1.text  = "Reasons for colonizing Mars include curiosity, the potential for humans to provide more in-depth observational research than uncrewed rovers, economic interest in its resources, and the possibility that the settlement of other planets could decrease the likelihood of human extinction. Difficulties and hazards include radiation exposure during a trip to Mars and on its surface, toxic soil, low gravity, the isolation that accompanies Mars' distance from Earth, a lack of water, and cold temperatures."
        textLabel1.textAlignment = .justified
        
  
        
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(textLabel1)
    
        

        
        
        
        
        

      
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if(velocity.y>0) {
               //Code will work without the animation block.I am using animation block incase if you want to set any delay to it.
            UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions(), animations: {
                   self.navigationController?.setNavigationBarHidden(true, animated: true)
                   print("Hide")
               }, completion: nil)

           } else {
               UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions(), animations: {
                   self.navigationController?.setNavigationBarHidden(false, animated: true)
                   print("Unhide")
               }, completion: nil)
             }
    }
  

  
}

//in playground we should have a red rectangle

