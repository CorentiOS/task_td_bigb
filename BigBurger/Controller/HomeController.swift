//
//  ViewController.swift
//  BigBurger
//
//  Created by cgismoove on 04/07/2022.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet weak var mTable: UITableView!
    var burgerList = ["Test", "Burger 1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mTable.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        mTable.dataSource = self
    }
}

extension HomeController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return burgerList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        return cell
    }
}


