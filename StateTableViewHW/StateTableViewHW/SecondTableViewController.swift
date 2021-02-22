//
//  SecondTableViewController.swift
//  StateTableViewHW
//
//  Created by Saamrth Kalia on 2/11/21.
//

import UIKit

class SecondTableViewController: UITableViewController  {
    @IBOutlet var zipTableView: UITableView!
    var zipData = [String]()
    var newZip = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zipTableView.delegate = self
        zipTableView.dataSource = self
        
        
  
    
    }

   

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return zipData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        cell.textLabel?.text = zipData[indexPath.row]
        return cell
    }
    

   

}
