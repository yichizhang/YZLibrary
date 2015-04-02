//
//  YZOtherViewController.swift
//  YZLibraryDemo
//
//  Created by Yichi on 7/01/2015.
//  Copyright (c) 2015 yichizhang. All rights reserved.
//

import UIKit

class YZOtherViewController: UIViewController {

	func commonInit(){
		self.title = "Other";
		self.tabBarItem = UITabBarItem(title: self.title, image: YZLibraryDemoStyleKit.imageOfFour, tag: 3)
	}
	
	required override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		self.commonInit()
	}
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.commonInit()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		let awesomeView = AwesomeNibView.yz_loadFromNib()
		self.view.addSubview(awesomeView)
		awesomeView.center = self.view.center
		
    }

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
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
