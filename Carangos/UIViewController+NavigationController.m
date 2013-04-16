//
//  UIViewController+NavigationController.m
//  Carangos
//
//  Created by Erich Egert on 4/16/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "UIViewController+NavigationController.h"

@implementation UIViewController (NavigationController)

- (UINavigationController *) comNavigation{
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self];
    return navigationController;
}

@end
