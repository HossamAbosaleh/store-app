//
//  ViewController.swift
//  test
//
//  Created by Abu Salleeiihh on 1/11/20.
//  Copyright © 2020 Abu Salleeiihh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var storeNameText : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func saveButton(){
        let store = StoreType(context: context)
        store.name = storeNameText.text
        
        do {
             appDelegate.saveContext()
        
             storeNameText.text = ""
            print("save")
        }catch{
            print("store name donot save")
        }
        
    }
    

}

