//
//  NextViewController.m
//  cocoapods
//
//  Created by 李伟超 on 14-11-13.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import "NextViewController.h"
#import "LWCNNViewController.h"

@interface NextViewController () {
    LWCNNViewController *nnVC;
}

@end

@implementation NextViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setup {
    if (_myTableView == nil) {
        CGRect frame = self.view.bounds;
        _myTableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
        _myTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.backgroundColor = [UIColor clearColor];
        
#ifdef __IPHONE_7_0
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
            self.navigationController.navigationBar.translucent = NO;
            self.edgesForExtendedLayout = UIRectEdgeNone;
            self.automaticallyAdjustsScrollViewInsets = NO;
        
            _myTableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
            _myTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
            _myTableView.backgroundView = nil;
        }
#endif
        [self.view addSubview:_myTableView];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self setup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

#ifdef __IPHONE_7_0
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(tintColor)]) {
        CGRect rect = cell.bounds;
        rect.origin.x += 5;
        rect.size.width -= 20;
        cell.backgroundColor = [UIColor clearColor];
        UIView *view = [[UIView alloc] init];
        //设置cell 的背景色
        view.backgroundColor = [UIColor whiteColor];
        UIBezierPath *maskPath;
        
        if (tableView == self.myTableView) {

            NSUInteger lastRow = [tableView numberOfRowsInSection:indexPath.section] - 1;
            if (indexPath.row == 0) {
                
                 maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerTopRight cornerRadii:CGSizeMake(5, 5)];

            }else if(indexPath.row == lastRow) {
                
                maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(5, 5)];
                
            }else {
            
                maskPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(0, 0)];
                
            }
        
            CAShapeLayer *maskLayer=[[CAShapeLayer alloc] init];
            maskLayer.backgroundColor = [UIColor clearColor].CGColor;
            maskLayer.frame = rect;
            maskLayer.path = maskPath.CGPath;
            view.layer.mask = maskLayer;
            
            view.layer.masksToBounds = YES;
            cell.backgroundView = view;
        }
    }
}
#endif

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = @"22";
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    UIView *headerview = [[UIView alloc] initWithFrame:cell.frame];
    headerview.backgroundColor = [UIColor clearColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 40)];
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"最新消息";
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:label.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(5, 5)];
    CAShapeLayer *maskLayer=[[CAShapeLayer alloc] init];
    maskLayer.backgroundColor = [UIColor clearColor].CGColor;
    maskLayer.frame = label.bounds;
    maskLayer.path = maskPath.CGPath;
    label.layer.mask = maskLayer;
    
    [headerview addSubview:label];
    return headerview;
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
    if (section != 0) {
        return 0.1;
    }
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundView.backgroundColor = [UIColor redColor];
    
    if (nnVC == nil) {
        nnVC = [[LWCNNViewController alloc] init];
    }
    [self.navigationController pushViewController:nnVC animated:YES];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundView.backgroundColor = [UIColor whiteColor];
}

#pragma mark - rotation

- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [_myTableView reloadData];
}

@end
