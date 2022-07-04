//
//  TableViewCell.swift
//  BigBurger
//
//  Created by cgismoove on 04/07/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDesc: UILabel!
    @IBOutlet weak var cellPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(data: BurgerResponse) {
        cellTitle.text = data.title
        cellDesc.text = data.burgerResponseDescription
        cellPrice.text = String(data.price)
        cellImage.loadFrom(URLAddress: data.thumbnail)
    }
    
}
