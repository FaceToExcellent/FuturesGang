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
    UIView * bgView = [[UIView alloc]init];
    bgView.frame = CGRectMake(0, 0, self.frame.size.width, _heightForRow);
    [bgView setBackgroundColor:APP_Gray];
    [self addSubview:bgView];
    
    _topView = [[UIView alloc]init];
    _topView.frame = CGRectMake(1, 1, self.frame.size.width-2, _heightForRow-2);
    _topView.backgroundColor = APP_BACKCOLOR;
    [bgView addSubview:_topView];
    
    bgView.layer.masksToBounds = YES;
    bgView.layer.cornerRadius = 3.5;
    
    _topView.layer.masksToBounds = YES;
    _topView.layer.cornerRadius = 4;
   
    
    
    
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
    
    _bgView2 = [[UIView alloc]init];
    _bgView2.frame = CGRectMake(0, _heightForRow-1, self.frame.size.width, 0);
    [_bgView2 setBackgroundColor:APP_Gray];
    [self addSubview:_bgView2];
    
    _bgView3 = [[UIView alloc]init];
    _bgView3.frame = CGRectMake(1,_heightForRow+1, self.frame.size.width-2, 0);
    [_bgView3 setBackgroundColor:APP_Gray];
    [_bgView2 addSubview:_bgView3];
   
    _tableView = [[UITableView alloc]init];
    _tableView.frame = CGRectMake(0,_heightForRow, self.frame.size.width-2, 0);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = APP_TEXTFEILD_BACKCOLOR;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
  
    [_bgView3 addSubview:_tableView];
   //默认 隐藏
   _bgView2.hidden = YES;
    
    
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
        
        _bgView2.frame = CGRectMake(0, _heightForRow-1, self.frame.size.width, _datearray.count * _heightForRow);
        _bgView3.frame  = CGRectMake(1, 1, self.frame.size.width-2, _datearray.count * _heightForRow-2);
        _tableView.frame = CGRectMake(0, 0, self.frame.size.width-2, _datearray.count * _heightForRow-2);
      self.reH = _datearray.count * _heightForRow;
    }else
    {
     _bgView2.frame = CGRectMake(0, _heightForRow-1, self.frame.size.width, tableViewHeight);
        _bgView3.frame  = CGRectMake(1, 1, self.frame.size.width-2, tableViewHeight-2);
        _tableView.frame = CGRectMake(0, 0, self.frame.size.width-2, tableViewHeight-2);
      _tableView.frame = CGRectMake(1, 1, self.frame.size.width-2, tableViewHeight-2);
       self.reH =   tableViewHeight;
    }
    
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_bgView2.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(3.5, 3.5)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = _bgView2.bounds;
    maskLayer.path = maskPath.CGPath;
    _bgView2.layer.mask = maskLayer;
    
    
    UIBezierPath *maskPath2 = [UIBezierPath bezierPathWithRoundedRect:_bgView3.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(5, 5)];
    CAShapeLayer *maskLayer2 = [[CAShapeLayer alloc] init];
    maskLayer2.frame = _bgView3.bounds;
    maskLayer2.path = maskPath2.CGPath;
    _bgView3.layer.mask = maskLayer2;
    
    
    
    return  self.reH;
    
    
    
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
    
     _bgView2.hidden = !_bgView2.hidden;
    
    if (_delegate) {
        [_delegate DropDownMenureSetFramehiden];
    }
    //self.frame = CGRectMake(30*wb, 27*hb, 380*wb, _heightForRow);
}


-(void)tapView:(UITapGestureRecognizer *)sender{
    
    _bgView2.hidden = !_bgView2.hidden;
    
    if (_bgView2.hidden) {
        if (_delegate) {
            [_delegate DropDownMenureSetFramehiden];
        }
      
    }else
    {
        if (_delegate) {
            [_delegate DropDownMenureSetFrameShow];
        }
        
    }
}



@end
