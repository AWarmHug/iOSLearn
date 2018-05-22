//
//  RootViewController.swift
//  iOS1_1
//
//  Created by Warm-mac on 2018/5/13.
//  Copyright © 2018年 me.warm. All rights reserved.
//

import UIKit

extension UIViewController {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}

class RootViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var tv1: UITextView!
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var segmentedControl1: UISegmentedControl!

    @IBOutlet weak var btn4: UIButton!

    @IBAction func btn1Click(_ sender: UIButton) {
        label1.text = tf1.text
    }

    @IBAction func btn2Click(_ sender: UIButton) {
        switch1.setOn(!switch1.isOn, animated: true)
    }

    @IBAction func switch1ValueChange(_ sender: UISwitch) {
        if sender.isOn {
            label2.text = "OPEN"
        } else {
            label2.text = "CLOSE"
        }
    }

    @IBAction func segmentedControl1ValueChange(_ sender: UISegmentedControl) {
        label3.text = "我选择了\(sender.titleForSegment(at: sender.selectedSegmentIndex) ?? "未知")"
    }

    @IBAction func btn3Click(_ sender: UIButton) {

        segmentedControl1.insertSegment(withTitle: "新增\(segmentedControl1.numberOfSegments + 1)", at: segmentedControl1.numberOfSegments, animated: true)
    }

    @IBAction func btn4Click(_ sender: UIButton) {
        navigationController?.pushViewController(WebViewController(nibName: "WebViewController", bundle: nil), animated: true)
    }

    @IBAction func slider1ValueChange(_ sender: UISlider) {
        btn4.isEnabled = (sender.value == sender.maximumValue)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tf1.delegate = self
        tv1.text = "hhhhhh"
        title = "首页"
        //动态设置点击事件
//        btn4.addTarget(self, action: #selector(btn4ClickAA(_:)), for: .allEditingEvents)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc private func btn4ClickAA(btn: UIButton) {

    }

    @objc private func btn4ClickAAA(btn: UIButton) {

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("TextField 获得焦点,点击Return键")
        textField.resignFirstResponder()
        return true
    }


    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        print("我要开始输入了")
        return true
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        print("我准备结束了")
    }

    func textViewDidChange(_ textView: UITextView) {
        print("我刚改好")
    }

}
