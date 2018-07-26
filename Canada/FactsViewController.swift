//
//  FactsViewController.swift
//  Canada
//
//  Created by Sweet on 25/07/18.
//  Copyright © 2018 Sweet. All rights reserved.
//

import UIKit

class FactsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var service : FactsService = FactsService()
        service.fetchJsonObject()
        
        let tableView: UITableView = UITableView()
        tableView.frame = self.view.frame
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell : FactsCell? = tableView.dequeueReusableCell(withIdentifier: "Cell") as! FactsCell
//
//        if (cell == nil) {
//            cell = FactsCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell")
//        }
//
//        cell?.labelTitle.text = "TEXT"
//        cell?.labelDescription.text = "DETAIL TEXT"
        var cell: UITableViewCell = UITableViewCell()
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
