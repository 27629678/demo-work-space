//
//  TextViewController.swift
//  Demo
//
//  Created by sddz_yuxiaohua on 15/10/20.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

import UIKit

class TextViewController: UIViewController, UITextViewDelegate {

    var myTextView:UITextView? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // title
        self.title = "text view demo"
        
        // cancel btn
        let cancel_btn = UIBarButtonItem(
            title: "Cancle",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: Selector("cancelBtnAction:"))
        self.navigationItem.leftBarButtonItem = cancel_btn;
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // text view
        let mytextview = UITextView()
        mytextview.delegate = self
        mytextview.text = "来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师,来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师，来自网易邮箱大师"
        mytextview.backgroundColor = UIColor.lightGrayColor()
        mytextview.frame.size.height = mytextview.contentSize.height
        self.myTextView = mytextview
        self.myTextView?.frame = CGRectMake(10, 100, self.view.frame.size.width - 20, 100)
        self.textViewDidChange(self.myTextView!)
        
        self.view.addSubview(mytextview)
    }
    
    // MARK: - private methods
    func cancelBtnAction (sender: AnyObject?) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            print("dismiss");
        }
    }
    
    // MARK: - text view delegate methods
    func textViewDidChange(textView: UITextView) {
        print(textView.contentSize.height)
        if textView.contentSize.height > 170 {
            self.myTextView!.frame.size.height = 170
            return
        }
        
        if textView.contentSize.height < 90 {
            self.myTextView!.frame.size.height = 90
            return
        }
        
        self.myTextView!.frame.size.height = textView.contentSize.height
    }
}
