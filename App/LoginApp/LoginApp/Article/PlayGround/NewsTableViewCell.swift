//
//  NewsTableViewCell.swift
//  LoginApp
//
//  Created by Warm-mac on 2018/5/22.
//  Copyright © 2018年 me.warm. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var who: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var date: UILabel!


    func initCell(_ gankNews:GankNews){
        title.text=gankNews.desc
        who.text=gankNews.who
        type.text=gankNews.type
        date.text=gankNews.publishedAt
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
