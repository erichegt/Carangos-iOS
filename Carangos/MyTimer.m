//
//  MyTimer.m
//  Carangos
//
//  Created by Erich Egert on 4/22/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "MyTimer.h"

@interface MyTimer(){
    dispatch_source_t timer;
    BOOL (^callbackTimer)();
}

@end


@implementation MyTimer

- (id)initWithTimeout:(NSTimeInterval)timeout  andBlock:(BOOL (^)())callback;{
    self = [super init];
    
    if (self) {
        callbackTimer = callback;
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

        timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_time_t now = dispatch_walltime(DISPATCH_TIME_NOW, 0);
        dispatch_source_set_timer(timer, now, 3ull * NSEC_PER_SEC, 0);

        dispatch_source_set_event_handler(timer, ^{
            BOOL cancel = callbackTimer();
            if(cancel) {
                dispatch_source_cancel(timer);
            }
 
        });

        dispatch_resume(timer);
    }
    return self;
}

@end
