//
//  LWCViewController.h
//  cocoapods
//
//  Created by 李伟超 on 14-11-6.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SIAlertView.h"
#import "SVProgressHUD.h"

@interface LWCViewController : UIViewController

@property (nonatomic, strong) SIAlertView *alertView;
@property (nonatomic, strong) SVProgressHUD *HUD;

@end
