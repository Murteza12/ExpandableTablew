//
//  TestOneTableViewCell.swift
//  testExpndable
//
//  Created by Murteza on 17/09/2021.
//

import UIKit

class TestOneTableViewCell: UITableViewCell {
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    static var identifier: String {
        return String(describing: self)
    }
    @IBOutlet weak var testTitle : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
