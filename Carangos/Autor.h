//
//  Autor.h
//  Carangos
//
//  Created by Erich Egert on 4/12/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Autor : NSObject

@property (nonatomic, strong) NSString *nome;


-(id) initWithNome: (NSString*) _nome;

@end
