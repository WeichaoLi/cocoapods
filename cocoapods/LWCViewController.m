//
//  LWCViewController.m
//  cocoapods
//
//  Created by 李伟超 on 14-11-6.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import "LWCViewController.h"
#import "NextViewController.h"

@interface LWCViewController ()

@property (strong, nonatomic) NextViewController *nextVC;

@end

@implementation LWCViewController{
    UIAlertView *alert;
}

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
                          
//    [[SIAlertView appearance] setMessageFont:[UIFont systemFontOfSize:13]];
//    [[SIAlertView appearance] setTitleColor:[UIColor blackColor]];
//    [[SIAlertView appearance] setMessageColor:[UIColor blackColor]];
//    [[SIAlertView appearance] setCornerRadius:15];
//    [[SIAlertView appearance] setShadowRadius:20];
//    [[SIAlertView appearance] setViewBackgroundColor:[UIColor colorWithRed:0.891 green:0.936 blue:0.978 alpha:1.000]];
    [[SIAlertView appearance] setButtonColor:[UIColor grayColor]];
    [[SIAlertView appearance] setCancelButtonColor:[UIColor redColor]];
    [[SIAlertView appearance] setDestructiveButtonColor:[UIColor blackColor]];
    
    
//    [[SIAlertView appearance] setDefaultButtonImage:[[UIImage imageNamed:@""] resizableImageWithCapInsets:UIEdgeInsetsMake(15,5,14,6)] forState:UIControlStateNormal];
//    [[SIAlertView appearance] setDefaultButtonImage:[[UIImage imageNamed:@""] resizableImageWithCapInsets:UIEdgeInsetsMake(15,5,14,6)] forState:UIControlStateHighlighted];
    
//    [[SIAlertView appearance] setCancelButtonImage:[[UIImage imageNamed:@""] resizableImageWithCapInsets:UIEdgeInsetsMake(15,5,14,6)] forState:UIControlStateNormal];
//    [[SIAlertView appearance] setCancelButtonImage:[[UIImage imageNamed:@""] resizableImageWithCapInsets:UIEdgeInsetsMake(15,5,14,6)] forState:UIControlStateHighlighted];
    
//    [[SIAlertView appearance] setDestructiveButtonImage:[[UIImage imageNamed:@""] resizableImageWithCapInsets:UIEdgeInsetsMake(15,5,14,6)] forState:UIControlStateNormal];
//    [[SIAlertView appearance] setDestructiveButtonImage:[[UIImage imageNamed:@""] resizableImageWithCapInsets:UIEdgeInsetsMake(15,5,14,6)] forState:UIControlStateHighlighted];
}

- (void)loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 120, 40)];
    button1.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [button1 setTitle:@"SIAlertView" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor lightGrayColor]];
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button1.showsTouchWhenHighlighted = YES;  //点击的时候，button高亮
    [button1 setTintColor:[UIColor blackColor]];
    [button1 addTarget:self action:@selector(showCustomAlertView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 120, 40)];
    button2.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [button2 setTitle:@"UIAlertView" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor grayColor]];
    [button2 setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    [button2 setTintColor:[UIColor blackColor]];
    [button2 addTarget:self action:@selector(showSystemAlertView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - buttom Action

- (void) showCustomAlertView:(id)sender {
    if (_alertView == nil) {
        _alertView = [[SIAlertView alloc] initWithTitle:@"Title1" andMessage:@"Count down"];
        _alertView.transitionStyle = SIAlertViewTransitionStyleBounce; //弹出的效果
        _alertView.buttonsListStyle = SIAlertViewButtonsListStyleNormal; //按钮的
        
        _alertView.title = nil;
        _alertView.message = @"页面跳转";
        _alertView.messageFont = [UIFont boldSystemFontOfSize:19];
        
        [_alertView addButtonWithTitle:@"取消"
                                 type:SIAlertViewButtonTypeDefault
                              handler:^(SIAlertView *alertView) {
                                  //在这写点击该按钮 执行的事件
                              }];
        
        //这里存在循环引用，所以self要加上 __block
        __block LWCViewController *controller = self;
        [_alertView addButtonWithTitle:@"确定"
                                 type:SIAlertViewButtonTypeDestructive
                              handler:^(SIAlertView *alertView) {
                                  [controller alertView:nil clickedButtonAtIndex:1];
                              }];
        
        
        _alertView.willShowHandler = ^(SIAlertView *alertView) {
//            debug_NSLog(@"1");
        };
        _alertView.didShowHandler = ^(SIAlertView *alertView) {
//            debug_NSLog(@"2");
        };
        _alertView.willDismissHandler = ^(SIAlertView *alertView) {
//            debug_NSLog(@"3");
        };
        _alertView.didDismissHandler = ^(SIAlertView *alertView) {
//            debug_NSLog(@"4");
        };
        
        _alertView.cornerRadius = 10;
        _alertView.buttonFont = [UIFont boldSystemFontOfSize:19];
    }
    [_alertView show];
}

- (void)showSystemAlertView:(id)sender {
    if (alert == nil) {
        alert = [[UIAlertView alloc] initWithTitle:nil message:@"页面跳转" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    }
    
    [alert show];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        if (_nextVC == nil) {
            _nextVC = [[NextViewController alloc] init];
        }
        _nextVC.str = @"222";
        [self.navigationController pushViewController:_nextVC animated:YES];
    }
}

#pragma mark - rotate

- (BOOL)shouldAutorotate {
    return NO;
}

@end
