//
//  RoomsViewController.swift
//  VMApp
//
//  Created by Cerence Pace Mac on 12/04/22.
//

import UIKit

class RoomsViewController: UIViewController {
    
    @IBOutlet weak var roomsTableView: UITableView!
    var roomsModel = RoomsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roomsModel.delegate = self
        roomsModel.getAllListOfRooms()
        // Do any additional setup after loading the view.
        roomsTableView.register(UINib(nibName: "RoomsTableViewCell", bundle: nil), forCellReuseIdentifier: "RoomsTableViewCell")
    }
    
    func displayErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "Failed to fetch the data from server", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: false, completion: nil)
    }
    
}

extension RoomsViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        roomsModel.roomsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RoomsTableViewCell") as? RoomsTableViewCell else {
            return UITableViewCell()
        }
        cell.updateCellUI(room: roomsModel.roomsArray[indexPath.row])
        return cell
    }
    
}

extension RoomsViewController: RoomsViewModelDelegate {
    
    func didReceiveRoomsList() {
        DispatchQueue.main.async {
            self.roomsTableView.reloadData()
        }
    }
    
    func didReceiveError() {
        DispatchQueue.main.async {
            self.displayErrorAlert()
        }
    }
    
    
}
