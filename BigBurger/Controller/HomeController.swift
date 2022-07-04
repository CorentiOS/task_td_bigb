//
//  ViewController.swift
//  BigBurger
//
//  Created by cgismoove on 04/07/2022.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var mTable: UITableView!
    
    var burgerList = [BurgerResponse]()
    let api = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = URL(string: "https://uad.io/bigburger/")
        
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            if error != nil {
                print(error ?? "")
                return
            }
            do {
                let result = try JSONDecoder().decode([BurgerResponse].self, from: data!)
                DispatchQueue.main.async {
                    self.burgerList = result
                    self.mTable.reloadData()
                    print("Data OK")
                }
            }
            catch {
                print("Erreur \(error)")
                showErrorAlert()
                
            }
        }.resume()
        
        mTable.dataSource = self
        mTable.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}

func showErrorAlert() {
    let dialogMessage = UIAlertController(title: "Ok", message: "Impossible de récupérer les données", preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default)
    dialogMessage.addAction(ok)
    dialogMessage.present(dialogMessage, animated: true, completion: nil)
}

//func getAPICallback() {
//    let api = URL(string: "https://uad.io/bigburger/")
//    api.getRemoteData {
//        data in
//        self.burgerList = data
//        DispatchQueue.main.async {
//            self.mTable.reloadData()
//        }
//    }
//}



extension HomeController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return burgerList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        cell.bind(data: burgerList[indexPath.row])
        return cell
    }
}


