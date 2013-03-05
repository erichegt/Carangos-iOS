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

+(NSArray*) cilindradasDeMotores{
    return [NSArray arrayWithObjects:@"V4", @"V6", @"V8", @"V12", @"V18", nil];
}

+(NSArray*) litrosMotorizacoes{
    return [NSArray arrayWithObjects:@"1.0L", @"1.3L", @"1.6L", @"1.8L", @"2.0L", @"2.4L", @"3.0L", nil];
}

+(NSArray*) tiposDeCombustivel{
    return [NSArray arrayWithObjects:@"Gasolina", @"Álcool", @"Diesel", @"Flex", nil];
}

-(void) updateAtributesWithNome:(NSString*) nome
                  andFabricante: (Marca*) marca
              andMotorComLitros: (Litros) litros
                 andCombustivel: (Combustivel) combustivel {
    
    [self setNome:nome];
    [self setFabricante:marca];
    [self setCombustivel:[NSNumber numberWithInt:combustivel]];
    [self setLitrosMotor:[NSNumber numberWithInt:litros]];
    
}

+(ModeloDeAutomovel*) modeloWithContext: (NSManagedObjectContext*) ctx {
    return (ModeloDeAutomovel*) [ModeloDeAutomovel managedObjectWithContext:ctx
                                                               andClassName:@"ModeloDeAutomovel"];
}

+(ModeloDeAutomovel*) modeloWithContext: (NSManagedObjectContext*) ctx
                                andNome: (NSString*) nome
                          andFabricante: (Marca*) marca
                      andMotorComLitros: (Litros) litros
                         andCombustivel: (Combustivel) combustivel {
    
    ModeloDeAutomovel *modelo = (ModeloDeAutomovel*) [ModeloDeAutomovel managedObjectWithContext:ctx
                                                                    andClassName:@"ModeloDeAutomovel"];
    
    [modelo updateAtributesWithNome:nome andFabricante:marca andMotorComLitros:litros andCombustivel:combustivel];
    
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
