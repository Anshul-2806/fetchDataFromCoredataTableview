//
//  ViewController.swift
//  coredata_original
//
//  Created by macbook pro on 20/04/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet var txt1:UITextField!
    @IBOutlet var txt2:UITextField!
    @IBOutlet var txt3:UITextField!
    @IBOutlet var txt4:UITextField!
    @IBOutlet var btn:UIButton!
    

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.layer.cornerRadius = 15
        btn.layer.borderWidth = 3
        btn.layer.borderColor = UIColor.blue.cgColor
    }

    @IBAction func eventOne(_ sender: Any) {
        let entity = NSEntityDescription.entity(forEntityName: "Employee", in: context)
        let newEmp = NSManagedObject(entity: entity!, insertInto: context)
        newEmp.setValue(txt1.text, forKey: "empid")
        newEmp.setValue(txt2.text, forKey: "empname")
        newEmp.setValue(txt3.text, forKey: "empprofile")
        newEmp.setValue(txt4.text, forKey: "empsal")
        
        do{
            try context.save()
            print("Saved.....")
        }catch{
            print("error")
        }
    }


    
}

