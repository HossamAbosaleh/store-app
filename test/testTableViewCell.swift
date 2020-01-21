//
//  testTableViewCell.swift
//  test
//
//  Created by Abu Salleeiihh on 1/11/20.
//  Copyright © 2020 Abu Salleeiihh. All rights reserved.
//

import UIKit

class testTableViewCell: UITableViewCell {
 @IBOutlet var nameStoreLable : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setCell(store:StoreType) {
        nameStoreLable.text = store.name
        

    }

}
