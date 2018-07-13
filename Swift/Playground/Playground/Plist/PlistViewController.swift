//
//  PlistViewController.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/9.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit
import SnapKit

class PlistViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    func createFile(name: String, in document: URL) -> Bool {
        let manager = FileManager.default;
        if !manager.fileExists(atPath: document.path) {
            do {
                try manager.createDirectory(at: document, withIntermediateDirectories: true)
            } catch {
                return false
            }
        }

        let target = document.appendingPathComponent(name);
        guard !manager.fileExists(atPath: target.path) else {
            return true
        }
        return manager.createFile(atPath: target.path, contents: nil)
    }

    lazy var data: NSArray = {
        if let arr = NSArray(contentsOfFile: Bundle.main.path(forResource: "ProvincesAndCities", ofType: "plist")!) {
            return arr
        }
        return NSArray()
    }()

    lazy var table: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.ex_registerCell(type: PlistTableViewCell.self)
        return table
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.snp.makeConstraints { maker in
            maker.edges.equalTo(view)
        }

//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
//        if createFile(name: "setting.plist", in: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("PLIST", isDirectory: true)) {
//            print("已创建")
//        } else {
//            print("创建失败")
//        }
//        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("PLIST", isDirectory: true).appendingPathComponent("setting.plist")


    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let types = data[section] as? Dictionary<String, Any> else {
            return "未知分类"
        }
        return types["State"] as? String ?? "未知分类"
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let types = data[section] as? Dictionary<String, Any> else {
            return 0
        }

        guard let cities = types["Cities"] as? Array<Dictionary<String, Any>> else {
            return 0
        }

        return cities.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.ex_dequeueCell(type: PlistTableViewCell.self, indexPath: indexPath)

        guard let types = data[indexPath.section] as? Dictionary<String, Any> else {
            return cell
        }

        guard let cities = types["Cities"] as? Array<Dictionary<String, Any>> else {
            return cell
        }

        let city = cities[indexPath.row]["city"]! as! String
        let lat = (cities[indexPath.row]["lat"]! as! NSNumber).floatValue
        let lon = (cities[indexPath.row]["lon"]! as! NSNumber).floatValue

        cell.city = City(city: city, lat: lat, lon: lon)
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}
