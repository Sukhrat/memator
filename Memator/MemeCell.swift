//
//  MemeCell.swift
//  Memator
//
//  Created by Sukhrat on 13.07.17.
//  Copyright © 2017 Sukhrat. All rights reserved.
//

import UIKit
import SDWebImage

class MemeCell: UICollectionViewCell {
    
    @IBOutlet weak var memeImg: UIImageView!
    
    func configureCell(withMemeUrl url: String) {
        
        
        let url = URL(string: url)
        memeImg.sd_setImage(with: url)
        
        
    }

    
}
