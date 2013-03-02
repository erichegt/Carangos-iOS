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

@dynamic cilindrada;
@dynamic combustivel;
@dynamic litrosMotor;
@dynamic nome;
@dynamic fabricante;

+(NSString*) managedObjectClassName{
    return @"ModeloDeAutomovel";
}



@end
