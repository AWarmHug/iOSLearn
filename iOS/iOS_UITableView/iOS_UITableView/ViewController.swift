//
//  ViewController.swift
//  iOS_UITableView
//
//  Created by Warm-mac on 2018/5/18.
//  Copyright © 2018 me.warm. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table1: UITableView!

    var names = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        for item in 0..<50 {
            names.insert("张三\(item)", at: item)
        }
        table1.dataSource = self
        table1.delegate = self
        table1.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
    }
    
    /// 某个节中 单元格的数量
    ///
    /// - Parameters:
    ///   - tableView: <#tableView description#>
    ///   - section: <#section description#>
    /// - Returns: <#return value description#>
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    
    /// 返回节的个数
    ///
    /// - Parameter tableView: <#tableView description#>
    /// - Returns: <#return value description#>
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    /// 根据IndexPath 返回相应的Cell
    ///
    /// - Parameters:
    ///   - tableView:
    ///   - indexPath:
    /// - Returns: <#return value description#>
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)) as UITableViewCell
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("willSelectRowAt 点击了\(indexPath.row)")
//        performSegue(withIdentifier: "goToDetail", sender: names[indexPath.row])
    present(MyTableViewController(), animated: true)
//            prepare(for: UIStoryboardSegue(identifier: "push", source: self, destination: DetailViewController()), sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let dvc = segue.destination as! DetailViewController
            dvc.title = sender as? String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
