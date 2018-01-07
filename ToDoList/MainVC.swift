//
//  ViewController.swift
//  ToDoList
//
//  Created by Ada on 1/6/18.
//  Copyright © 2018 yuxujian. All rights reserved.
//

import UIKit

class MainVC: UITableViewController {
    let itemArray = ["Find Mike", "Buy Eggos", "Destory Demogorgon"]
    
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
    
    


}

