//
//  SwipePageViewController.swift
//  Task.1.ImageGallery
//
//  Created by Natalia Kapusta on 05/04/2017.
//  Copyright © 2017 Natalia Kapusta. All rights reserved.
//

import UIKit

class SwipePageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var imageFile = ""
    var index = 0
    var images = [""]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource=self
        self.automaticallyAdjustsScrollViewInsets=false
        
        if let startingViewController = detailViewController(at:index){
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! DetailViewController).index
        index-=1
        
        return detailViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! DetailViewController).index
        index+=1
        
        return detailViewController(at: index)
    }
    
    func detailViewController(at index:Int) -> DetailViewController?{
        if index<0||index>=12{
            return nil
        }
        
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController{
            //detailViewController.imageFile = imageFile
            detailViewController.imageFile = images[index]
            detailViewController.index=index
            return detailViewController
        }
        return nil
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
