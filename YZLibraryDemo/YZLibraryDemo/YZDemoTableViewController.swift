//
//  YZDemoTableViewController.swift
//  YZLibraryDemo
//
//  Created by Yichi on 15/12/2014.
//  Copyright (c) 2014 yichizhang. All rights reserved.
//

let demoTableViewDefaultCell:String = "DefaultCell"

enum DemoTableViewSection : Int {
	case Images = 0
	case Copyright = 1
	case Count = 2
}

import UIKit

class YZDemoTableViewController: UITableViewController {

	let photoSourceArray:Array<String> =
	[
		"https://www.flickr.com/photos/fscholz/13540618215/",
		"https://www.flickr.com/photos/fscholz/13540944634/",
		"https://www.flickr.com/photos/fscholz/13540948104/",
		"https://www.flickr.com/photos/fscholz/13540949594/",
		"https://www.flickr.com/photos/fscholz/13540733933/",
	 	"https://www.flickr.com/photos/fscholz/13540736793/"
	]
	
	func commonInit(){
		self.title = "Table View";
		self.tabBarItem = UITabBarItem(title: self.title, image: YZLibraryDemoStyleKit.imageOfThree, tag: 2)
	}
	
	override init(style: UITableViewStyle) {
		super.init(style: style)
		self.commonInit()
	}
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.commonInit()
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

		YZDemoImageTableViewCell.yz_registerForTableView(self.tableView)
		self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: demoTableViewDefaultCell)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return DemoTableViewSection.Count.rawValue
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
		if let s:DemoTableViewSection = DemoTableViewSection(rawValue: section){
		
			switch s {
				case .Copyright:
					return 1
				case .Images:
					return 6
				default:
					return 0
			}
		}
		
		return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		if let s:DemoTableViewSection = DemoTableViewSection(rawValue: indexPath.section){
			
			switch s {
			case .Copyright:
				break
			case .Images:
				let cell = YZDemoImageTableViewCell.yz_dequeueFromTableView(tableView, forIndexPath: indexPath)
				
				cell.mainImageView.image = UIImage(named: "demo-\(indexPath.row+1).jpg")
				cell.mainImageView.clipsToBounds = true
				cell.descriptionLabel.text = photoSourceArray[indexPath.row]
				cell.selectionStyle = UITableViewCellSelectionStyle.None
				
				return cell
			default:
				break
			}
		}
		
		let cell = tableView.dequeueReusableCellWithIdentifier(demoTableViewDefaultCell, forIndexPath: indexPath) as UITableViewCell
		
		cell.textLabel?.numberOfLines = 0
		cell.textLabel?.text =
		"Author of the photos: fscholz\n\n" +
		"Link: \n" +
		"https://www.flickr.com/photos/fscholz/\n\n" +
		"Licence: Creative Commons Attribution 4.0 International (CC BY 4.0)";
		
		cell.selectionStyle = UITableViewCellSelectionStyle.None
		
        return cell
    }
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		
		return UITableViewAutomaticDimension
		
	}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}