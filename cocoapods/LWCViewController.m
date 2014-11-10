//
//  LWCViewController.m
//  cocoapods
//
//  Created by 李伟超 on 14-11-6.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import "LWCViewController.h"

@interface LWCViewController ()

@end

@implementation LWCViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _alertView = [[SIAlertView alloc] initWithTitle:@"SIAlertView" andMessage:@"yeah"];
    _alertView.frame = CGRectMake(40, 100, 240, 100);
    _alertView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_alertView];
    
    [_alertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
