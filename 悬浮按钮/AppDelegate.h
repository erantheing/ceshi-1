//
//  AppDelegate.h
//  悬浮按钮
//
//  Created by etcxm on 2017/2/16.
//  Copyright © 2017年 erathe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

