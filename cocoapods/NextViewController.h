//
//  NextViewController.h
//  cocoapods
//
//  Created by 李伟超 on 14-11-13.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *myTableView;

@end
