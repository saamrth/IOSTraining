//
//  UpdateViewController.swift
//  StateTableViewHW
//
//  Created by Saamrth Kalia on 2/11/21.
//

import UIKit

class UpdateViewController: UIViewController {
    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateZip(_ sender: UIButton) {
        
        performSegue(withIdentifier: "SegueThree", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SecondTableViewController
        vc.newZip = self.textfield.text!
        

        
        
    }
    
   

}
