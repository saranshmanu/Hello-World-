//
//  Constant.swift
//  venturisity
//
//  Created by Saransh Mittal on 02/10/18.
//  Copyright © 2018 Saransh Mittal. All rights reserved.
//

import Foundation

var selectedFactoryName = ""
var selectedFactoryImageName = ""
var selectedFactoryLocation = ""
var selectedFactorySurplusEnergy = 0

var highClassFactory = [
    [
        "factoryName":"Vellu Makers",
        "factoryLocation":"Ranipet Marg",
        "factoryImageName":"M1",
        "renewableEnergy":1340,
        "nonRenewableEnergy":5438,
        "surpluss":1200
    ],[
        "factoryName":"Socket Hub",
        "factoryLocation":"Katpadi, 630123",
        "factoryImageName":"M2",
        "renewableEnergy":3245,
        "nonRenewableEnergy":1243,
        "surpluss":546
    ],[
        "factoryName":"Rocket Annas",
        "factoryLocation":"Vellore Fort",
        "factoryImageName":"M3",
        "renewableEnergy":640,
        "nonRenewableEnergy":2544,
        "surpluss":1233
    ]
]

var lowClassFactory = [
    [
        "factoryName":"Rocket Annas",
        "factoryLocation":"Vellore Fort",
        "factoryImageName":"M4",
        "renewableEnergy":1340,
        "nonRenewableEnergy":5438,
        "surpluss":1200
    ]
]

var neutralClassFactory = [[String:Any]]()
