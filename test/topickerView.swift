//
//  topickerView.swift
//  test
//
//  Created by Abu Salleeiihh on 1/11/20.
//  Copyright © 2020 Abu Salleeiihh. All rights reserved.
//

import UIKit
import CoreData
class topickerView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
 @IBOutlet var pickerviewstore : UIPickerView!
 @IBOutlet var deleteButton1 : UIButton!
    var listStoreType = [StoreType]()
    var indexOfPicker = Int()
    var indexOfPickerc = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNameStores()
        
        
        
    }
    func loadNameStores() {
          let fetchRequest:NSFetchRequest<StoreType> = StoreType.fetchRequest()
          do {
              listStoreType = try context.fetch(fetchRequest)
              pickerviewstore.reloadAllComponents()
          } catch  {
              print(error.localizedDescription)
          }
      
      }

    
    
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           return listStoreType.count
       }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        indexOfPicker = row
        let store = listStoreType[row]
        return store.name
           
       }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//
//         indexOfPicker = row
//        indexOfPickerc = component
//
//    }
        
// how delete data in pickerview 
    @IBAction func deleteButton(){
       
        if indexOfPicker < listStoreType.count {
            let storeSelect = listStoreType[indexOfPicker]
                context.delete(storeSelect)
        self.listStoreType.remove(at: indexOfPicker)
        self.pickerviewstore.reloadAllComponents()
            
            do {
                try context.save()
                          
            } catch  {
                          
                      }
        }
                     }
    
    }
    

