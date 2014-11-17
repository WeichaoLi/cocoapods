//
//  LWCAppDelegate.h
//  cocoapods
//
//  Created by 李伟超 on 14-11-6.
//  Copyright (c) 2014年 LWC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LWCViewController;

@interface LWCAppDelegate : UIResponder <UIApplicationDelegate> {
    NSManagedObjectModel*_managedObjectModel;
    NSPersistentStoreCoordinator*_persistentStoreCoordinator;
    NSManagedObjectContext*_managedObjectContext;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navCon;
@property (strong, nonatomic) LWCViewController *ViewController;

@end
