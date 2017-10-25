//
//  CollectionViewController.swift
//  Task.1.ImageGallery
//
//  Created by Natalia Kapusta on 05/04/2017.
//  Copyright © 2017 Natalia Kapusta. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ImageCell"

let images = ["sample_0.jpg","sample_1.jpg","sample_2.jpg","sample_3.jpg","sample_4.jpg","sample_5.jpg","sample_6.jpg","sample_7.jpg","sample_8.jpg","sample_9.jpg","sample_10.jpg","sample_11.jpg"]

let images1 = ["song_0.jpg","song_1.jpg","song_2.jpg","song_3.jpg","song_4.jpg","song_5.jpg","song_6.jpg","song_7.jpg","song_8.jpg","song_9.jpg","song_10.jpg","song_11.jpg"]




class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue){
        
    }
    
    let slideDownTransition = SlideDownTransitionAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        // Configure the cell
        cell.imageView.image = UIImage(named: images1[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="showImage"{
            
            if let indexPaths=collectionView?.indexPathsForSelectedItems{
                let destinationController = segue.destination as! SwipePageViewController
                destinationController.transitioningDelegate = slideDownTransition
                destinationController.imageFile = images1[indexPaths[0].row]
                destinationController.index = indexPaths[0].row
                destinationController.images=images1
                collectionView?.deselectItem(at: indexPaths[0], animated: false)
            }
        }
    }
 
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let topBarSize = UIApplication.shared.statusBarFrame.height
        var collectionViewSize = collectionView.frame.size
        collectionViewSize.width = collectionViewSize.width/2.0 //row
        collectionViewSize.height = (collectionViewSize.height-topBarSize)/4.0 //column
    
        return collectionViewSize
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let point = scrollView.contentOffset.y
        print(point)
        
        if(point<69){
            print("1")
            scrollView.setContentOffset(CGPoint(x:0,y:0), animated: true)
        }
        else if(point>69 && point<206){
            print("2")
            scrollView.setContentOffset(CGPoint(x:0,y:137), animated: true)
        }
        else if(point>206 && point<343){
            print("3")
            scrollView.setContentOffset(CGPoint(x:0,y:254), animated: true)
        }
        
        //let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height)
        //print(bottomOffset)
        //scrollView.setContentOffset(bottomOffset, animated: true)
        
        //collectionView?.scrollToItem(at: (collectionView?.indexPathForItem(at: CGPoint(x: 0, y: 431)))!, at: UICollectionViewScrollPosition.centeredVertically, animated: true)
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
