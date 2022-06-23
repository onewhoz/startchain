//
//  EditCollectionViewController.swift
//  StartChain
//
//  Created by Max Dovhopolyi on 6/22/22.
//

import UIKit

private let reuseIdentifier = "Cell"
var arrayOfCells = [UICollectionViewCell]()

class EditCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        
        
        title = UserInfo.first_name!

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let UINibEdit = UINib(nibName: "EditCollectionViewCell", bundle: nil)
        let UINibView = UINib(nibName: "ViewCollectionViewCell", bundle: nil)
        self.collectionView.register(UINibView, forCellWithReuseIdentifier: "View")
        self.collectionView.register(UINibEdit, forCellWithReuseIdentifier: "Edit")
        self.collectionView.isPagingEnabled = true

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        dismiss(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource



    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        switch indexPath.row{
        case 0:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Edit", for: indexPath)
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "View", for: indexPath)
        default:
            print("Error")
        }
        
        
        
        
        

    
        // Configure the cell
    
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width, height: view.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
