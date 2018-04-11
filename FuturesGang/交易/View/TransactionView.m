//
//  TransactionView.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/11.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "TransactionView.h"

@implementation TransactionView

-(instancetype)init
{
    if (self = [super init]) {
        
        [self makeUI];
    }
    return self;
}


-(void)makeUI{
    //下拉
    [self DropDownMenuAdd];
    
    //手数
    
    [self numberView];
    
    //价格
    [self priceView];
}

-(void)priceView{
    
    
    
    UILabel * jgLabel = [[UILabel alloc]init];
    jgLabel.frame =CGRectMake(30*wb, 245*hb, 60*wb, 30*hb);
    jgLabel.text = @"价格";
    jgLabel.textColor = [UIColor whiteColor];
    jgLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:jgLabel];
    
    
    
    UIView  * bgview  =[[UIView alloc]init];
    bgview.frame = CGRectMake(90*wb, 230*hb, 320*wb, 65*hb);
    bgview.layer.masksToBounds = YES;
    bgview.layer.cornerRadius = 4;
    bgview.layer.borderWidth = 1;
    bgview.layer.borderColor = APP_Gray.CGColor;
    [self addSubview:bgview];
    
    //左侧按钮
    
    _leftpriceButton = [[UIButton alloc]init];
    _leftpriceButton.frame = CGRectMake(0, 0, 65*hb, 65*hb);
    [_leftpriceButton setBackgroundImage:[UIImage imageNamed:@"zuo"] forState:UIControlStateNormal];
    [_leftpriceButton addTarget:self action:@selector(leftpriceButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:_leftpriceButton];
    
    _priceLabel = [[UILabel alloc]init];
    _priceLabel.frame = CGRectMake(65*hb, 0, bgview.frame.size.width -130*hb, 65*hb);
    _priceLabel.text = @"对手价";
    _priceLabel.textColor = [UIColor whiteColor];
    _priceLabel.textAlignment = NSTextAlignmentCenter;
    [bgview addSubview:_priceLabel];
    
    //右侧按钮
    
    
    _rightpriceButton = [[UIButton alloc]init];
    _rightpriceButton.frame = CGRectMake(bgview.frame.size.width - 65*hb, 0, 65*hb, 65*hb);
    [_rightpriceButton setBackgroundImage:[UIImage imageNamed:@"you"] forState:UIControlStateNormal];
    [_rightpriceButton addTarget:self action:@selector(rightpriceButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:_rightpriceButton];
}

-(void)leftpriceButtonClick{
   
    NSInteger i ;
    if ([_priceLabel.text isEqualToString: @"对手价"]) {
        i = 0;
    }else
    {
        i = [_priceLabel.text integerValue];
    }
    if ( i-1 == 0) {
        _priceLabel.text = @"对手价";
    }else{
    _priceLabel.text = [NSString stringWithFormat:@"%ld",i-1];
    }
}
-(void)rightpriceButtonClick{
    
    NSInteger i ;
    if ([_priceLabel.text isEqualToString: @"对手价"]) {
        i = 0;
    }else
    {
        i = [_priceLabel.text integerValue];
    }
    if (i+1 == 0) {
        _priceLabel.text = @"对手价";
    }else{
        _priceLabel.text = [NSString stringWithFormat:@"%ld",i+1];
    }
}

-(void)numberView{
    
    UILabel * ssLabel = [[UILabel alloc]init];
    ssLabel.frame =CGRectMake(30*wb, 145*hb, 60*wb, 30*hb);
    ssLabel.text = @"手数";
    ssLabel.textColor = [UIColor whiteColor];
    ssLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:ssLabel];
    
    
    
    UIView  * bgview  =[[UIView alloc]init];
    bgview.frame = CGRectMake(90*wb, 130*hb, 320*wb, 65*hb);
    bgview.layer.masksToBounds = YES;
    bgview.layer.cornerRadius = 4;
    bgview.layer.borderWidth = 1;
    bgview.layer.borderColor = APP_Gray.CGColor;
    [self addSubview:bgview];
    
    //左侧按钮
    
    _leftnumButton = [[UIButton alloc]init];
    _leftnumButton.frame = CGRectMake(0, 0, 65*hb, 65*hb);
    [_leftnumButton setBackgroundImage:[UIImage imageNamed:@"zuo"] forState:UIControlStateNormal];
    [_leftnumButton addTarget:self action:@selector(leftnumButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:_leftnumButton];
    
    _numLabel = [[UILabel alloc]init];
    _numLabel.frame = CGRectMake(65*hb, 0, bgview.frame.size.width -130*hb, 65*hb);
    _numLabel.text = @"1";
    _numLabel.textColor = [UIColor whiteColor];
    _numLabel.textAlignment = NSTextAlignmentCenter;
    [bgview addSubview:_numLabel];
    
    //右侧按钮
    
    
    _rightnumButton = [[UIButton alloc]init];
    _rightnumButton.frame = CGRectMake(bgview.frame.size.width - 65*hb, 0, 65*hb, 65*hb);
    [_rightnumButton setBackgroundImage:[UIImage imageNamed:@"you"] forState:UIControlStateNormal];
    [_rightnumButton addTarget:self action:@selector(rightnumButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:_rightnumButton];
    
    
}
-(void)rightnumButtonClick{
    
    NSInteger i = [_numLabel.text integerValue];
    _numLabel.text = [NSString stringWithFormat:@"%ld",i+1];
}
-(void)leftnumButtonClick{
    NSInteger i = [_numLabel.text integerValue];
    _numLabel.text = [NSString stringWithFormat:@"%ld",i-1];
}
-(void)DropDownMenuAdd{
    _menuRowHeight = 65*hb;
    _menu = [[DropDownMenu alloc]initWithFrame:CGRectMake(30*wb, 27*hb, 390*wb, _menuRowHeight+250*hb)];
    [_menu setMyheightForRow:_menuRowHeight];
    NSMutableArray * arr = [[NSMutableArray alloc]initWithArray:@[@"狐金1806",@"狐金1802",@"狐金1803",@"狐金1804",@"狐金1805",@"狐金1807",@"狐金1808"]];
    [_menu setMydatearray:arr];
    [_menu setMytopViewlabel:arr[0]];
    CGFloat reH =  [_menu setMytableViewHeight:250*hb];
    _menu.frame = CGRectMake(30*wb, 27*hb, 390*wb,_menuRowHeight+reH);
    [_menu setMyleftImage:[UIImage imageNamed:@"xia"]];
    
    
    
    [self addSubview:_menu];
}



@end
