//
//  DBhandlerOfFetchTbleview.swift
//  coredata_original
//
//  Created by macbook pro on 21/04/23.
//

import Foundation
import UIKit
import CoreData

class DBHandler
{
    func saveData(cNm:String)
    {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let countryObject = NSEntityDescription.insertNewObject(forEntityName: "CountryData", into: context) as! CountryData
        countryObject.countryname = cNm
        do{
            try context.save()
            print("Data has been saved...")
        }catch{
            print("Error has been occoured during save data.....")
        }
    }
    
    func fetchData() -> [CountryData]
    {
        var arr = [CountryData]()
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        do{
            arr = try context.fetch(CountryData.fetchRequest()) as! [CountryData]
        }catch{
            print("Error occured during fetch request.....")
        }
        
        return arr
    }
}
