//
//  fetchDataOnTableview_First.swift
//  coredata_original
//
//  Created by macbook pro on 21/04/23.
//

import UIKit

class fetchDataOnTableview_First: UIViewController {
    
    @IBOutlet var tblview:UITableView!
    var country:UITextField!
    var arr = [CountryData]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tblview.reloadData()
    }
    
    @IBAction func addNewData(_ sender: Any) {
        let dialogMsg = UIAlertController(title: "Add Data", message: "Enter Country Name", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: {
            (action) in
            let newCountryNm = self.country.text!
            let db = DBHandler()
            db.saveData(cNm: newCountryNm)
            self.arr = db.fetchData()
            self.tblview.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (action) in
            print("Cancelled the operation.")
        })
        
        dialogMsg.addAction(okAction)
        dialogMsg.addAction(cancelAction)
        dialogMsg.addTextField{
            (textfield) in
            self.country = textfield
            self.country.placeholder = "Type Country Name"
        }
        
        self.present(dialogMsg, animated: true, completion: nil)
    }
    
}

extension fetchDataOnTableview_First:UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c = tblview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        c.textLabel?.text = arr[indexPath.row].countryname
        return c
    }
    
    
}
