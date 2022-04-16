//
//  PeopleViewController.swift
//  VMApp
//
//  Created by Cerence Pace Mac on 12/04/22.
//

import UIKit

class PeopleViewController: UIViewController {
    
    @IBOutlet weak var contactsTableView: UITableView!
    var peopleModel = PeopleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleModel.delegate = self
        peopleModel.getAllListOfPeople()
        contactsTableView.register(UINib(nibName: "PeopleTableViewCell", bundle: nil), forCellReuseIdentifier: "PeopleTableViewCell")
        // Do any additional setup after loading the view.
    }
    
    func displayErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "Failed to fetch the data from server", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: false, completion: nil)
    }

}

extension PeopleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        peopleModel.peopleArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleTableViewCell") as? PeopleTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCellUI(people: peopleModel.peopleArray[indexPath.row])
        return cell
    }
    
}

extension PeopleViewController: PeopleViewModelDelegate {
    
    func didReceivePeopleList() {
        DispatchQueue.main.async {
            self.contactsTableView.reloadData()
        }
    }
    
    func didReceiveError() {
        DispatchQueue.main.async {
            self.displayErrorAlert()
        }
    }
    
    
}
