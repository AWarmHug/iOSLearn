//
//  ViewController.swift
//  LoginApp
//
//  Created by Warm-mac on 2018/5/20.
//  Copyright © 2018 me.warm. All rights reserved.
//

import UIKit


class ViewController: BaseViewController {

    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfPwd: UITextField!

    @IBAction func clickLogin(_ sender: UIButton) {
    performSegue(withIdentifier: "goOut", sender: nil)
    }

    @IBAction func clickForgetPwd(_ sender: UIButton) {
    }

    @IBAction func clickGoReg(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    func pushViewController(_ viewController: UIViewController, _ animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
}
