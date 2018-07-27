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
        
        let service : FactsService = FactsService()
        service.delegate = self
        service.fetchJsonObject()
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        
        setConstraintsForTableView()
    }
    
    func setConstraintsForTableView(){

        let width = NSLayoutConstraint(item: self.tableView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation(rawValue: 0)!, toItem: self.view, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0)
        let height = NSLayoutConstraint(item: self.tableView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation(rawValue: 0)!, toItem: self.view, attribute: NSLayoutAttribute.height, multiplier: 1.0, constant: 0)
        let top = NSLayoutConstraint(item: self.tableView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.top, multiplier: 1.0 , constant: 0)
        let leading = NSLayoutConstraint(item: self.tableView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: 0)
        self.view.addConstraints([width, height, top, leading])

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func UpdateFactsDataInUI(factsData: FactsModel) {
        canadafactsList = factsData
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
        if(canadafactsList != nil){
            cell?.labelTitle.text = self.canadafactsList.rows![indexPath.row].title
            print("Title : ",self.canadafactsList.rows![indexPath.row].title)
            cell?.labelDescription.text = self.canadafactsList.rows![indexPath.row].description
            cell?.imageFact.image = nil;

            DispatchQueue.global(qos: .userInteractive).async{
                let urlString : String? = self.canadafactsList.rows![indexPath.row].imageHref
                guard  urlString == nil else{
                    let url : URL? = URL(string: urlString!)
                    do{
                        let imageData : Data = try Data(contentsOf: url!)
                        guard UIImage(data: imageData) == nil else{
                            let image : UIImage? = UIImage(data: imageData)!
                            if(image != nil){
                                DispatchQueue.main.async {
                                    if (cell?.tag == indexPath.row) {
                                        cell?.imageFact.image = image
                                        cell?.setNeedsLayout()
                                    }
                                    
                                }
                            }
                            return
                        }
                            return
                    }
                    catch{
                        
                    }
                    return
                }
            }
        }
        
        
        return cell!
    }
    


}
