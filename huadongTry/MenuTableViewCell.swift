//
//  MenuTableViewCell.swift
//  huadongTry
//
//  Created by nhl on 2017/10/9.
//  Copyright © 2017年 nhl. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell,UIScrollViewDelegate {
    let menuPageControl = UIPageControl()//小圆点
    let menuScrollView = UIScrollView()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }


    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func _initMenuView(cellColorArr:NSArray,cellDataArr:NSArray){
        print("adada")
        if cellDataArr.count <= 0  {
            
            return
        }

        let bgView = UIView(frame:CGRect(x:0,y:0,width:IPhone_SCREEN_WIDTH,height:self.frame.height))
        self.addSubview(bgView)
        print(self.frame.height)
        
        menuScrollView.frame = CGRect(x:0,y:0,width:IPhone_SCREEN_WIDTH,height:bgView.frame.height-20)
        menuScrollView.backgroundColor=UIColor.lightText
        menuScrollView.showsHorizontalScrollIndicator=false
        
        menuScrollView.isPagingEnabled = true
        menuScrollView.delegate=self
        bgView.addSubview(menuScrollView)
   
        var temp:Int = 0
        
        for i in 0...cellDataArr.count-1 {
            let menuPage = Int(i/8)
            let itemH = Int(i % 4)
            let itemW = Int((i-(menuPage*8)) / 4)
            let colorCount = cellColorArr.count
            if temp != menuPage {
                temp = Int(Int(arc4random())%colorCount)
                temp = menuPage
            }
            //            print("除数=====\(itemW)======余数%\(itemH)")
            let itemView = UIView(frame:CGRect(x:CGFloat(Int(IPhone_SCREEN_WIDTH/4) * itemH) + CGFloat(Int(menuPage) * Int(IPhone_SCREEN_WIDTH)),y:0 + CGFloat( 82 * itemW),width:IPhone_SCREEN_WIDTH/4-4,height:80))
            itemView.tag=10+i
            menuScrollView.addSubview(itemView)
            let itemImageView=UIImageView(image:UIImage(named:"icon_homepage_movieCategory.png"))
            itemImageView.frame=CGRect(x:itemView.frame.size.width/2-22,y:15,width:44,height:44)
            itemImageView.backgroundColor=cellColorArr[temp] as? UIColor
            itemView.addSubview(itemImageView)
            
            let itemTitleLabel=UILabel(frame:CGRect(x:0,y:15+44,width: itemView.frame.size.width,height:20))
            itemTitleLabel.text = cellDataArr[i] as? String
            itemTitleLabel.textAlignment=NSTextAlignment.center
            itemTitleLabel.font=UIFont.systemFont(ofSize: 13)
            itemView.addSubview(itemTitleLabel)
            
            let tapGes:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(ClickMenuItemAction))
            itemView.addGestureRecognizer(tapGes)
            
        }
        
        let totalPage = Int(cellDataArr.count/8)+1//总页数
    menuScrollView.contentSize=CGSize(width:IPhone_SCREEN_WIDTH*CGFloat(totalPage),height:bgView.frame.height-20)
        menuPageControl.frame = CGRect(x:IPhone_SCREEN_WIDTH/2-20,y:menuScrollView.frame.height,width:0,height:20)
        menuPageControl.currentPage=0
        menuPageControl.numberOfPages=totalPage
        bgView.addSubview(menuPageControl)
        menuPageControl.currentPageIndicatorTintColor=UIColor.orange
        menuPageControl.pageIndicatorTintColor=UIColor.gray
        
    }
    
    @objc func ClickMenuItemAction(tap:UITapGestureRecognizer)  {
         print("点击")
        print("点击\(tap.view?.tag ?? 9)")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let scrollViewW:CGFloat = scrollView.frame.size.width
        let x = scrollView.contentOffset.x
        let page:Int = Int((x+scrollViewW/2)/scrollViewW)
        menuPageControl.currentPage=page
    }
    //MARK:scrollviewdelegate
    //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //        let scrollViewW:CGFloat = scrollView.frame.size.width
    //        let x = scrollView.contentOffset.x
    //        let page:Int = Int((x+scrollViewW/2)/scrollViewW)
    //        menuPageControl.currentPage=page
    //    }
}
