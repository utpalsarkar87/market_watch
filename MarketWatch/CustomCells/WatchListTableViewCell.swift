//
//  WatchListTableViewCell.swift
//  MarketWatch
//
//  Created by Senrysa on 28/02/21.
//

import UIKit

class WatchListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblStockName: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblStockPrice: UILabel!
    @IBOutlet weak var lblPercentageChange: PaddingLabel!
    @IBOutlet weak var lblPostValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
