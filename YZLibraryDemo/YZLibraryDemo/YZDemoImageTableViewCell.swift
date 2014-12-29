/*
 
 Copyright (c) 2015 Scinece guy
 
 */
import UIKit

@objc class YZDemoImageTableViewCell: UITableViewCell {

	@IBOutlet weak var mainImageView: UIImageView!
	@IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

