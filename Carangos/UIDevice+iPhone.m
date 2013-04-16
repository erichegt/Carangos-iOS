//
//  UIDevice+iPhone.m
//  Carangos
//
//  Created by Erich Egert on 4/16/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "UIDevice+iPhone.h"

@implementation UIDevice (iPhone)


+ (BOOL) iPhone{
    return [[self currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone;
}


@end
