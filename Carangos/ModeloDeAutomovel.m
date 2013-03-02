//
//  ModeloDeAutomovel.m
//  Pods
//
//  Created by Erich Egert on 3/1/13.
//
//

#import "ModeloDeAutomovel.h"
#import "Marca.h"

@implementation ModeloDeAutomovel

@dynamic cilindrada, combustivel, litrosMotor, nome, fabricante;

+(ModeloDeAutomovel*) modeloWithContext: (NSManagedObjectContext*) ctx
                                andNome: (NSString*) nome
                          andFabricante: (Marca*) marca
                      andMotorComLitros: (Litros) litros
                         andCombustivel: (Combustivel) combustivel {
    
    ModeloDeAutomovel *modelo = (ModeloDeAutomovel*) [ModeloDeAutomovel managedObjectWithContext:ctx
                                                                    andClassName:@"ModeloDeAutomovel"];
    
    [modelo setNome:nome];
    [modelo setFabricante:marca];
    [modelo setCombustivel:[NSNumber numberWithInt:combustivel]];
    [modelo setLitrosMotor:[NSNumber numberWithInt:litros]];
    
    return modelo;
}

+(NSArray*) todosWithContext: (NSManagedObjectContext*) ctx {
    NSFetchRequest *fetch = [ModeloDeAutomovel createFetch:ctx andClassName:@"ModeloDeAutomovel"];
    
    return [ctx executeFetchRequest:fetch error:nil];
}

-(NSString*) description {
    return [self nome];
}




@end
