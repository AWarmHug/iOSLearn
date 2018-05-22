//
//  DetailViewController.swift
//  iOS_UITableView
//
//  Created by Warm-mac on 2018/5/18.
//  Copyright © 2018年 me.warm. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var nb: UINavigationBar!

    @IBOutlet weak var nbTitle: UINavigationItem!

    @IBOutlet weak var nbBack: UIBarButtonItem!

    @IBOutlet weak var table1: UITableView!

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true)
    }

    var personInfos = [Info]()

    override func viewDidLoad() {
        super.viewDidLoad()
        nbTitle.title = title
        for personIndex in 0..<50 {
            personInfos.insert(Info(name: "张三\(personIndex)", age: personIndex), at: personIndex)
        }

        table1.register(DetailTableViewCell.self, forCellReuseIdentifier: "cellID")
//        table1.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "detailCellId")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)) as! DetailTableViewCell
        cell.ivHeader.image = UIImage(named: "kf")
        cell.lbName.text = personInfos[indexPath.row].name
        cell.lbAge.text = String(personInfos[indexPath.row].age)
        cell.lbIn.text = personInfos[indexPath.row].introduction
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personInfos.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
