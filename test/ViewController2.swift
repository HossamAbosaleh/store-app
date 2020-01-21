//
//  ViewController2.swift
//  test
//
//  Created by Abu Salleeiihh on 1/11/20.
//  Copyright © 2020 Abu Salleeiihh. All rights reserved.
//

import UIKit
import CoreData
class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableViewStore : UITableView!
    var listOfStore = [StoreType]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadnStore()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
           return 1
       }
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfStore.count
      }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! testTableViewCell
        cell.setCell(store:listOfStore[indexPath.row])
               return cell
        
      }
    

     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         
         let alerControl = UIAlertController(title: "Delete", message: "Are you sure you want to delete note ", preferredStyle:.alert)
             let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) in
             if editingStyle == .delete {
             let commit = self.listOfStore[indexPath.row]
                  context.delete(commit)
             self.listOfStore.remove(at: indexPath.row)
             self.tableViewStore.deleteRows(at: [indexPath], with: .fade)
             self.tableViewStore.reloadData()
               do {
                   try context.save()
                   
               } catch  {
                   
               }
              }

                             }
         let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
                     alerControl.addAction(yesAction)
                     alerControl.addAction(noAction)
                     self.present(alerControl, animated: true)
      
    }
    
    
    
    
    func loadnStore() {
           let fetchRequest:NSFetchRequest<StoreType> = StoreType.fetchRequest()
           do {
               listOfStore = try context.fetch(fetchRequest)
               tableViewStore.reloadData()
           } catch  {
               
           }
        
    }
    @IBAction func backButton(){
           dismiss(animated: true, completion: nil)
       }
}
