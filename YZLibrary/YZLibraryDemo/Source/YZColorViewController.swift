//
//  Copyright (c) 2017-present, Yichi Zhang.
//  https://github.com/yichizhang
//  zhang-yi-chi@hotmail.com
//
//  This source code is licensed under the MIT-style license found
//  in the LICENSE file in the root directory of this source tree.
//

import Foundation
import UIKit

class YZColorViewController: UITableViewController
{
    var colorArray: [UIColor]!
    let CellId_ComplementaryColorsCell = "ComplementaryColorsCell"

    override func viewDidLoad()
    {
        super.viewDidLoad()

        title = "Colors"

        colorArray = [
            UIColor.red,
            UIColor.blue,
            UIColor.brown,
            UIColor.gray,
            UIColor.green,
            UIColor.purple,
            UIColor.cyan
        ]
    }

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colorArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId_ComplementaryColorsCell, for: indexPath)

        let originalColor = colorArray[indexPath.row]
        let complementaryColor = originalColor.yz_complementary()

        let originalColorView = cell.contentView.viewWithTag(10)!
        let complementaryColorView = cell.contentView.viewWithTag(11)!

        originalColorView.layer.cornerRadius = originalColorView.frame.width / 2
        complementaryColorView.layer.cornerRadius = complementaryColorView.frame.width / 2

        originalColorView.backgroundColor = originalColor
        complementaryColorView.backgroundColor = complementaryColor

        cell.selectionStyle = .none

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60
    }
}
