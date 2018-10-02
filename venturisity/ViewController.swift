//
//  ViewController.swift
//  venturisity
//
//  Created by Saransh Mittal on 02/10/18.
//  Copyright © 2018 Saransh Mittal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var surplusEnergy: UILabel!
    @IBOutlet weak var nonRenewableEnergy: UILabel!
    @IBOutlet weak var renewableEnergy: UILabel!
    
    var time = 0.4
    
    var factoryInformation = highClassFactory
    
    func statusClassButtonColorChange(high: UIColor, low: UIColor, neutral: UIColor){
        UIView.animate(withDuration: time) {
            self.neutralButtonClass.backgroundColor = neutral
            self.lowButtonClass.backgroundColor = low
            self.highButtonClass.backgroundColor = high
        }
    }
    
    @IBAction func neutralButtonAction(_ sender: Any) {
        statusClassButtonColorChange(high: #colorLiteral(red: 0.1560403705, green: 0.1653948128, blue: 0.2250050604, alpha: 1), low: #colorLiteral(red: 0.1560403705, green: 0.1653948128, blue: 0.2250050604, alpha: 1), neutral: #colorLiteral(red: 0.04112622887, green: 0.8057022691, blue: 0.5767637491, alpha: 1))
        factoryInformation = neutralClassFactory
        factoriesCollectionVIew.reloadData()
    }
    @IBAction func lowButtonAction(_ sender: Any) {
        statusClassButtonColorChange(high: #colorLiteral(red: 0.1560403705, green: 0.1653948128, blue: 0.2250050604, alpha: 1), low: #colorLiteral(red: 0.04112622887, green: 0.8057022691, blue: 0.5767637491, alpha: 1), neutral: #colorLiteral(red: 0.1560403705, green: 0.1653948128, blue: 0.2250050604, alpha: 1))
        factoryInformation = lowClassFactory
        factoriesCollectionVIew.reloadData()
    }
    @IBAction func highButtonAction(_ sender: Any) {
        statusClassButtonColorChange(high: #colorLiteral(red: 0.04112622887, green: 0.8057022691, blue: 0.5767637491, alpha: 1), low: #colorLiteral(red: 0.1560403705, green: 0.1653948128, blue: 0.2250050604, alpha: 1), neutral: #colorLiteral(red: 0.1560403705, green: 0.1653948128, blue: 0.2250050604, alpha: 1))
        factoryInformation = highClassFactory
        factoriesCollectionVIew.reloadData()
    }
    
    @IBOutlet weak var neutralButtonClass: UIButton!
    @IBOutlet weak var lowButtonClass: UIButton!
    @IBOutlet weak var highButtonClass: UIButton!
    
    @IBOutlet weak var requestEnergyButton: UIButton!
    @IBOutlet weak var factoriesCollectionVIew: UICollectionView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func dropShadow(viewShadow: UIButton){
        viewShadow.center = self.view.center
        viewShadow.backgroundColor = #colorLiteral(red: 0.1794759333, green: 0.1844948828, blue: 0.2565110922, alpha: 1)
        viewShadow.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewShadow.layer.shadowOpacity = 0.4
        viewShadow.layer.shadowOffset = CGSize.zero
        viewShadow.layer.shadowRadius = 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = factoriesCollectionVIew.dequeueReusableCell(withReuseIdentifier: "factory", for: indexPath) as! FactoriesCollectionViewCell
        let b = factoryInformation[indexPath.row] as NSDictionary
        let imageName = b["factoryImageName"] as! String
        let factoryName = b["factoryName"] as! String
        let factoryLocation = b["factoryLocation"] as! String
        cell.factoryImageView.image = UIImage.init(named: imageName)
        cell.factoryNameLabel.text = factoryName
        cell.factoryAddressLabel.text = factoryLocation
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let b = factoryInformation[indexPath.row] as NSDictionary
        let imageName = b["factoryImageName"] as! String
        let factoryName = b["factoryName"] as! String
        let factoryLocation = b["factoryLocation"] as! String
        let surplus = b["renewableEnergy"] as! Int
        selectedFactoryName = factoryName
        selectedFactoryImageName = imageName
        selectedFactoryLocation = factoryLocation
        selectedFactorySurplusEnergy = surplus
    }
    
    func changeMeterQuantity(renew:Int, nonRenew:Int, surplus:Int){
        UIView.animate(withDuration: time, animations: {
            self.renewableEnergy.text = String(renew)
            self.nonRenewableEnergy.text = String(nonRenew)
            self.surplusEnergy.text = String(surplus)
        })
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: factoriesCollectionVIew.contentOffset, size: factoriesCollectionVIew.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let indexPath = factoriesCollectionVIew.indexPathForItem(at: visiblePoint)
        if let a = indexPath?.row{
            let b = factoryInformation[a] as NSDictionary
            let renew = b["renewableEnergy"] as! Int
            let nonRenew = b["nonRenewableEnergy"] as! Int
            let surplus = b["renewableEnergy"] as! Int
            self.changeMeterQuantity(renew: renew, nonRenew: nonRenew, surplus: surplus)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return factoryInformation.count
    }
    
    func navigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        factoriesCollectionVIew.delegate = self
        factoriesCollectionVIew.dataSource = self
        dropShadow(viewShadow: requestEnergyButton)
        navigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

