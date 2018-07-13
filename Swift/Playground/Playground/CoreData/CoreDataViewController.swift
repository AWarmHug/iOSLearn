//
//  CoreDataViewController.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/11.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit
import CoreData

class CoreDataViewController: BaseViewController {

    var persons = [Person]()


    @IBOutlet weak var tableView: UITableView!


    private func createAlert(handler: @escaping (String) -> Void) -> UIAlertController {
        let alert = UIAlertController(title: "输入姓名", message: nil, preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "请输入姓名"
        }
        alert.addAction(UIAlertAction(title: "取消", style: .cancel))
        alert.addAction(UIAlertAction(title: "确定", style: .default) { action in
            handler(alert.textFields![0].text!)
        })
        return alert
    }

    @IBAction func add(_ sender: Any) {
        self.present(createAlert { title in
            self._add(title)
        }, animated: true)
    }

    private func _add(_ name: String) {
        let person = Person(context: viewContext)
        person.name = name
        do {
            try viewContext.save()
            _find()
        } catch {
        }
    }

    @IBAction func deleteData(_ sender: Any) {


        let all = NSBatchDeleteRequest(fetchRequest: Person.fetchRequest())
        do {
            try viewContext.execute(all)
        } catch {

        }

    }

    @IBAction func updateData(_ sender: Any) {
        self.present(EditAlertController(title: nil, message: nil, preferredStyle: .alert), animated: true)
    }

    private func _update(oldName: String, newName: String) {

        do {
            let request: NSFetchRequest = Person.fetchRequest()
            request.predicate = NSPredicate(format: "name=%@", oldName)
            let persons = try viewContext.fetch(request)
            persons[0].name = newName
            try viewContext.save()
        } catch {

        }
    }

    @IBAction func find(_ sender: Any) {
        _find()
    }

    private func _find() {
        do {
            let request = NSAsynchronousFetchRequest(fetchRequest: Person.fetchRequest()) { (result: NSAsynchronousFetchResult<Person>) in
                guard let persons = result.finalResult else {
                    return
                }
                self.persons = persons
                self.tableView.reloadData()
            }
            try viewContext.execute(request)
        } catch {

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        _find()
    }
}


extension CoreDataViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.ex_dequeueCell(type: CoreDataViewCell.self, indexPath: indexPath)
        cell.person = persons[indexPath.row]
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard  editingStyle == UITableViewCellEditingStyle.delete else {
            return
        }
        viewContext.delete(persons[indexPath.row])
        persons.remove(at: indexPath.row)
        do {
            try viewContext.save()
            tableView.deleteRows(at: [indexPath], with: .right)
        } catch {
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.present(createAlert { title in
            let person = self.persons[indexPath.row]
            self._update(oldName: person.name!, newName: title)
            tableView.reloadData()
        }, animated: true)
    }
}
