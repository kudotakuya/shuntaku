//
//  RankingViewController.swift
//  shuntaku
//
//  Created by Takuya Kudo on 2017/05/14.
//  Copyright © 2017年 Takuya Kudo. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {


    @IBOutlet weak var rankingTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        
        let tblBackColor: UIColor = UIColor.clear
        rankingTable.backgroundColor = tblBackColor
        
        
        
        rankingTable.delegate = self
        rankingTable.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = rankingTable.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath as IndexPath)
        
        let namelabel = rankingTable.viewWithTag(1) as! UILabel
        namelabel.text = "aaa"
        namelabel.textColor = UIColor.white
        
        cell.backgroundColor = UIColor.clear
        
        return cell
        
    }
    // セルの行数を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }


    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {
//        cell.backgroundColor = colorForIndex(indexPath.row)
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
