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
    CilindrosV4 = 0,
    CilindrosV6 = 1,
    CilindrosV8 = 2,
    CilindrosV10 = 3,
    CilindrosV12 = 4,
    CilindrosV18 = 5
} Cilindros;

typedef enum {
    Litros_10L = 0,
    Litros_13L = 1,
    Litros_16L = 2,
    Litros_18L = 3,
    Litros_20L = 4,
    Litros_24L = 5,
    Litros_30L = 6
} Litros;

typedef enum {
    CombustivelGasolina = 0,
    CombustivelAlcool = 1,
    CombustivelFlex = 2,
    CombustivelDiesel = 3

} Combustivel;


@class Marca;

@interface ModeloDeAutomovel : NSManagedObject

@property (nonatomic, retain) NSNumber * cilindrada;
@property (nonatomic, retain) NSNumber * combustivel;
@property (nonatomic, retain) NSNumber * litrosMotor;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) Marca *fabricante;



+(ModeloDeAutomovel*) modeloWithContext: (NSManagedObjectContext*) ctx
                                andNome: (NSString*) nome
                          andFabricante: (Marca*) marca
                      andMotorComLitros: (Litros) litros
                         andCombustivel: (Combustivel) combustivel;

+(NSArray*) todosWithContext: (NSManagedObjectContext*) ctx;

@end
