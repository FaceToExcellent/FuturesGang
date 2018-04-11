//
//  DropDownMenu.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/11.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DropDownMenuDelegate <NSObject>

//预留
@end

@interface DropDownMenu : UIView<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIImageView * leftImage;//左侧角标

@property(nonatomic,strong)UIView * topView; //默认选中的view

@property(nonatomic,assign) CGFloat   heightForRow;//行高

@property(nonatomic,strong)UITableView * tableView;//下拉菜单部分

@property(nonatomic,assign) CGFloat   tableViewHeight;//table高度

@property(nonatomic,strong)NSMutableArray * datearray;//数据

@property(nonatomic,strong)UILabel  * topViewlabel;//顶部 label


@property(nonatomic,strong) UIView * bgView2;
@property(nonatomic,strong) UIView * bgView3;
//@property(nonatomic,weak)id<DropDownMenuDelegate> delegate;

-(void)setMytopViewlabel:(NSString*)topViewlabel;
-(void)setMyleftImage:(UIImage*)image;
-(void)setMyheightForRow:(CGFloat) heightForRow;
-(CGFloat)setMytableViewHeight:(CGFloat)tableViewHeight;
-(void)setMydatearray:(NSMutableArray*)array;


@end
