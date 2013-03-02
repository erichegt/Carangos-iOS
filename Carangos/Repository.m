//
//  Repository.m
//  Carangos
//
//  Created by Erich Egert on 3/1/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "Repository.h"

@interface Repository()

@property (strong, nonatomic) NSString* managedObjectClassName;

@end

@implementation Repository

@synthesize managedObjectClassName;


-(id) initWithClassName: (NSString*) className {
    self = [super init];
    if (self) {
        [self setManagedObjectClassName:className];
    }
    return self;
}



@end