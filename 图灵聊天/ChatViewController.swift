//
//  ChatViewController.swift
//  图灵聊天
//
//  Created by Yiqi Wang on 15/12/7.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import Alamofire
import SnapKit


//添加全局常量
let messageFontSize: CGFloat = 17 //消息字体大小
let toolBarMinHeight: CGFloat = 44 //输入框的高度

class InputTextView: UITextView {
  
}


class ChatViewController: UIViewController , UITextViewDelegate{

  //添加组成输入框的组件
  var toolBar: UIToolbar! //承载输入框中的组件 默认出现在屏幕最下方
  var textView: UITextView!
  var sendButton: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  override func canBecomeFirstResponder() -> Bool {
    return true
  }
  
  
  override var inputAccessoryView:UIView! {
    get {
      if toolBar == nil {
        
        toolBar = UIToolbar(frame: CGRectMake(0, 0, 0, toolBarMinHeight-0.5))
        
        textView = InputTextView(frame: CGRectZero)
        textView.backgroundColor = UIColor(white: 250/255, alpha: 1)
        textView.delegate = self
        textView.font = UIFont.systemFontOfSize(messageFontSize)
        textView.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 205/255, alpha:1).CGColor
        textView.layer.borderWidth = 0.5
        textView.layer.cornerRadius = 5
        textView.scrollsToTop = false
        textView.textContainerInset = UIEdgeInsetsMake(4, 3, 3, 3)
        toolBar.addSubview(textView)
        
        sendButton = UIButton(type: UIButtonType.System)
        sendButton.enabled = false
        sendButton.titleLabel?.font = UIFont.boldSystemFontOfSize(17)
        sendButton.setTitle("发送", forState: .Normal)
        sendButton.setTitleColor(UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1), forState: .Disabled)
        sendButton.setTitleColor(UIColor(red: 0.05, green: 0.47, blue: 0.91, alpha: 1.0), forState: .Normal)
        sendButton.contentEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        sendButton.addTarget(self, action: "sendAction", forControlEvents: UIControlEvents.TouchUpInside)
        toolBar.addSubview(sendButton)
        
        // 对组件进行Autolayout设置
        textView.translatesAutoresizingMaskIntoConstraints = false;
        sendButton.translatesAutoresizingMaskIntoConstraints = false;
        
        textView.snp_makeConstraints { (make) -> Void in
          make.left.equalTo(self.toolBar.snp_left).offset(8)
          make.top.equalTo(self.toolBar.snp_top).offset(7.5)
          make.right.equalTo(self.sendButton.snp_left).offset(-2)
          make.bottom.equalTo(self.toolBar.snp_bottom).offset(-8)
        }
        
        sendButton.snp_makeConstraints{ (make) -> Void in
          make.right.equalTo(self.toolBar.snp_right)
          make.bottom.equalTo(self.toolBar.snp_bottom).offset(-4.5)
          
        }
       
      }
      return toolBar
    }
  }
}
