//
//  ExperienceViewController.swift
//  StartChain
//
//  Created by Max Dovhopolyi on 6/14/22.
//

import UIKit
import SwiftUI
import TTGTags

class SkillsViewController: UIViewController, TTGTextTagCollectionViewDelegate {
  
    private var selections = [String]()
    
    @IBOutlet weak var mainStackView: UIStackView!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Skill set"
        
       
        let tagView = TTGTextTagCollectionView()
        
       
    
        tagView.delegate = self
        
        
        
    
        view.addSubview(tagView)
       // self.view.addSubview(tagView)
        tagView.alignment = .fillByExpandingWidth
        
        let strings = ["C# developer", "Java developer", "Unity3D developer", "UI designer", "Mobile UI designer", "Game designer", "Graphic designer",
                       "Web developer", "3D artist", "Game artist", "Project manager","C# developer"]
        
        for text in strings {
            let content = TTGTextTagStringContent.init(text: text)
            content.textColor = UIColor.white
            content.textFont = UIFont.systemFont(ofSize: 20)
            
            let normalStyle = TTGTextTagStyle.init()
            normalStyle.backgroundColor = UIColor.init(red: 1, green: 0.5, blue: 0, alpha: 0.5)
            normalStyle.extraSpace = CGSize.init(width: 8, height: 8)
            normalStyle.borderWidth = 0
            normalStyle.shadowOpacity = 0
            normalStyle.cornerRadius = 20
            
            let selectedStyle = TTGTextTagStyle.init()
            selectedStyle.backgroundColor = UIColor.init(red: 1, green: 0.5, blue: 0, alpha: 1)
            selectedStyle.extraSpace = CGSize.init(width: 8, height: 8)
            selectedStyle.borderWidth = 0
            selectedStyle.shadowOpacity = 0
            selectedStyle.cornerRadius = 20
            
            let tag = TTGTextTag.init()
            tag.content = content
            tag.style = normalStyle
            tag.selectedStyle = selectedStyle
            
            
            tagView.addTag(tag)
        }
      
        tagView.translatesAutoresizingMaskIntoConstraints = false
            let horizontalConstraint = NSLayoutConstraint(item: tagView, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 20)
            let verticalConstraint = NSLayoutConstraint(item: tagView, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: -20)
            let widthConstraint = NSLayoutConstraint(item: tagView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 150)
            let heightConstraint = NSLayoutConstraint(item: tagView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 300)
            view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        
        tagView.reload()
        
        
        
       


        // Do any additional setup after loading the view.
    }
    
    
    
    func textTagCollectionView(_ textTagCollectionView: TTGTextTagCollectionView!, didTap tag: TTGTextTag!, at index: UInt) {
        let tagtext : TTGTextTagStringContent = tag.content
        as! TTGTextTagStringContent
        
        addSelections(tagtext.text)
        
 
        
    }
    
    func addSelections(_ content : String){
        if let index = selections.firstIndex(of: content) {
            selections.remove(at: index)
            print(selections)
            return
        }
        else {
            selections.append(content)
        }
        print(selections)
        
    }
    
    @IBAction func nextPageBtnClicked(_ sender: Any) {
        if selections.count == 0{
            present(Utilities.AlertHandler("Error","You have to choose at least one skill"), animated: true)
        }
        else{
            let data = ["skill_set" : selections]
            Data.setDataForUser(data){
                UserInfo.skill_set = self.selections
                Coordinator.changeViewControllerWithIdentifier("HomeTBC", "Home")
            }
        }
        
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
