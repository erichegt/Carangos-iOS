//
//  DataSource.h
//  Carangos
//
//  Created by Erich Egert on 4/15/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataSourceDelegate <NSObject>

- (NSString *) getURL;
- (void) parsearDados: (NSDictionary *) dados;
- (void) problemaComunicacao;

@end

@interface DataSource : NSObject

- (id)initWithDelegate: (id<DataSourceDelegate>) delegate;
- (void)inicializaConexao;

@end

