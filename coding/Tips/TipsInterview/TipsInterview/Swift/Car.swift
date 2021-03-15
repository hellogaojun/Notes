//
//  Car.swift
//  TipsInterview
//
//  Created by admin on 2021/3/15.
//

import UIKit

@objc(GJCar) //重命名暴露给OC的符号名（类名，属性名，方法名）

//@objcMembers 代表默认所有的成员都会暴露给OC
@objcMembers class Car: NSObject {
    var price: Double
    var band: String
    
    init(price: Double, band: String) {
        self.price = price
        self.band = band
    }
    
    func run() {
        print(price,band,"run")
    }
    
    static func run() {
      print("Car run")
    }
    
}

extension Car {
    func test() {
        print(price,band,"test")
    }
}

