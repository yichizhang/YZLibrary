//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

let demoTableViewDefaultCell: String = "DefaultCell"

enum DemoTableViewSection: Int
{
    case images = 0
    case copyright = 1
    case count = 2
}

import UIKit

class YZLazyRegisterNibAndCellTableViewController: UITableViewController
{

    let photoSourceArray: Array<String> =
    [
        "https://www.flickr.com/photos/fscholz/13540618215/",
        "https://www.flickr.com/photos/fscholz/13540944634/",
        "https://www.flickr.com/photos/fscholz/13540948104/",
        "https://www.flickr.com/photos/fscholz/13540949594/",
        "https://www.flickr.com/photos/fscholz/13540733933/",
        "https://www.flickr.com/photos/fscholz/13540736793/"
    ]

    func commonInit()
    {
        self.title = "Table View";
    }

    override init(style: UITableViewStyle)
    {
        super.init(style: style)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.commonInit()
    }


    override func viewDidLoad()
    {
        super.viewDidLoad()

        let info = YZProcessInfo()
        if info.isOperatingSystem(atLeastMajorVersion: 8) == false {

            UIAlertView.yz_show(withTitle: "You are using iOS\(info.operatingSystemVersion.majorVersion)", message: "Table view auto layout/ auto cell height may not work properly in this version of iOS.", cancelButtonTitle: "OK")
        }

        YZDemoImageTableViewCell.yz_register(for: self.tableView)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: demoTableViewDefaultCell)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()


        self.yz_dispatch(onMainQueue: {
                                        () -> Void in
                                        print("Disptaching on the main queue")
                                    }, afterDelay: TimeInterval(1)
        )
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return DemoTableViewSection.count.rawValue
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if let s: DemoTableViewSection = DemoTableViewSection(rawValue: section) {

            switch s {
            case .copyright:
                return 1
            case .images:
                return 6
            default:
                return 0
            }
        }

        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

        if let s: DemoTableViewSection = DemoTableViewSection(rawValue: indexPath.section) {

            switch s {
            case .copyright:
                break
            case .images:
                let cell = YZDemoImageTableViewCell.yz_dequeue(from: tableView, for: indexPath)

                cell?.mainImageView.image = UIImage(named: "demo-\(indexPath.row + 1).jpg")
                cell?.mainImageView.clipsToBounds = true
                cell?.descriptionLabel.text = photoSourceArray[indexPath.row]
                cell?.selectionStyle = UITableViewCellSelectionStyle.none

                return cell!
            default:
                break
            }
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: demoTableViewDefaultCell, for: indexPath)

        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text =
        "Author of the photos: fscholz\n\n" +
        "Link: \n" +
        "https://www.flickr.com/photos/fscholz/\n\n" +
        "Licence: Creative Commons Attribution 4.0 International (CC BY 4.0)";

        cell.selectionStyle = UITableViewCellSelectionStyle.none

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {

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

