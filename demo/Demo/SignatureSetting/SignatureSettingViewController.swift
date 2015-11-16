//
//  SignatureSettingViewController.swift
//  Demo
//
//  Created by sddz_yuxiaohua on 15/10/20.
//  Copyright © 2015年 NetEase (hangzhou) Network Co.,Ltd. All rights reserved.
//

import UIKit

// cell reuse id
var cell_id:String = "SignatureSettingViewController_ReuseIdentifier"

class SignatureSettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {
    // data model
    var accounts:NSArray! {
        get {
            return UserDataManager.defaultManager().accounts!
        }
        
        // Shorthand Setter Declaration
        set {
            self.accounts = newValue
        }
    }
    
    // text view
    var textView:UITextView!
    
    // table view
    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // title
        self.title = "signature"
        
        // cancel btn
        let cancel_btn = UIBarButtonItem(
            title: "Cancle",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: Selector("cancelBtnAction:"))
        self.navigationItem.leftBarButtonItem = cancel_btn;
        
        // table view
        self.tableView = UITableView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 60
        self.tableView.keyboardDismissMode = .OnDrag
        self.tableView.registerNib(UINib(nibName: "SignatureTableViewCell", bundle: nil), forCellReuseIdentifier: cell_id)
        self.view.addSubview(self.tableView)
        
        // text view
        self.textView = UITextView()
        self.textView.delegate = self
        self.textView.backgroundColor = UIColor.redColor()
    }
    
    // MARK: - table view delegate & data source
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.frame = self.view.frame
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let account:Account = self.accounts.objectAtIndex(indexPath.row) as! Account

        let cell = tableView.dequeueReusableCellWithIdentifier(cell_id) as! SignatureTableViewCell
        cell.textView.text = account.signature as! String
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.accounts.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Top, animated: true)
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! SignatureTableViewCell
        self.textView.frame = cell.frame
        tableView.addSubview(self.textView)
        self.textView.text = cell.textView.text
        self.textView.becomeFirstResponder()
    }
    
    // MARK: - text view delegate
    func textViewDidChange(textView: UITextView) {
        if textView.contentSize.height > 100 {
            textView.frame.size.height = 100
            return
        }
        
        if textView.contentSize.height < 44 {
            textView.frame.size.height = 44
            return
        }
        
        textView.frame.size.height = textView.contentSize.height
        
        let indexPath = NSIndexPath(forRow: textView.tag, inSection: 0)
        self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        self.textView.removeFromSuperview()
    }
    
    // MARK: - private methods
    func cancelBtnAction (sender: AnyObject?) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            print("dismiss");
        }
    }
}
