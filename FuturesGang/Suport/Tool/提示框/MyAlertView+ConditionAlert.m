//
//  MyAlertView+ConditionAlert.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/13.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "MyAlertView+ConditionAlert.h"
#import "MyAlertView.h"
@implementation MyAlertView (ConditionAlert)
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
    self.Alerttitle = [[UILabel alloc]init];
     self.Alerttitle.frame =CGRectMake(0, 30*hb, 550*wb, 40*hb);
    [ self.Alerttitle setText:@"条件单设置"];
    [ self.Alerttitle setTextColor:[UIColor blackColor]];
    [ self.Alerttitle setFont:[UIFont systemFontOfSize:14]];
     self.Alerttitle.textAlignment = NSTextAlignmentCenter;
     self.Alerttitle.numberOfLines = 1;
    [bgview addSubview: self.Alerttitle];
    
    // 这里需要 chong'xie
    
    
    UILabel * zxlabel = [[UILabel alloc]init];
    zxlabel.frame = CGRectMake(25*wb, 120*hb, 90*wb, 30*hb);
    zxlabel.text = @"最新价";
    zxlabel.textColor = [UIColor blackColor];
    zxlabel.font = [UIFont systemFontOfSize:12];
    [bgview addSubview:zxlabel];
    
    self.topButton = [[UIButton alloc]init];
    self.topButton.frame =CGRectMake(130*wb, 90*hb, 45*wb, 45*wb);
    [self.topButton setBackgroundImage:[UIImage imageNamed:@"DUI"] forState:UIControlStateSelected];
    [self.topButton  setBackgroundImage:[UIImage imageNamed:@"WEIXUANZHONG"] forState:UIControlStateNormal];
    
    [self.topButton addTarget:self action:@selector(topButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:self.topButton];
    
    UILabel * biggerlabel = [[UILabel alloc]init];
    biggerlabel.frame = CGRectMake(200*wb, 95*hb, 70*wb, 30*hb);
    biggerlabel.text = @">=";
    biggerlabel.textColor = [UIColor blackColor];
    biggerlabel.font = [UIFont systemFontOfSize:12];
    [bgview addSubview:biggerlabel];
    
    
    
    self.downButton = [[UIButton alloc]init];
    self.downButton.frame =CGRectMake(130*wb, 150*hb, 45*wb, 45*wb);
    [self.downButton setBackgroundImage:[UIImage imageNamed:@"DUI"] forState:UIControlStateSelected];
    [self.downButton  setBackgroundImage:[UIImage imageNamed:@"WEIXUANZHONG"] forState:UIControlStateNormal];
    
    [self.downButton addTarget:self action:@selector(downButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:self.downButton];
    
    UILabel * litterlabel = [[UILabel alloc]init];
    litterlabel.frame = CGRectMake(200*wb, 155*hb, 70*wb, 30*hb);
    litterlabel.text = @"<=";
    litterlabel.textColor = [UIColor blackColor];
    litterlabel.font = [UIFont systemFontOfSize:12];
    [bgview addSubview:litterlabel];
    
    
    
    
    self.addButton = [[UIButton alloc]init];
    self.addButton.frame =CGRectMake(270*wb, 120*hb, 40*wb, 40*wb);
    [self.addButton setBackgroundImage:[UIImage imageNamed:@"zengjia"] forState:UIControlStateNormal];
    [self.addButton  setBackgroundImage:[UIImage imageNamed:@"zengjia_Selected"] forState:UIControlStateHighlighted];
    
    [self.addButton addTarget:self action:@selector(addButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:self.addButton];
    
    
    self.textfield = [[UITextField alloc]init];
    self.textfield.frame = CGRectMake(330*wb, 108*hb, 182*wb, 60*hb);
    self.textfield.layer.masksToBounds = YES;
    self.textfield.layer.cornerRadius =  60*hb/16;
    self.textfield.userInteractionEnabled = NO;
    self.textfield.layer.borderColor = [UIColor blackColor].CGColor;
    self.textfield.layer.borderWidth = .5;
    [bgview addSubview:self.textfield];
    
    
    self.textfield.text = [NSString stringWithFormat:@"%.2f",self.defultPrice];
    
    self.reduceButton = [[UIButton alloc]init];
    self.reduceButton.frame =CGRectMake(bgview.frame.size.width-70*wb, 120*hb, 40*wb, 40*wb);
    [self.reduceButton setBackgroundImage:[UIImage imageNamed:@"jianshao"] forState:UIControlStateNormal];
    [self.reduceButton  setBackgroundImage:[UIImage imageNamed:@"jianshao_Selected"] forState:UIControlStateHighlighted];
    
    [self.reduceButton addTarget:self action:@selector(reduceButtonCLick) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:self.reduceButton];
    
    
    
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





#pragma mark 条件单相关
-(void)topButtonCLick{
    self.topButton.selected = YES;
    
    self.downButton.selected = NO;
    
    self.biggerOrlitter = @"1";
}

-(void)downButtonCLick{
    self.topButton.selected = NO;
    
    self.downButton.selected = YES;
    
    self.biggerOrlitter = @"0";
}

-(void)addButtonCLick{
    float price = [self.textfield.text floatValue];
    if (price +self.step < self.maxPrice) {
        
        self.textfield.text  =[NSString stringWithFormat:@"%.2f",price +self.step];
    }else
    {
        self.textfield.text  =[NSString stringWithFormat:@"%.2f",self.maxPrice];
    }
    
}

-(void)reduceButtonCLick{
    float price = [self.textfield.text floatValue];
    if (price -self.step > self.minPrice) {
        
        self.textfield.text  =[NSString stringWithFormat:@"%.2f",price -self.step];
    }else
    {
        self.textfield.text  =[NSString stringWithFormat:@"%.2f",self.minPrice];
    }
}

-(void)qdButtonClickwithCondtion{
    self.conditionBLock(self.biggerOrlitter,self.textfield.text);
    [self cancelButtonClick];
}




@end
