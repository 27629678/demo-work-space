//
//  TextTableViewController.swift
//  Demo
//
//  Created by sddz_yuxiaohua on 15/10/19.
//  Copyright © 2015年 NetEase (hangzhou) Network Co.,Ltd. All rights reserved.
//

import UIKit

class TextTableViewController: UITableViewController, UITextViewDelegate {
    
    var cell_height:CGFloat = 44.0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // title
        self.title = "text view demo"
        
        // cancel btn
        let cancel_btn = UIBarButtonItem.init(
            title: "Cancle",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: Selector("cancelBtnAction:"))
        self.navigationItem.leftBarButtonItem = cancel_btn;
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cell_height
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        
        cell.textLabel?.text = "reuse identifier"
        let text_field = UITextField(frame: CGRectMake(0, 0, 44, 44))
        text_field.backgroundColor = UIColor.redColor()
        cell.addSubview(text_field)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        cell_height += 4
        
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
    // MARK: - private methods
    func cancelBtnAction (sender: AnyObject?) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            print("dismiss");
        }
    }
}
