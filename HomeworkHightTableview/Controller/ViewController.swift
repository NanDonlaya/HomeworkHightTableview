//
//  ViewController.swift
//  HomeworkHightTableview
//
//  Created by Donlaya on 30/10/2561 BE.
//  Copyright © 2561 Donlaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var tableviewConnnectView: UITableView!
    @IBOutlet weak var heightTableview: NSLayoutConstraint!
    @IBOutlet weak var firstLB: UILabel!
    @IBOutlet weak var secondLB: UILabel!
    @IBOutlet weak var thirdLB: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var data = ["Dress", "Shoes", "Bag", "Belt"]
    var searching = [String]()
    var isSearch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstLB.text = "Hello!"
        secondLB.text = "Mr."
        thirdLB.text = "Ton Attapong Jakkravalthanarak"
        
        tableviewConnnectView.register(UINib(nibName: "TableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "TableViewCell")
        
        tableviewConnnectView.rowHeight = 1650
        
        tableviewConnnectView.isScrollEnabled = false
        
        searchBar.delegate = self
        
        searchBar.returnKeyType = UIReturnKeyType.done
    }
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        
//        searching = data.filter({ (names: String) -> Bool in
//            return names.lowercasedStrin
//        })
//        isSearch = true
//        tableviewConnnectView.reloadData()
//    }
    
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearch {
            
            return searching.count
        }
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableviewConnnectView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        if isSearch {
            cell.cellLabel.text = searching[indexPath.row]
        } else {
            cell.cellLabel.text = data[indexPath.row]
        }
        
        self.heightTableview.constant = self.tableviewConnnectView.contentSize.height
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return UITableView.automaticDimension
//    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return 100
//    }
        
}
  



