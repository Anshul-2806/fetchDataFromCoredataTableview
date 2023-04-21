//
//  FetchDataOnTableview.swift
//  coredata_original
//
//  Created by macbook pro on 21/04/23.
//

import UIKit
import CoreData

class FetchDataOnTableview: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var arr = [Employee]()
    
    @IBOutlet weak var tbl:UITableView!
    
    @IBOutlet var txt1:UITextField!
    @IBOutlet var txt2:UITextField!
    @IBOutlet var txt3:UITextField!
    @IBOutlet var txt4:UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

        tbl.dataSource = self
        tbl.delegate = self
        tbl.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchData()
        tbl.reloadData()
    }
    
    
    @IBAction func saveEvent(_ sender: Any) {
        saveData()
        tbl.reloadData()
    }
    
    func saveData()
    {
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
    
    func fetchData(){
        let request = NSFetchRequest<Employee>(entityName: "Employee")
        do{
            arr = try context.fetch(request)
        }catch{
            print("Error...")
        }
    }

}

extension FetchDataOnTableview : UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! fetchDataOnTblCell
        cell.lbl1.text = arr[indexPath.row].empid
        cell.lbl2.text = arr[indexPath.row].empname
        cell.lbl3.text = arr[indexPath.row].empprofile
        cell.lbl4.text = arr[indexPath.row].empsal
        return cell
    }
    
}


class fetchDataOnTblCell:UITableViewCell
{
    @IBOutlet var lbl1:UILabel!
    @IBOutlet var lbl2:UILabel!
    @IBOutlet var lbl3:UILabel!
    @IBOutlet var lbl4:UILabel!
}
