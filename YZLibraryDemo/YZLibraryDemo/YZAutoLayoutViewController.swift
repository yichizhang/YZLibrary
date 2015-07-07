/*

Copyright (c) 2015 Yichi Zhang
https://github.com/yichizhang
zhang-yi-chi@hotmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

import UIKit

class AAAView : UIView {
	override func drawRect(rect: CGRect) {
		
		("DRAW\nAT\nCENTER" as NSString).yz_drawAtCenterInRect(rect, font: UIFont.boldSystemFontOfSize(30), color: UIColor.whiteColor())
	}
}

class YZAutoLayoutViewController: UIViewController {

	var testView = AAAView(frame:CGRectZero)
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.edgesForExtendedLayout = UIRectEdge.None
		
        view.addSubview(testView)
		testView.backgroundColor = UIColor.redColor()
		testView.yz_setupConstraintsAdhereToEdgesOfSuperviewWithInsets(
			UIEdgeInsets(
				top: 10,
				left: 20,
				bottom: 40,
				right: 80
			)
		)
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
