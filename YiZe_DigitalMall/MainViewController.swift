//
//  MainViewController.swift
//  		
//
//  Created by dmqlMAC on 16/1/8.
//  Copyright © 2016年 dmqlMAC. All rights reserved.
//

import UIKit

@objc
protocol MainViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func collapseSidePanels()
}

class MainViewController: UIViewController {
    
    var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func MainViewContainer(segue:UIStoryboardSegue){
        delegate?.toggleLeftPanel?()
    }
    
    
    @IBAction func Sort2ndTableViewCellClick(segue:UIStoryboardSegue){
        delegate?.toggleLeftPanel?()
        NSNotificationCenter.defaultCenter().postNotificationName("MainTabBarView", object: nil)
        NSNotificationCenter.defaultCenter().postNotificationName("SearchTabBarView", object: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
