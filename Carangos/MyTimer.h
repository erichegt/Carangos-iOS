//
//  MyTimer.h
//  Carangos
//
//  Created by Erich Egert on 4/22/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyTimer : NSObject 

- (id)initWithTimeout:(NSTimeInterval)timeout  andBlock:(BOOL (^)())callback;
//- (void)invalidate;

@end
