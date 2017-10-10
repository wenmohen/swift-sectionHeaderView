//
//  menuViewController.swift
//  huadongTry
//
//  Created by nhl on 2017/10/9.
//  Copyright © 2017年 nhl. All rights reserved.
//

import UIKit

class menuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section < 2  {
            return 1
        }else{
            return 10
        }
       
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 {
        return 50
        }else
        {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let menuSectionHeaderView = UIView()
        if section == 2 {
        menuSectionHeaderView.frame = CGRect(x:0,y:0,width:IPhone_SCREEN_WIDTH,height:50)
        menuSectionHeaderView.backgroundColor=UIColor.white
        let titleArr:NSArray = ["综合排序","销量最高","距离最近","筛选"]
            let num = CGFloat(titleArr.count)
        for i in 0...titleArr.count-1 {
            let button = UIButton()
            button.frame = CGRect(x:CGFloat(i)*CGFloat(menuSectionHeaderView.frame.width/num),y:0,width:menuSectionHeaderView.frame.width/num,height:menuSectionHeaderView.frame.height)
            button.setTitleColor(UIColor.black, for: UIControlState.normal)
            button.titleLabel?.font=UIFont.systemFont(ofSize: 14)
            button.setTitle(titleArr[i] as? String, for: UIControlState.normal)
            menuSectionHeaderView.addSubview(button)
        }
      }
        return menuSectionHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var cellHeight:CGFloat = 44.00
        if indexPath.section == 0 {
            cellHeight = 160
        }
       else if indexPath.section == 1 {
           cellHeight = dataArr.count > 4 ? 180.00:100.00
        }else
        {
          cellHeight = 120
        }
        
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell:UITableViewCell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: nil)
            cell.backgroundColor=UIColor.cyan
            cell.selectionStyle=UITableViewCellSelectionStyle.none
            return cell
        }else if indexPath.section == 1 {
            let cell:MenuTableViewCell = MenuTableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell1")
             let cellHeight:CGFloat = dataArr.count > 4 ? 180.00:100.00
             cell.frame=CGRect(x:0,y:0,width:self.menuTableView.frame.width,height:cellHeight)
            cell._initMenuView(cellColorArr: colorArr,cellDataArr: dataArr)
            cell.selectionStyle=UITableViewCellSelectionStyle.none
            return cell
        }else {
        let cell:MenuListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MenuListTableViewCellID") as! MenuListTableViewCell
        return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var menuTableView: UITableView!
    
    @IBOutlet weak var tableViewTopConstraint: NSLayoutConstraint!
    var colorArr = NSArray()
    var dataArr = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        _loadData()
        
        _initTableView()
        
        // Do any additional setup after loading the view.
    }
    
    func _initTableView(){
        if (self.navigationController != nil) {
        tableViewTopConstraint.constant = 0
        }else{
            //        适配iPhone X
            tableViewTopConstraint.constant = CGFloat(IPhone_StatusBarHeight)-20
        }
        
        menuTableView.delegate=self
        
        menuTableView.dataSource=self
        
        //menuTableView的类型是Plain的时候sectionHeaderView可以正常悬浮，menuTableView的类型是Grouped的时候sectionHeaderView不悬浮
        
    }
    
    func _loadData(){
        colorArr = [UIColor.yellow,UIColor.orange,UIColor.gray,UIColor.green,UIColor.purple,UIColor.brown,UIColor.blue,UIColor.lightGray,UIColor.darkGray,UIColor.red,UIColor.cyan,UIColor.magenta]
        dataArr = ["美食","外卖","跑腿","果蔬","冷饮","面食","火锅","炸鸡","晚餐","午餐","早餐","茶饮","下午茶","冷食","热饮","鱼类","粉类","包子","零食","旅行","购票","住宿","飞机票","超市","宵夜","小吃","瓜果","购票","住宿","飞机票","超市","宵夜","小吃","瓜果"]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
