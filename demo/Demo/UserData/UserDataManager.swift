//
//  UserDataManager.swift
//  Demo
//
//  Created by sddz_yuxiaohua on 15/10/20.
//  Copyright © 2015年 X Co., Ltd. All rights reserved.
//

import UIKit

class Account: NSObject {
    internal var name:NSString
    internal var email:NSString
    internal var signature:NSString?
    
    init(name:NSString!, email:NSString!, signature:NSString?) {
        self.name = name
        self.email = email
        self.signature = signature
    }
    
    internal override var description:String {
        get {
            return String(format: "N:%@, S:%@", arguments: [self.name, self.email])
        }
    }
}

private let _default_manager = UserDataManager()

class UserDataManager: NSObject {
    
    var accounts:NSArray?
    
    private struct static_ivar {
        static let defaultManager = UserDataManager()
        static var onceToken:dispatch_once_t = 0
    }
    
    class func defaultManager() -> UserDataManager! {
        dispatch_once(&(static_ivar.onceToken)) { () -> Void in
            static_ivar.defaultManager.loadData()
        }
        
        return static_ivar.defaultManager
    }
    
    private func loadData() {
        let accounts = NSMutableArray()
        for var idx = 0; idx < 30; idx++ {
            let name = NSString(format: "name_%d", idx)
            let email = NSString(format: "email_%d", idx)
            let signature = NSString(format: "signature_%d:来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师|来自网易邮箱大师", idx)
            
            accounts.addObject(Account(name: name, email: email, signature: signature))
        }
        
        self.accounts = accounts as NSArray!
    }
}
