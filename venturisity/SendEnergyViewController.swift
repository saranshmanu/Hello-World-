//
//  SendEnergyViewController.swift
//  venturisity
//
//  Created by Saransh Mittal on 02/10/18.
//  Copyright © 2018 Saransh Mittal. All rights reserved.
//

import UIKit

class SendEnergyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = requestedDemandTableView.dequeueReusableCell(withIdentifier: "send", for: indexPath) as UITableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

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
