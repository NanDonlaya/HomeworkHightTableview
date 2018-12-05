//
//  CollectionViewCell.swift
//  HomeworkHightTableview
//
//  Created by Donlaya on 30/10/2561 BE.
//  Copyright © 2561 Donlaya. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collecImage: UIImageView!
    @IBOutlet weak var collecLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        setNeedsLayout()
        layoutIfNeeded()
        
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        
        print("LAYOUTATTRIBUTES: \(layoutAttributes)")
        
        return layoutAttributes
    }

}
