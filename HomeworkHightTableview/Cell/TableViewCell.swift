//
//  TableViewCell.swift
//  HomeworkHightTableview
//
//  Created by Donlaya on 30/10/2561 BE.
//  Copyright © 2561 Donlaya. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var collectionConnectView: UICollectionView!
    @IBOutlet weak var heightCellLabel: UILabel!
    
    var cellMarginSize = 0
    var screen = UIScreen.main.bounds.size
    var myImage = ["1", "2", "3", "4", "5","1", "2", "3", "4"]
    var price = ["$2590", "$3890", "$4690", "$1890", "$3290", "$3890", "$4690", "$3290", "$3890"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionConnectView.dataSource = self
        collectionConnectView.delegate = self
        
        collectionConnectView.register(UINib(nibName: "CollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "CollectionViewCell")
        
        collectionConnectView.isScrollEnabled = false
        
        setGridView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return price.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionConnectView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.collecImage.image = UIImage(named: myImage[indexPath.row])
        cell.collecLabel.text = price[indexPath.row]
        
        return cell
    }
    
}
extension TableViewCell: UICollectionViewDelegateFlowLayout {
    
    func setGridView() {
        
        let flow = collectionConnectView.collectionViewLayout as! UICollectionViewFlowLayout
        let width = CGFloat(screen.width / 2) - 2
        flow.sectionInset.right = CGFloat(cellMarginSize)
        flow.sectionInset.left = CGFloat(cellMarginSize)
        flow.sectionInset.top = CGFloat(cellMarginSize)
        flow.sectionInset.bottom = CGFloat(cellMarginSize)
        flow.minimumInteritemSpacing = 2
        flow.minimumLineSpacing = 2
        flow.scrollDirection = .vertical
        flow.estimatedItemSize = CGSize(width: width, height: 300 - 2)
        //        flow.itemSize = CGSize(width: width, height: 300)
    }
}

