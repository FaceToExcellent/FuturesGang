//
//  QuotationView.h
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/16.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuotationView : UIView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;

@property(nonatomic,strong)YButton * zfButton;


@end
