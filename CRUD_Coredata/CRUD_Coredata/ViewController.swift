//
//  ViewController.swift
//  CRUD_Coredata
//
//  Created by macbook pro on 29/03/23.
//

import UIKit

class ViewController: UIViewController, DataPass {

    @IBOutlet weak var txtname: UITextField!
    
    @IBOutlet weak var txtaddress: UITextField!
    
    @IBOutlet weak var txtcity: UITextField!
    
    @IBOutlet weak var txtmobile: UITextField!
    
    @IBOutlet weak var btnShow:UIButton!
    @IBOutlet weak var btnSave:UIButton!

    
    var i = Int()
    var isupdate = Bool()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnShow.layer.borderWidth = 5
        btnShow.layer.backgroundColor = UIColor.red.cgColor
        btnShow.layer.cornerRadius = 15
        
        btnSave.layer.borderWidth = 5
        btnSave.layer.backgroundColor = UIColor.systemGreen.cgColor
        btnSave.layer.cornerRadius = 15
        
    }

    @IBAction func showButtonClick(_ sender: Any) {
        let listVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        listVC.delegate = self
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    @IBAction func ButtonSaveClick(_ sender: Any) {
        var dict = ["name":txtname.text, "address":txtaddress.text , "city":txtcity.text , "mobile":txtmobile.text]
        if isupdate{
            databasehelper.sharinstance.editData(object: dict as! [String:String], i: i)
        }
        else
        {
            databasehelper.sharinstance.save(object: dict as! [String : String])

        }
    }
    func data(object: [String : String], index: Int, isEdit: Bool) {
        txtname.text = object["name"]
        txtaddress.text = object["address"]
        txtcity.text = object["city"]
        txtmobile.text = object["mobile"]
        i = index
        isupdate = isEdit
    }

}

