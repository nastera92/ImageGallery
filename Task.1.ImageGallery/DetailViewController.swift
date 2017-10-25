//
//  DetailViewController.swift
//  Task.1.ImageGallery
//
//  Created by Natalia Kapusta on 05/04/2017.
//  Copyright © 2017 Natalia Kapusta. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView:UIImageView!
    
    var imageFile = "";
    var index=0

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named:imageFile)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
