//
//  Food.swift
//  Cafe
//
//  Created by Luis Bauza on 2017/04/19.
//  Copyright © 2017年 Luis Bauza. All rights reserved.
//

import Foundation

class Food: NSObject {
    // Properties
    var name: String?
    var desc: String?
    var price: String?
    var calories: String?
    
    override init() {
        name = " "
        desc = " "
        price = " "
        calories = " "
    }
    
    init(name: String, desc: String, price: String, calories: String) {
        self.name = name
        self.desc = desc
        self.price = price
        self.calories = calories
    }
}
