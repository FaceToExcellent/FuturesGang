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
    
    
    //手数
    
    [self numberView];
    
    //价格
    [self priceView];
    
    //最新 卖价 买价
    [self treeLabelView];
    
    //红 绿灰
    
    [self treeButtonView];
    
    //持仓 可撤 委托 成交
    [self fourButtonView];
    
    //默认选中第一个
    [self chicangButtonCLick];
    
    //持仓 可撤 委托 成交 的 view
    [self fourViewmake];
    
    //下拉 放在下面保证最上层
    [self DropDownMenuAdd];
    
}


-(void)alertviewMake:(NSString*)name price:(NSString*)price how:(NSString*)how handnum:(NSString*)num{
    _alert = [[MyAlertView alloc]initWithNormal];
    __weak typeof(self) weakSelf = self;
    _alert.Alerttitle.text = @"下单确认";
    _alert.AlertMessage.text = [NSString stringWithFormat:@"%@,价格：%@,%@ %@ 手",name,price,how,num];
    [weakSelf.alert setOkBlock:^{
        // NSLog(@"确定");
    }];
    
    [weakSelf.alert setCancelBlock:^{
        // NSLog(@"取消");
      
    }];
    
    [self addSubview:_alert];
}

-(void)fourViewmake{
    
    _chicangView = [[UIView alloc]init];
    _chicangView.frame =CGRectMake(0, 585*hb, SCREEN_WIDTH, SCREEN_HEIGHT- StatusBarAndNavigationBarHeight-100*hb-3-585*hb);
    _chicangView.backgroundColor =  APP_TEXTFEILD_BACKCOLOR;
    
    _kecheView = [[UIView alloc]init];
    _kecheView.frame =CGRectMake(0, 585*hb, SCREEN_WIDTH, SCREEN_HEIGHT- StatusBarAndNavigationBarHeight-100*hb-3-585*hb);
    _kecheView.backgroundColor =  [UIColor greenColor];
    
    
    _weituoView = [[UIView alloc]init];
    _weituoView.frame =CGRectMake(0, 585*hb, SCREEN_WIDTH, SCREEN_HEIGHT- StatusBarAndNavigationBarHeight-100*hb-3-585*hb);
    _weituoView.backgroundColor =  [UIColor orangeColor];
    
    
    _chengjiaoView = [[UIView alloc]init];
    _chengjiaoView.frame =CGRectMake(0, 585*hb, SCREEN_WIDTH, SCREEN_HEIGHT- StatusBarAndNavigationBarHeight-100*hb-3-585*hb);
    _chengjiaoView.backgroundColor =  [UIColor whiteColor];
    
}
-(void)fourButtonView{
    UIView * conView  =[[UIView alloc]init];
    conView.frame = CGRectMake(0, 460*hb + 25*hb, SCREEN_WIDTH, 100*hb);
    [conView setBackgroundColor:APP_BACKCOLOR];
    [self addSubview:conView];
    
    //成交
    _chicangButton = [[UIButton alloc]init];
    _chicangButton.frame = CGRectMake(0, 0, SCREEN_WIDTH/4, 100*hb);
    
    [_chicangButton setTitle:@"成交" forState:UIControlStateNormal];
    [_chicangButton setBackgroundImage:[UIImage imageNamed:@"lanse"] forState:UIControlStateSelected];
    [_chicangButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_chicangButton setTitleColor:APP_Gray forState:UIControlStateNormal];
    [_chicangButton addTarget:self action:@selector(chicangButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [conView addSubview:_chicangButton];
    //可撤
    _kecheButton = [[UIButton alloc]init];
    _kecheButton.frame = CGRectMake(SCREEN_WIDTH/4, 0, SCREEN_WIDTH/4, 100*hb);
    
    [_kecheButton setTitle:@"可撤" forState:UIControlStateNormal];
    [_kecheButton setBackgroundImage:[UIImage imageNamed:@"lanse"] forState:UIControlStateSelected];
    [_kecheButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_kecheButton setTitleColor:APP_Gray forState:UIControlStateNormal];
    [_kecheButton addTarget:self action:@selector(kecheButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [conView addSubview:_kecheButton];
    
    //委托
    _weituoButton = [[UIButton alloc]init];
    _weituoButton.frame = CGRectMake(SCREEN_WIDTH/4 *2, 0, SCREEN_WIDTH/4, 100*hb);
    
    [_weituoButton setTitle:@"委托" forState:UIControlStateNormal];
    [_weituoButton setBackgroundImage:[UIImage imageNamed:@"lanse"] forState:UIControlStateSelected];
    [_weituoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_weituoButton setTitleColor:APP_Gray forState:UIControlStateNormal];
    [_weituoButton addTarget:self action:@selector(weituoButtonclick) forControlEvents:UIControlEventTouchUpInside];
    [conView addSubview:_weituoButton];
    //成交
    _chengjiaoButton = [[UIButton alloc]init];
    _chengjiaoButton.frame = CGRectMake(SCREEN_WIDTH/4 *3 , 0, SCREEN_WIDTH/4, 100*hb);
    
    [_chengjiaoButton setTitle:@"成交" forState:UIControlStateNormal];
    [_chengjiaoButton setBackgroundImage:[UIImage imageNamed:@"lanse"] forState:UIControlStateSelected];
    [_chengjiaoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_chengjiaoButton setTitleColor:APP_Gray forState:UIControlStateNormal];
    [_chengjiaoButton addTarget:self action:@selector(chengjiaoButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [conView addSubview:_chengjiaoButton];

}



-(void)chicangButtonCLick{
    _chicangButton.selected  = !_chicangButton.selected;
    if (_chicangButton.selected) {
        _chengjiaoButton.selected = NO;
        _weituoButton.selected  = NO;
        _kecheButton.selected  = NO;
    }
    
    [self addSubview:_chicangView];
    [_chengjiaoView removeFromSuperview];
    [_weituoView removeFromSuperview];
    [_kecheView removeFromSuperview];
}

-(void)kecheButtonCLick{
    
    _kecheButton.selected  = !_kecheButton.selected;
    if (_kecheButton.selected) {
        _chengjiaoButton.selected = NO;
        _weituoButton.selected  = NO;
        _chicangButton.selected  = NO;
    }
    
    
    [self addSubview:_kecheView];
    [_chengjiaoView removeFromSuperview];
    [_weituoView removeFromSuperview];
    [_chicangView removeFromSuperview];
}

-(void)weituoButtonclick{
    
    _weituoButton.selected  = !_weituoButton.selected;
    if (_weituoButton.selected) {
        _chengjiaoButton.selected = NO;
        _kecheButton.selected  = NO;
        _chicangButton.selected  = NO;
    }
    
    [self addSubview:_weituoView];
    [_chengjiaoView removeFromSuperview];
    [_kecheView removeFromSuperview];
    [_chicangView removeFromSuperview];
}

-(void)chengjiaoButtonCLick{
    _chengjiaoButton.selected  = !_chengjiaoButton.selected;
    if (_chengjiaoButton.selected) {
        _weituoButton.selected = NO;
        _kecheButton.selected  = NO;
        _chicangButton.selected  = NO;
    }
    
    [self addSubview:_chengjiaoView];
    [_weituoView removeFromSuperview];
    [_kecheView removeFromSuperview];
    [_chicangView removeFromSuperview];
}
-(void)treeButtonView{
    
    _redButton = [[TransactionButton alloc]init];
    _redButton.frame = CGRectMake(30*wb, 340*hb, 200*wb, 120*hb);
    [_redButton setBackgroundColor:APP_RED];
    [_redButton setmynamelabel:@"买" numlabel:@"29563"];
    _redButton.layer.masksToBounds = YES;
    _redButton.layer.cornerRadius =  _redButton.frame.size.width/32;
    
    [_redButton addTarget:self action:@selector(redButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_redButton];
    
    
    _greenButton = [[TransactionButton alloc]init];
    _greenButton.frame = CGRectMake(275*wb, 340*hb, 200*wb, 120*hb);
    [_greenButton setBackgroundColor:APP_Green];
    [_greenButton setmynamelabel:@"卖" numlabel:@"29569"];
    _greenButton.layer.masksToBounds = YES;
    _greenButton.layer.cornerRadius =  _greenButton.frame.size.width/32;
     [_greenButton addTarget:self action:@selector(greenButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_greenButton];
    
    
    _grayButton = [[TransactionButton alloc]init];
    _grayButton.frame = CGRectMake(520*wb, 340*hb, 200*wb, 120*hb);
    [_grayButton setBackgroundColor:APP_Gray];
    [_grayButton setmynamelabel:@"平" numlabel:@"无仓位"];
    _grayButton.layer.masksToBounds = YES;
    _grayButton.layer.cornerRadius =  _grayButton.frame.size.width/32;
    
    [_grayButton addTarget:self action:@selector(grayButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_grayButton];
    
}

-(void)redButtonCLick{
    [self alertviewMake:_menu.topViewlabel.text price:_redButton.numlabel.text how:_redButton.nameLabel.text handnum:_numLabel.text];
}

-(void)greenButtonClick{
    
    [self alertviewMake:_menu.topViewlabel.text price:_greenButton.numlabel.text how:_greenButton.nameLabel.text handnum:_numLabel.text];
}

-(void)grayButtonClick{
    
     [self alertviewMake:_menu.topViewlabel.text price:_grayButton.numlabel.text how:_grayButton.nameLabel.text handnum:_numLabel.text];
}

-(void)treeLabelView{
    
    UILabel * zxLabel = [[UILabel alloc]init];
    zxLabel.frame =CGRectMake(440*wb, 40*hb, 60*wb, 30*hb);
    zxLabel.text = @"最新";
    zxLabel.textColor = [UIColor whiteColor];
    zxLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:zxLabel];
    
    _freshLabel = [[UILabel alloc]init];
    _freshLabel.frame =CGRectMake(510*wb, 40*hb, 130*wb, 30*hb);
    _freshLabel.text = @"299";
    _freshLabel.textColor = [UIColor whiteColor];
    _freshLabel.textAlignment = NSTextAlignmentRight;
    _freshLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_freshLabel];
    
    _freshnum = [[UILabel alloc]init];
    _freshnum.frame =CGRectMake(SCREEN_WIDTH -110*wb, 40*hb, 80*wb, 30*hb);
    _freshnum.text = @"29";
    _freshnum.textColor = [UIColor whiteColor];
    _freshnum.textAlignment = NSTextAlignmentRight;
    _freshnum.font = [UIFont systemFontOfSize:12];
    [self addSubview:_freshnum];
    
    UILabel * mjLabel = [[UILabel alloc]init];
    mjLabel.frame =CGRectMake(440*wb, 145*hb, 60*wb, 30*hb);
    mjLabel.text = @"卖价";
    mjLabel.textColor = [UIColor whiteColor];
    mjLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:mjLabel];
    
    
    _shellLabel = [[UILabel alloc]init];
    _shellLabel.frame =CGRectMake(510*wb, 145*hb, 130*wb, 30*hb);
    _shellLabel.text = @"29999";
    _shellLabel.textColor = [UIColor whiteColor];
    _shellLabel.textAlignment = NSTextAlignmentRight;
    _shellLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_shellLabel];
    
    _shellnum = [[UILabel alloc]init];
    _shellnum.frame =CGRectMake(SCREEN_WIDTH -110*wb, 145*hb, 80*wb, 30*hb);
    _shellnum.text = @"900";
    _shellnum.textColor = [UIColor whiteColor];
    _shellnum.textAlignment = NSTextAlignmentRight;
    _shellnum.font = [UIFont systemFontOfSize:12];
    [self addSubview:_shellnum];
    
    UILabel * BjLabel = [[UILabel alloc]init];
    BjLabel.frame =CGRectMake(440*wb, 245*hb, 60*wb, 30*hb);
    BjLabel.text = @"买价";
    BjLabel.textColor = [UIColor whiteColor];
    BjLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:BjLabel];
    
    _buyLabel = [[UILabel alloc]init];
    _buyLabel.frame =CGRectMake(510*wb, 245*hb, 130*wb, 30*hb);
    _buyLabel.text = @"29";
    _buyLabel.textColor = [UIColor whiteColor];
    _buyLabel.textAlignment = NSTextAlignmentRight;
    _buyLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_buyLabel];
    
    _buynum = [[UILabel alloc]init];
    _buynum.frame =CGRectMake(SCREEN_WIDTH -110*wb, 245*hb, 80*wb, 30*hb);
    _buynum.text = @"900";
    _buynum.textColor = [UIColor whiteColor];
    _buynum.textAlignment = NSTextAlignmentRight;
    _buynum.font = [UIFont systemFontOfSize:12];
    [self addSubview:_buynum];
    
    
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
    NSLog(@"rightnumButtonClick");
    NSInteger i = [_numLabel.text integerValue];
    _numLabel.text = [NSString stringWithFormat:@"%ld",i+1];
}
-(void)leftnumButtonClick{
    NSInteger i = [_numLabel.text integerValue];
    _numLabel.text = [NSString stringWithFormat:@"%ld",i-1];
}
-(void)DropDownMenuAdd{
    _menuRowHeight = 65*hb;
    _menu = [[DropDownMenu alloc]initWithFrame:CGRectMake(30*wb, 27*hb, 380*wb, _menuRowHeight)];
    [_menu setMyheightForRow:_menuRowHeight];
    NSMutableArray * arr = [[NSMutableArray alloc]initWithArray:@[@"狐金1806",@"狐金1802",@"狐金1803",@"狐金1804",@"狐金1805",@"狐金1807",@"狐金1808"]];
    [_menu setMydatearray:arr];
    _menu.delegate = self;
    [_menu setMytopViewlabel:arr[0]];
    _reH =  [_menu setMytableViewHeight:250*hb];
    [_menu setMyleftImage:[UIImage imageNamed:@"xia"]];
    [self  addSubview:_menu];
}

-(void)DropDownMenureSetFrameShow{
    //NSLog(@"DropDownMenureSetFrameShow");
     _menu.frame = CGRectMake(30*wb, 27*hb, 380*wb, _menuRowHeight+self.reH);
}

-(void)DropDownMenureSetFramehiden{
    _menu.frame = CGRectMake(30*wb, 27*hb, 380*wb, _menuRowHeight);
}

@end
