//
//  MyAlertView.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/10.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "MyAlertView.h"

@implementation MyAlertView

-(id)initWithNormal{
    
    if (self = [super init]) {
        
        [self setbackground];
        [self makeUI];
    }
    return self;
}

-(id)initWithcondition{
    if (self = [super init]) {
        
        [self setbackground];
        [self makeUIcondition];
        [self  topButtonCLick];//默认选中
    }
    return self;
}


-(void)makeUIcondition{
    UIView * bgview = [[UIView alloc]init];
    bgview.frame = CGRectMake((SCREEN_WIDTH-604*wb)/2, 230*hb, 604*wb, 330*hb);
    [bgview setBackgroundColor:[UIColor whiteColor]];
    bgview.layer.masksToBounds = YES;
    bgview.layer.cornerRadius = bgview.frame.size.width/32;
    [self addSubview:bgview];
    
    //标题
    _Alerttitle = [[UILabel alloc]init];
    _Alerttitle.frame =CGRectMake(0, 30*hb, 550*wb, 40*hb);
    [_Alerttitle setText:@"条件单设置"];
    [_Alerttitle setTextColor:[UIColor blackColor]];
    [_Alerttitle setFont:[UIFont systemFontOfSize:14]];
    _Alerttitle.textAlignment = NSTextAlignmentCenter;
    _Alerttitle.numberOfLines = 1;
    [bgview addSubview:_Alerttitle];
    
    // 这里需要 chong'xie
   
    
    UILabel * zxlabel = [[UILabel alloc]init];
    zxlabel.frame = CGRectMake(25*wb, 120*hb, 90*wb, 30*hb);
    zxlabel.text = @"最新价";
    zxlabel.textColor = [UIColor blackColor];
    zxlabel.font = [UIFont systemFontOfSize:12];
    [bgview addSubview:zxlabel];
    
     _topButton = [[UIButton alloc]init];
    _topButton.frame =CGRectMake(130*wb, 90*hb, 45*wb, 45*wb);
    [_topButton setBackgroundImage:[UIImage imageNamed:@"DUI"] forState:UIControlStateSelected];
    [_topButton  setBackgroundImage:[UIImage imageNamed:@"WEIXUANZHONG"] forState:UIControlStateNormal];
    
    [_topButton addTarget:self action:@selector(topButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:_topButton];
    
    UILabel * biggerlabel = [[UILabel alloc]init];
    biggerlabel.frame = CGRectMake(200*wb, 95*hb, 70*wb, 30*hb);
    biggerlabel.text = @">=";
    biggerlabel.textColor = [UIColor blackColor];
    biggerlabel.font = [UIFont systemFontOfSize:12];
    [bgview addSubview:biggerlabel];
    
    
    
   _downButton = [[UIButton alloc]init];
    _downButton.frame =CGRectMake(130*wb, 150*hb, 45*wb, 45*wb);
    [_downButton setBackgroundImage:[UIImage imageNamed:@"DUI"] forState:UIControlStateSelected];
    [_downButton  setBackgroundImage:[UIImage imageNamed:@"WEIXUANZHONG"] forState:UIControlStateNormal];
    
    [_downButton addTarget:self action:@selector(downButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:_downButton];
    
    UILabel * litterlabel = [[UILabel alloc]init];
    litterlabel.frame = CGRectMake(200*wb, 155*hb, 70*wb, 30*hb);
    litterlabel.text = @"<=";
    litterlabel.textColor = [UIColor blackColor];
    litterlabel.font = [UIFont systemFontOfSize:12];
    [bgview addSubview:litterlabel];
    
    
    
    
    _addButton = [[UIButton alloc]init];
    _addButton.frame =CGRectMake(270*wb, 120*hb, 40*wb, 40*wb);
    [_addButton setBackgroundImage:[UIImage imageNamed:@"zengjia"] forState:UIControlStateNormal];
    [_addButton  setBackgroundImage:[UIImage imageNamed:@"zengjia_Selected"] forState:UIControlStateHighlighted];
    
    [_addButton addTarget:self action:@selector(addButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:_addButton];
    
    
    _textfield = [[UITextField alloc]init];
    _textfield.frame = CGRectMake(330*wb, 108*hb, 182*wb, 60*hb);
    _textfield.layer.masksToBounds = YES;
    _textfield.layer.cornerRadius =  60*hb/16;
    _textfield.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    _textfield.layer.borderColor = [UIColor blackColor].CGColor;
    _textfield.layer.borderWidth = .5;
    [bgview addSubview:_textfield];
    
    
    _textfield.text = [NSString stringWithFormat:@"%.2f",_defultPrice];
    
    _reduceButton = [[UIButton alloc]init];
    _reduceButton.frame =CGRectMake(bgview.frame.size.width-70*wb, 120*hb, 40*wb, 40*wb);
    [_reduceButton setBackgroundImage:[UIImage imageNamed:@"jianshao"] forState:UIControlStateNormal];
    [_reduceButton  setBackgroundImage:[UIImage imageNamed:@"jianshao_Selected"] forState:UIControlStateHighlighted];
    
    [_reduceButton addTarget:self action:@selector(reduceButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:_reduceButton];
    
    
    
#pragma mark ^^^^^^^^^^^^^^^^^^^^^^^^
    //line1
    
    UIView * line1  =[[UIView alloc]init];
    line1.frame =CGRectMake(0, 240*hb, 550*wb, 1);
    line1.backgroundColor = RGBA(243, 243, 243, 1);
    [bgview addSubview:line1];
    
    //lin2
    
    UIView * line2  =[[UIView alloc]init];
    line2.frame =CGRectMake(550*wb/2, 240*hb,1 , bgview.frame.size.height-160*wb);
    line2.backgroundColor = RGBA(243, 243, 243, 1);
    [bgview addSubview:line2];
    
    
    //取消
    UIButton * cancelButton = [[UIButton alloc]init];
    cancelButton.frame = CGRectMake(0, 240*hb, 260*wb, 85*hb);
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:APP_BLUE forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [cancelButton addTarget:self action:@selector(qxButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:cancelButton];
    //确定
    UIButton * qdButton = [[UIButton alloc]init];
    qdButton.frame = CGRectMake(bgview.frame.size.width -260*wb, 240*hb, 260*wb, 85*hb);
    [qdButton setTitle:@"确定" forState:UIControlStateNormal];
    [qdButton setTitleColor:APP_BLUE forState:UIControlStateNormal];
    [qdButton addTarget:self action:@selector(qdButtonClickwithCondtion) forControlEvents:UIControlEventTouchUpInside];
    qdButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [bgview addSubview:qdButton];
    
    
}
-(void)setbackground{
    self.backgroundColor = [UIColor clearColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelButtonClick)];
    [view addGestureRecognizer:tap];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = 0.5;
    [self addSubview:view];
    self.alpha = 1;
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}
-(void)makeUI{
  
    UIView * bgview = [[UIView alloc]init];
    bgview.frame = CGRectMake((SCREEN_WIDTH-550*wb)/2, 430*hb, 550*wb, 250*hb);
    [bgview setBackgroundColor:[UIColor whiteColor]];
    bgview.layer.masksToBounds = YES;
    bgview.layer.cornerRadius = bgview.frame.size.width/32;
    [self addSubview:bgview];
    
    //标题
    _Alerttitle = [[UILabel alloc]init];
    _Alerttitle.frame =CGRectMake(0, 30*hb, 550*wb, 40*hb);
    [_Alerttitle setText:@"警告"];
    [_Alerttitle setTextColor:[UIColor blackColor]];
    [_Alerttitle setFont:[UIFont systemFontOfSize:14]];
    _Alerttitle.textAlignment = NSTextAlignmentCenter;
    _Alerttitle.numberOfLines = 1;
    [bgview addSubview:_Alerttitle];
    
    //message
    _AlertMessage = [[UILabel alloc]init];
    _AlertMessage.frame =CGRectMake(65*wb, 80*hb, 415*wb, 75*hb);
    [_AlertMessage setText:@"打开此功能后,下单时将没有确认提示,请谨慎使用"];
    [_AlertMessage setTextColor:[UIColor blackColor]];
    [_AlertMessage setFont:[UIFont systemFontOfSize:12]];
    _AlertMessage.textAlignment = NSTextAlignmentCenter;
    _AlertMessage.numberOfLines = 2;
    [bgview addSubview:_AlertMessage];
    
    //line1
    
    UIView * line1  =[[UIView alloc]init];
    line1.frame =CGRectMake(0, 160*hb, 550*wb, 1);
    line1.backgroundColor = RGBA(243, 243, 243, 1);
    [bgview addSubview:line1];
    
    //lin2
    
    UIView * line2  =[[UIView alloc]init];
    line2.frame =CGRectMake(550*wb/2, 160*hb,1 , bgview.frame.size.height-160*wb);
    line2.backgroundColor = RGBA(243, 243, 243, 1);
    [bgview addSubview:line2];
    
    
    //取消
    UIButton * cancelButton = [[UIButton alloc]init];
    cancelButton.frame = CGRectMake(0, 160*hb, 260*wb, 85*hb);
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:APP_BLUE forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [cancelButton addTarget:self action:@selector(qxButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:cancelButton];
    //确定
    UIButton * qdButton = [[UIButton alloc]init];
    qdButton.frame = CGRectMake(bgview.frame.size.width -260*wb, 160*hb, 260*wb, 85*hb);
    [qdButton setTitle:@"确定" forState:UIControlStateNormal];
    [qdButton setTitleColor:APP_BLUE forState:UIControlStateNormal];
    [qdButton addTarget:self action:@selector(qdButtonClick) forControlEvents:UIControlEventTouchUpInside];
    qdButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [bgview addSubview:qdButton];
    
    
    
}
-(void)qxButtonClick{
    //取消
    _cancelBlock();
    [self cancelButtonClick];
   
}
-(void)qdButtonClick{
    //确定
    _okBlock();
    [self cancelButtonClick];
}

-(void)qdButtonClickwithCondtion{
    _conditionBLock(_biggerOrlitter,_textfield.text);
    [self cancelButtonClick];
}
-(void)setCancelBlock:(MyAlertViewCancelBLock)cancelBlock{
    _cancelBlock = cancelBlock;
}
-(void)setOkBlock:(MyAlertViewViewOKBLock)okBlock{
    _okBlock = okBlock;
}

-(void)setConditionBLock:(MyAlertViewconditionBLock)conditionBLock{
    _conditionBLock = conditionBLock;
}
- (void)cancelButtonClick
{
     [self removeFromSuperview];
   
}


#pragma mark 条件单相关
-(void)topButtonCLick{
    _topButton.selected = YES;
    
    _downButton.selected = NO;
    
    _biggerOrlitter = @"1";
}

-(void)downButtonCLick{
    _topButton.selected = NO;
    
    _downButton.selected = YES;
    
    _biggerOrlitter = @"0";
}

-(void)addButtonCLick{
    float price = [_textfield.text floatValue];
    if (price +_step < _maxPrice) {
        
        _textfield.text  =[NSString stringWithFormat:@"%.2f",price +_step];
    }else
    {
        _textfield.text  =[NSString stringWithFormat:@"%.2f",_maxPrice];
    }
    
}

-(void)reduceButtonCLick{
    float price = [_textfield.text floatValue];
    if (price -_step > _minPrice) {
        
        _textfield.text  =[NSString stringWithFormat:@"%.2f",price -_step];
    }else
    {
        _textfield.text  =[NSString stringWithFormat:@"%.2f",_minPrice];
    }
}
@end
