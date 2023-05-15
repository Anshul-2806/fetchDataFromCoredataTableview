//
//  DBHelper.swift
//  CRUD_Coredata
//
//  Created by macbook pro on 29/03/23.
//

import Foundation
import CoreData
import UIKit

class databasehelper {
    static var sharinstance = databasehelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    func save(object:[String:String]){
        let student = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context!) as! Person
        student.name = object["name"] as NSObject?
        student.address = object["address"] as NSObject?
        student.city = object["city"] as NSObject?
        student.mobile = object["mobile"] as NSObject?
        
        do {
            try context?.save()
            print("save")
        } catch{
            print("data is not save")
        }
    }
    func getStudentData() -> [Person]{
        var student = [Person]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        do{
            student = try context?.fetch(fetchRequest) as! [Person]
        } catch{
            print("can not get data")
        }
        return student
    }
    func deleteData(index: Int) -> [Person]{
        var student = getStudentData()
        context?.delete(student[index])
        student.remove(at: index)
        do {
            try context?.save()
        } catch {
            print("cannot delete data")
        }
        return student
    }
    func editData(object:[String:String], i:Int){
        var student = getStudentData()
        student[i].name = object["name"] as NSObject?
        student[i].address = object["address"] as NSObject?
        student[i].city = object["city"] as NSObject?
        student[i].mobile = object["mobile"] as NSObject?
        do{
            try context?.save()
        } catch{
            print("data ias not edited")
        }
    }
}

