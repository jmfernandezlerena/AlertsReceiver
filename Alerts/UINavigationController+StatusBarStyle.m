//
//  UINavigationController+StatusBarStyle.m
//  Alerts
//
//  Created by Juan Miguel Fernández Lerena on 12/11/14.
//  Copyright (c) 2014 jmfernandezlerenaios. All rights reserved.
//

#import "UINavigationController+StatusBarStyle.h"

@implementation UINavigationController (StatusBarStyle)

#pragma mark childViewControllerForStatusBarStyle
/*!
 ESTILO DE STATUS BAR.
 */
 -(UIViewController *)childViewControllerForStatusBarStyle
{
    return self.visibleViewController;
}

#pragma mark childViewControllerForStatusBarHidden
/*!
 OCULTAR STATUS BAR.
 */
-(UIViewController *)childViewControllerForStatusBarHidden
{
    return self.visibleViewController;
}

@end
