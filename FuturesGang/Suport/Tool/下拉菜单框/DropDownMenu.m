//
//  DropDownMenu.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/11.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "DropDownMenu.h"
#import "DropDownMenuCell.h"
@implementation DropDownMenu

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self makeUI];
    }
    return self;
}


-(void)makeUI{
    //顶部topView
    _topView = [[UIView alloc]init];
    _topView.frame = CGRectMake(0, 0, self.frame.size.width, _heightForRow);
    _topView.layer.borderWidth = 1;
    _topView.layer.borderColor = APP_Gray.CGColor;
    [self addSubview:_topView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapView:)];
    
    //设置轻拍次数
    tap.numberOfTapsRequired = 1;
    //设置手指字数
    tap.numberOfTouchesRequired = 1;
    
    //别忘了添加到testView上
    [_topView addGestureRecognizer:tap];
    
  
    
    
    //顶部 toplabel
    
    _topViewlabel = [[UILabel alloc]init];
    _topViewlabel.frame = CGRectMake(4, 0, self.frame.size.width-_heightForRow, _heightForRow);
    _topViewlabel.textAlignment = NSTextAlignmentLeft;
    _topViewlabel.textColor = [UIColor whiteColor];
    _topViewlabel.adjustsFontSizeToFitWidth = YES;
    _topViewlabel.font = [UIFont systemFontOfSize:14];
    [_topView addSubview:_topViewlabel];
    
    //左侧image
    
    _leftImage = [[UIImageView alloc]init];
    _leftImage.frame = CGRectMake(self.frame.size.width -_heightForRow, 0, _heightForRow,_heightForRow);
    _leftImage.contentMode = UIViewContentModeScaleAspectFill;
    _leftImage.clipsToBounds = YES;
    [_topView addSubview:_leftImage];
    
    
    //table
    _tableView = [[UITableView alloc]init];
    _tableView.frame = CGRectMake(0,_heightForRow, self.frame.size.width, 0);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
  
    [self addSubview:_tableView];
    
    _tableView.layer.masksToBounds = YES;
    _tableView.layer.cornerRadius  = _tableView.frame.size.width/32;
    _tableView.layer.borderWidth = 1;
    _tableView.layer.borderColor = APP_Gray.CGColor;
    
    
}
-(void)setMytopViewlabel:(NSString*)topViewlabel{
    _topViewlabel.text = topViewlabel;
}
-(void)setMyheightForRow:(CGFloat) heightForRow{
    _heightForRow = heightForRow;
    
   
    [self makeUI];
}
-(void)setMyleftImage:(UIImage*)image{
    
    _leftImage.image = image;
}
-(CGFloat)setMytableViewHeight:(CGFloat)tableViewHeight{
    if (tableViewHeight > _datearray.count * _heightForRow) {
        _tableView.frame = CGRectMake(0, _heightForRow, self.frame.size.width, _datearray.count * _heightForRow);
        return _datearray.count * _heightForRow;
    }else
    {
      _tableView.frame = CGRectMake(0, _heightForRow, self.frame.size.width, tableViewHeight);
        return  tableViewHeight;
    }
    
    
    
}
-(void)setMydatearray:(NSMutableArray*)array{
    _datearray = array;
   // NSLog(@"%@",_datearray);
    [_tableView reloadData];
}

#pragma mark _tableView delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datearray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _heightForRow;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DropDownMenuCell * cell  = [tableView dequeueReusableCellWithIdentifier:@"DropDownMenuCell"];
    if (!cell) {
        cell = [[DropDownMenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DropDownMenuCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
   
    [cell setMycelltitle:_datearray[indexPath.row]];
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    _topViewlabel.text = _datearray[indexPath.row];
    
     _tableView.hidden = !_tableView.hidden;
}


-(void)tapView:(UITapGestureRecognizer *)sender{
    
    if (_delegate) {
        [_delegate DropDownMenuTap];
    }
    
}


@end
