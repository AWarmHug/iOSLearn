//
//  ViewController.swift
//  iOS1_UiTableView
//
//  Created by Warm-mac on 2018/5/13.
//  Copyright © 2018年 me.warm. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table1: UITableView!
    var names = [String]()


    override func viewDidLoad() {
        super.viewDidLoad()
        for item in 1...10 {
            names.insert("张三\(item)", at: item - 1)
        }
        table1.dataSource = self
        table1.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table1.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

