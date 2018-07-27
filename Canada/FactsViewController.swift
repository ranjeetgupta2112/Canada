//
//  FactsViewController.swift
//  Canada
//
//  Created by Sweet on 25/07/18.
//  Copyright © 2018 Sweet. All rights reserved.
//

import UIKit

class FactsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource ,FetchJsonObjectDelegate{


    
    var canadafactsList : FactsModel!
    let tableView: UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.frame = self.view.frame
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        var service : FactsService = FactsService()
        service.delegate = self
        service.fetchJsonObject()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func UpdateFactsDataInUI(factsData: FactsModel) {
        canadafactsList = factsData
        print("Printing from view controller ",canadafactsList.rows?.count)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func serviceFailedWithError(error: NSError) {
        print(error)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier : String = "FactsCell"
        var cell : FactsCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? FactsCell

        if (cell == nil) {
            cell = FactsCell(style: UITableViewCellStyle.value1, reuseIdentifier: identifier)
        }
        cell?.tag = indexPath.row
//        cell?.labelTitle.text = "It works here"
//        cell?.labelDescription.text = "Description works here"

        

        if(canadafactsList != nil){
            cell?.labelTitle.text = self.canadafactsList.rows![indexPath.row].title
            print("Title : ",self.canadafactsList.rows![indexPath.row].title)
            cell?.labelDescription.text = self.canadafactsList.rows![indexPath.row].description
            cell?.imageFact.image = nil;

            DispatchQueue.global(qos: .userInteractive).async{

            }
        }
        
        
//        if(canadafactsList != nil){
//        cell?.labelTitle.text = self.canadafactsList.rows![indexPath.row].title
//        cell?.labelDescription.text = self.canadafactsList.rows![indexPath.row].description
//        cell?.imageFact.image = nil;
//        //cell?.imageFact.image = UIImage(named: "default.png")!
//
//        DispatchQueue.global(qos: .userInteractive).async{
//            let urlString : String? = self.canadafactsList.rows![indexPath.row].imageHref
//            if let url : URL? = URL(string: urlString!){
//            if(url != nil){
//            do{
//                let imageData : Data = try Data(contentsOf: url!)
//                let image : UIImage = UIImage(data: imageData)!
//                if(image != nil){
//                    DispatchQueue.main.async {
//                        if (cell?.tag == indexPath.row) {
//                            cell?.imageFact.image = image
//                            cell?.setNeedsLayout()
//                        }
//
//                    }
//                }
//            }
//            catch{
//                print("Cannot download image")
//                }
//
//            }
//
//
//            cell?.setNeedsLayout()
//            if (indexPath.row % 2 == 0){
//                cell?.backgroundColor = UIColor.gray
//            }
//            else{
//                cell?.backgroundColor = UIColor.white
//            }
//
        
        return cell!
    }
    


}
