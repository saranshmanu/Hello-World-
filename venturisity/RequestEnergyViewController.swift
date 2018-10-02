//
//  RequestEnergyViewController.swift
//  venturisity
//
//  Created by Saransh Mittal on 02/10/18.
//  Copyright © 2018 Saransh Mittal. All rights reserved.
//

import UIKit

class RequestEnergyViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var uniqueCodePage: UIVisualEffectView!
    @IBOutlet weak var factoryImageView: UIImageView!
    @IBOutlet weak var surplusEnergy: UILabel!
    @IBOutlet weak var factoryLocation: UILabel!
    @IBOutlet weak var factoryName: UILabel!
    
    func dropShadow(viewShadow: UIButton){
        viewShadow.center = self.view.center
        viewShadow.backgroundColor = #colorLiteral(red: 0.1794759333, green: 0.1844948828, blue: 0.2565110922, alpha: 1)
        viewShadow.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewShadow.layer.shadowOpacity = 0.4
        viewShadow.layer.shadowOffset = CGSize.zero
        viewShadow.layer.shadowRadius = 5
    }
    
    var constant:CGFloat = 100

    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3) {
            self.upperConstraint.constant -= self.constant
            self.lowerConstraint.constant += self.constant
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func ContinueButtonAction(_ sender: Any) {
        self.uniqueCodePage.isHidden = false
        self.uniqueCodePage.alpha = 0.0
        let alert = UIAlertController(title: "Completed", message: "Your request for surplus energy is sent. Wait for the owner to approve!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var ContinueButton: UIButton!
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !(self.requestedUnitField.isEditing) {
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 0.3, animations: {
                self.upperConstraint.constant += self.constant
                self.lowerConstraint.constant -= self.constant
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func requestEnergyAction(_ sender: Any) {
        uniqueCodePage.isHidden = false
        uniqueCodePage.alpha = 1.0
    }
    
    @IBOutlet weak var upperConstraint: NSLayoutConstraint!
    @IBOutlet weak var lowerConstraint: NSLayoutConstraint!
    @IBOutlet weak var requestedUnitField: UITextField!
    @IBOutlet weak var requestEnergyButton: UIButton!
    
    @objc func dismissKeyboard() {
        requestedUnitField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dropShadow(viewShadow: requestEnergyButton)
        requestedUnitField.layer.borderWidth = 1
        requestedUnitField.layer.borderColor = #colorLiteral(red: 0.2196078431, green: 0.2235294118, blue: 0.3019607843, alpha: 1)
        requestedUnitField.delegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(RequestEnergyViewController.dismissKeyboard)))
        updateTextField()
    }
    
    func updateTextField(){
        factoryImageView.image = UIImage.init(named:selectedFactoryImageName)
        surplusEnergy.text = String(selectedFactorySurplusEnergy) + " UNITS"
        factoryLocation.text = selectedFactoryLocation
        factoryName.text = selectedFactoryName
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
