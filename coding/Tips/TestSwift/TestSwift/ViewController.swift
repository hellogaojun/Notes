//
//  ViewController.swift
//  TestSwift
//
//  Created by admin on 2021/3/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        test();
        
        let p = GJPerson(name: "gj", age: 88)
        p.eat();
        p.run();
        print(p.age)
    }
    
    //MARK: test
    func test(){
        print("test")
    }
}

