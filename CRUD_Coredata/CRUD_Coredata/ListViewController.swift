//
//  ListViewController.swift
//  CRUD_Coredata
//
//  Created by macbook pro on 29/03/23.
//

import UIKit

protocol DataPass{
        func data(object:[String:String], index:Int , isEdit:Bool)
    }



    class ListViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
       
        
    var student = [Person]()
        var delegate:DataPass!
        @IBOutlet weak var tableview: UITableView!
        override func viewDidLoad() {
            super.viewDidLoad()

            student = databasehelper.sharinstance.getStudentData()
        }
        
      
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return student.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell" , for: indexPath ) as! MyTableViewCell
            cell.lblName.text = (student[indexPath.row].name as! String)
            cell.lblAddress.text = (student[indexPath.row].address as! String)
            cell.lblCity.text = (student[indexPath.row].city as! String)
            cell.lblMobile.text = (student[indexPath.row].mobile as! String)
            
            return cell
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 110
        }
        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete{
                student = databasehelper.sharinstance.deleteData(index: indexPath.row)
                self.tableview.deleteRows(at: [indexPath], with: .automatic)
            }
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let dict = ["name":student[indexPath.row].name, "address":student[indexPath.row].address , "city":student[indexPath.row].city , "mobile":student[indexPath.row].mobile]
            delegate.data(object: dict as! [String:String], index: indexPath.row, isEdit: true)
            self.navigationController?.popViewController(animated: true)
        }
    }
