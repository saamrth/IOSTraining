//
//  ViewController.swift
//  StateTableViewHW
//
//  Created by Saamrth Kalia on 2/11/21.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    var stateData: [String] = []
    var plistData: [String: AnyObject] = [:]
    var tappedState : [String] = []
    
    @IBOutlet weak var stateTableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stateData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = stateData[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tappedState = plistData[self.stateData[indexPath.row]] as! [String]

        self.performSegue(withIdentifier: "SegueOne", sender: self)
    }
   
    func getData() {
        var propertyListFormat = PropertyListSerialization.PropertyListFormat.xml //Format of the Property List.
        let plistPath: String? = Bundle.main.path(forResource: "config", ofType: "plist")! //the path of the data
        let plistXML = FileManager.default.contents(atPath: plistPath!)!
        do { //convert the data to a dictionary and handle errors.
            plistData = try PropertyListSerialization.propertyList(from: plistXML, options: .mutableContainersAndLeaves, format: &propertyListFormat) as! [String:AnyObject]
            self.stateData = plistData.keys.sorted()
            self.stateTableView.reloadData()
            } catch {
            print("Error reading plist: \(error), format: \(propertyListFormat)")
        }
      
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueOne" {
            let destinationVC = segue.destination as! SecondTableViewController
            destinationVC.zipData = tappedState
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stateTableView.delegate = self
        stateTableView.dataSource = self
        getData()
        
    }
}




