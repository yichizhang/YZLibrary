/*
 
 Copyright (c) 2015 Yichi Zhang
 https://github.com/yichizhang
 zhang-yi-chi@hotmail.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

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