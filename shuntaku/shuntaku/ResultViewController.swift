//
//  ResultViewController.swift
//  shuntaku
//
//  Created by Takuya Kudo on 2017/05/14.
//  Copyright © 2017年 Takuya Kudo. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var resultTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        
        let tblBackColor: UIColor = UIColor.clear
        resultTable.backgroundColor = tblBackColor
        
        resultTable.delegate = self
        resultTable.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = resultTable.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath as IndexPath)
        
        let namelabel = resultTable.viewWithTag(1) as! UILabel
        namelabel.text = "aaa"
        namelabel.textColor = UIColor.white
        
        cell.backgroundColor = UIColor.clear
        return cell
        
    }
    // セルの行数を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    

}
