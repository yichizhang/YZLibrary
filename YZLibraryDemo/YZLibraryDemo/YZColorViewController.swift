//
//  YZColorViewController.swift
//  YZLibraryDemo
//
//  Created by Yichi on 2/04/2015.
//  Copyright (c) 2015 yichizhang. All rights reserved.
//

import Foundation
import UIKit

class YZColorViewController : UITableViewController {
	var colorArray:[UIColor]!
	let CellId_ComplementaryColorsCell = "ComplementaryColorsCell"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Colors"
		
		colorArray = [
			UIColor.redColor(),
			UIColor.blueColor(),
			UIColor.brownColor(),
			UIColor.grayColor(),
			UIColor.greenColor(),
			UIColor.purpleColor(),
			UIColor.cyanColor()
		]
	}
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return colorArray.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		if let cell = tableView.dequeueReusableCellWithIdentifier(CellId_ComplementaryColorsCell, forIndexPath: indexPath) as? UITableViewCell {
			
			let originalColor = colorArray[indexPath.row]
			let complementaryColor = originalColor.yz_complementaryColor()
			
			let originalColorView = cell.contentView.viewWithTag(10)!
			let complementaryColorView = cell.contentView.viewWithTag(11)!
			
			originalColorView.layer.cornerRadius = originalColorView.frame.width/2
			complementaryColorView.layer.cornerRadius = complementaryColorView.frame.width/2
			
			originalColorView.backgroundColor = originalColor
			complementaryColorView.backgroundColor = complementaryColor
			
			cell.selectionStyle = .None
			
			return cell
		}
		
		return UITableViewCell(style: .Default, reuseIdentifier: CellId_ComplementaryColorsCell)
	}
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 60
	}
}