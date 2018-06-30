//
//  PlayGroundViewController.swift
//  LoginApp
//
//  Created by Warm-mac on 2018/5/21.
//  Copyright © 2018年 me.warm. All rights reserved.
//
//

import UIKit
import Alamofire

class PlayGroundViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var newsTable: UITableView!

    var gankModel = [GankNews]()
    var urc = UIRefreshControl()
    var noData = false
    var page = 0;


    override func viewDidLoad() {
        super.viewDidLoad()
        urc.addTarget(self, action: #selector(refreshedTable(_:)), for: .valueChanged)
        newsTable.estimatedRowHeight = 88
        newsTable.rowHeight = UITableViewAutomaticDimension
        newsTable.refreshControl = urc
        urc.beginRefreshing()
        refreshedTable(urc)
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if !urc.isRefreshing {
            urc.attributedTitle = NSAttributedString(string: "下拉刷新")
        }
    }

    @objc private func refreshedTable(_ refresh: UIRefreshControl) {
        page = 0;
        urc.attributedTitle = NSAttributedString(string: "刷新中...")
        urc.tintColor = UIColor.black
        loadDataByType(
                type: Type.Android,
                page: page/*Int(arc4random_uniform(10))*/,
                success: { news in
                    self.urc.attributedTitle = NSAttributedString(string: "刷新成功")
                    self.gankModel = news
                    print("数量为:\(self.gankModel.count)")
                    self.newsTable.reloadData()
                    self.urc.endRefreshing()

        }) { error in
                    print("\(error.code)+\(error.message)")
                    self.urc.attributedTitle = NSAttributedString(string: "刷新失败")
                    self.urc.endRefreshing()
        }
    }

    private func loadMore() {
        page += 1
        loadDataByType(
                type: Type.Android,
                page: page/*Int(arc4random_uniform(10))*/,
                success: { news in
                    self.gankModel += news
                    print("数量为:\(self.gankModel.count)")
                    self.newsTable.reloadData()
                },
                fail: { error in
                    print("\(error.code)+\(error.message)")
                })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        guard !gankModel.isEmpty else {
            return 0
        }
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(section)
        if section == 0 {
            return gankModel.count
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell is LoadMoreCell {
            loadMore()
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCellId", for: indexPath) as! NewsTableViewCell
            cell.initCell(gankModel[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "loadMoreId", for: indexPath) as! LoadMoreCell
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let url = gankModel[indexPath.row].url
            let vc = UIStoryboard(name: "ArticleWeb", bundle: nil).instantiateInitialViewController() as! ArticleWebViewController
            vc.hidesBottomBarWhenPushed = true
            vc.url = url
            navigationController?.pushViewController(vc, animated: true)
//            performSegue(withIdentifier: "goArticleDetail", sender: url)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "goArticleDetail" {
//            let navi = segue.destination as! BaseNavigationController
            let viewController = segue.destination as! ArticleWebViewController
//            viewController.hidesBottomBarWhenPushed = true

            viewController.url = sender as? String
        }
    }
}
