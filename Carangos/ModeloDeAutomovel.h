//
//  ModeloDeAutomovel.h
//  Pods
//
//  Created by Erich Egert on 3/1/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef enum {
    V4 = 0,
    V6 = 1,
    V8 = 2,
    V10 = 3,
    V12 = 4,
    V18 = 5
} Cindros;

typedef enum {
    _10L = 0,
    _13L = 1,
    _16L = 2,
    _18L = 3,
    _20L = 4,
    _24L = 5,
    _30L = 6
} Litros;


@class Marca;

@interface ModeloDeAutomovel : NSManagedObject

@property (nonatomic, retain) NSNumber * cilindrada;
@property (nonatomic, retain) NSNumber * combustivel;
@property (nonatomic, retain) NSNumber * litrosMotor;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) Marca *fabricante;



@end
