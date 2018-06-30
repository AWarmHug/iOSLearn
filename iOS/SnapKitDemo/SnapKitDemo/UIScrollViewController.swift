//
//  UIScrollViewController.swift
//  SnapKitDemo
//
//  Created by Warm-mac on 2018/6/30.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//

import UIKit

class UIScrollViewController: UIViewController {
    lazy var scroll : UIScrollView={
        let scroll=UIScrollView()
        return scroll
    }()

    lazy var view1 :UILabel={
        let view=UILabel()
        view.backgroundColor=UIColor.cyan
        view.numberOfLines=0
        view.text="""
        作曲 : 杨镇邦
        作词 : 林夕
        我过去 那死党 早晚共对
        各也扎职以后 没法 畅聚
        而终於 相约到 但无言共对 疏淡如水
        日夜做 见爸爸 刚好想呻
        却霎眼 看出他 多了皱纹
        而他的苍老感 是从来未觉 太内疚担心
        最心痛是 爱得太迟
        有些心意 不可等某个日子
        盲目地发奋 忙忙忙其实自私
        梦中也习惯 有压力要我得志
        最可怕是 爱需要及时
        只差一秒 心声都已变历史
        忙极亦放肆 见我爱见的相知
        要抱要吻要怎么也好 偏要推说等下一次
        我也觉 我体质 彷似下降
        看了症得到是 别要太忙
        而影碟 都扫光 但从来未看 因有事赶
        日夜做 储的钱 都应该够
        到圣诞 正好讲 跟我白头
        谁知她开了口 未能挨下去 已恨我很久
        错失太易 爱得太迟
        我怎想到 她忍不到那日子
        盲目地发奋 忙忙忙从来未知
        幸福会掠过 再也没法说钟意
        爱一个字 也需要及时
        只差一秒 心声都已变历史
        为何未放肆 见我爱见的相知
        要抱要吻要怎么也好 不要相信一切有下次
        相拥我所爱又花几多秒
        这几秒 能够做到又有多少
        未算少 足够遗憾忘掉
        多少抱憾 多少过路人
        太懂估计 却不懂爱惜自身
        人人在发奋 想起他朝都兴奋
        但今晚未过 你要过也很吸引
        纵不信运 你不过是人
        理想很远 爱於咫尺却在等
        来日别操心 趁你有能力开心
        世界有太多东西发生 不要等到天上俯瞰
        """
        return view
    }()
    
    lazy var view2 :UILabel={
        let view=UILabel()
        view.backgroundColor=UIColor.blue
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.white
        self.view.addSubview(scroll)
        self.scroll.addSubview(view1)
        self.scroll.addSubview(view2)
        
        scroll.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        
        view1.snp.makeConstraints { (make) in
            make.left.right.equalTo(view1)
            make.top.equalTo(scroll)
        }
        
        view2.snp.makeConstraints { (make) in
            make.left.right.equalTo(view1)
            make.top.equalTo(view1.snp.bottom)
            make.height.equalTo(500)
            //这个是很重要的,一定要设置bottom 这样UIScrollview才知道长度
            make.bottom.equalToSuperview()
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}