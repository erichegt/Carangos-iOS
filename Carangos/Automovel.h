//
//  Automovel.h
//  Carangos
//
//  Created by Erich Egert on 3/1/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ModeloDeAutomovel.h"

@interface Automovel : NSManagedObject

@property (nonatomic, retain) NSNumber * ano;
@property (nonatomic, retain) NSString * cor;
@property (nonatomic, retain) ModeloDeAutomovel *modelo;

+(Automovel*) automovelWithContext: (NSManagedObjectContext*) ctx
                         andModelo: (ModeloDeAutomovel*) modelo
                            andCor: (NSString*) cor
                            andAno: (int) ano;
@end
