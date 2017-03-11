//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

import UIKit

class AAAView: UIView
{
    override func draw(_ rect: CGRect)
    {
        ("DRAW\nAT\nCENTER" as NSString).yz_drawAtCenter(in: rect, font: UIFont.boldSystemFont(ofSize: 30), color: UIColor.white)
    }
}

class YZAutoLayoutViewController: UIViewController {
    var testView = AAAView(frame: .zero)

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.edgesForExtendedLayout = UIRectEdge()

        view.addSubview(testView)
        testView.backgroundColor = UIColor.red
        testView.yz_setupConstraintsAdhereToEdgesOfSuperview(with: UIEdgeInsets(top: 10,
                                                                                    left: 20,
                                                                                    bottom: 40,
                                                                                    right: 80))
    }

    override func didReceiveMemoryWarning()
    {
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
