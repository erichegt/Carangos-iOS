//
//  DataSource.m
//  Carangos
//
//  Created by Erich Egert on 4/15/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "DataSource.h"

@interface DataSource()

@property(nonatomic, strong) id<DataSourceDelegate> delegate; //WHY Y NO WORK unsafe_retained?!?
@property(nonatomic, strong) NSURLConnection *connection;
@property(nonatomic, strong) NSMutableData *mutableData;

@end

@implementation DataSource
@synthesize connection, mutableData, delegate;

- (id)initWithDelegate: (id<DataSourceDelegate>) _delegateDS {
    self = [super init];
    
    if (self) {
        [self setDelegate:_delegateDS];
    }
    
    return self;
}

- (void)inicializaConexao {
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    if(connection){
        [connection cancel];
    }
    
    NSURLRequest *request= [NSURLRequest requestWithURL:[NSURL URLWithString:[delegate getURL]]
                                            cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];
    
    mutableData = [NSMutableData data];
    
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse {
    return nil;
}

- (void)connection:(NSURLConnection *)_connection didReceiveData:(NSData *)data{
    if(_connection == connection){
        [mutableData appendData:data];
    }
    
}
- (void)connectionDidFinishLoading:(NSURLConnection *)_connection{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    if (_connection == connection){
        NSError* error;
        
        NSDictionary *resultados = [NSJSONSerialization JSONObjectWithData:mutableData options:kNilOptions error:&error];
        
//        NSMutableArray *resultados = [NSJSONSerialization JSONObjectWithData:mutableData
//                                                                     options:NSJSONReadingMutableContainers error:&error];
        mutableData = nil;
        connection = nil;
        if(!error){
            [self.delegate parsearDados:resultados];
            return;
        }
    }
    [delegate problemaComunicacao];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"Error: %@ %@", error, [error userInfo]);
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [delegate problemaComunicacao];
}

@end
