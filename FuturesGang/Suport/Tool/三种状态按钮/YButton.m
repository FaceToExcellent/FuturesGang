//
//  YButton.m
//  FuturesGang
//
//  Created by yuzhen hua on 2018/4/13.
//  Copyright © 2018年 yuzhen hua. All rights reserved.
//

#import "YButton.h"

@implementation YButton

-(instancetype)init
{
    if (self = [super init]) {
        
        [self makeUI];
    }
    return self;
}


-(void)makeUI{
    [self setYstate:YbuttonstateDefult];
}
//
-(void)setYstate:(Ybuttonstate )Ystate{
    _Ystate = Ystate;
     NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
    if (_Ystate == YbuttonstateDefult) {
       
        NSString * imge = [def objectForKey:@"YbuttonstateDefult"];
        if (imge.length>0) {
             [self setBackgroundImage:[UIImage imageNamed:imge] forState:UIControlStateNormal];
        }
       
    }
    
    if (Ystate == YbuttonstateUpselected) {
        NSString * imge = [def objectForKey:@"YbuttonstateUpselected"];
        if (imge.length>0) {
            [self setBackgroundImage:[UIImage imageNamed:imge] forState:UIControlStateNormal];
        }
    }
    
    if (Ystate == YbuttonstateDownselected) {
        NSString * imge = [def objectForKey:@"YbuttonstateDownselected"];
        if (imge.length>0) {
            [self setBackgroundImage:[UIImage imageNamed:imge] forState:UIControlStateNormal];
        }
    }
  
    
}

-(void)setYBackimage:(NSString*)image forYstate:(Ybuttonstate)Ystate{
    
    if (Ystate == YbuttonstateDefult) {
        NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
        [def setObject:image forKey:@"YbuttonstateDefult"];
    }
    if (Ystate == YbuttonstateUpselected) {
  
        
        NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
        [def setObject:image forKey:@"YbuttonstateUpselected"];
    }
    
    if (Ystate == YbuttonstateDownselected) {
        NSUserDefaults * def = [NSUserDefaults standardUserDefaults];
        [def setObject:image forKey:@"YbuttonstateDownselected"];
    }
    
    
}

//
//- (void)saveImage:(UIImage *)image {
//    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
//
//
//    NSString *filePath = [[paths objectAtIndex:0]stringByAppendingPathComponent:
//                          [NSString stringWithFormat:@"demo.png"]];  // 保存文件的名称
//
//    BOOL result =[UIImagePNGRepresentation(image)writeToFile:filePath   atomically:YES]; // 保存成功会返回YES
//    if (result == YES) {
//        NSLog(@"保存成功");
//    }
//
//}
//
//- (void)getImage {
//
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
//
//    NSString *filePath = [[paths objectAtIndex:0]stringByAppendingPathComponent:
//                          [NSString stringWithFormat:@"demo.png"]];
//    // 保存文件的名称
//    UIImage *img = [UIImage imageWithContentsOfFile:filePath];
//    NSLog(@"=== %@", img);
//
//}







@end
