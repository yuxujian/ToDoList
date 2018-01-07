//
//  ViewController.swift
//  ToDoList
//
//  Created by Ada on 1/6/18.
//  Copyright © 2018 yuxujian. All rights reserved.
//

import UIKit

class MainVC: UITableViewController {
    var itemArray = ["Find Mike", "Buy Eggos", "Destory Demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK - TableView  Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //显示内容
    override func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //当使用者点击某一个cell触发该方法
    override func tableView(_ tableView:UITableView, didSelectRowAt indexPath:IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //判断是否有checkMark
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    
    
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        //创建alert
        let alert = UIAlertController(title: "Add New ToDo List", message: "", preferredStyle: .alert)
        
        //创建Action
        let action  = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //当用户点击Add Item按钮后打印出下面代码结果
            self.itemArray.append(textField.text!)
            
            //重新加载 tableView 数据
            self.tableView.reloadData()
        }
        
        //在alert窗口里创建输入框
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "Create new item"
            
            textField = alertTextField
        }
        alert.addAction(action)
        
        //把alert显示到界面
        present(alert, animated: true, completion: nil)
    }
    
    
    


}

