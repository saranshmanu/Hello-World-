//
//  SendEnergyViewController.swift
//  venturisity
//
//  Created by Saransh Mittal on 02/10/18.
//  Copyright © 2018 Saransh Mittal. All rights reserved.
//

import UIKit

var total = 1

class SendEnergyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return total
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = requestedDemandTableView.dequeueReusableCell(withIdentifier: "send", for: indexPath) as UITableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        total = 0
        requestedDemandTableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: "Enter the unique PIN to approve", message: "", preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Continue", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
            let alert2 = UIAlertController(title: "Completed", message: "Request approved!", preferredStyle: UIAlertControllerStyle.alert)
            alert2.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert2, animated: true, completion: nil)
            self.requestedDemandTableView.reloadData()
        }
        alert.addTextField { (textField) in
            textField.placeholder = "PIN"
        }
        alert.addAction(action)
        present(alert, animated:true, completion: nil)
    }
    

    @IBOutlet weak var requestedDemandTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        requestedDemandTableView.delegate = self
        requestedDemandTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
