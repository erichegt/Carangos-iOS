//
//  PopulaBanco.m
//  Carangos
//
//  Created by Erich Egert on 3/5/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "PopulaBanco.h"
#import <CoreData/CoreData.h>
#import "Marca.h"
#import "ModeloDeAutomovel.h"

@implementation PopulaBanco

+(void) executa: (NSManagedObjectContext*) ctx andSaveAction:(void (^)(bool ok))block {
    
    
    
    Marca *gm = [Marca marcaWithContext:ctx andNome:@"General Motors"];
    
    [ModeloDeAutomovel modeloWithContext:ctx andNome:@"Celta"
                           andFabricante:gm
                       andMotorComLitros:Litros_10L
                          andCombustivel:CombustivelFlex];
    
    [ModeloDeAutomovel modeloWithContext:ctx andNome:@"Agile"
                           andFabricante:gm
                       andMotorComLitros:Litros_16L
                          andCombustivel:CombustivelFlex];
    
    [ModeloDeAutomovel modeloWithContext:ctx andNome:@"Vectra"
                           andFabricante:gm
                       andMotorComLitros:Litros_20L
                          andCombustivel:CombustivelFlex];
    
    Marca *fiat = [Marca marcaWithContext:ctx andNome:@"Fiat"];
    
    [ModeloDeAutomovel modeloWithContext:ctx andNome:@"Palio"
                           andFabricante:fiat
                       andMotorComLitros:Litros_10L
                          andCombustivel:CombustivelFlex];
    
    [ModeloDeAutomovel modeloWithContext:ctx andNome:@"Punto"
                           andFabricante:fiat
                       andMotorComLitros:Litros_16L
                          andCombustivel:CombustivelFlex];
    
    [ModeloDeAutomovel modeloWithContext:ctx andNome:@"Brava"
                           andFabricante:fiat
                       andMotorComLitros:Litros_20L
                          andCombustivel:CombustivelFlex];
    
    Marca *vw = [Marca marcaWithContext:ctx andNome:@"VolksWagen"];
    
    [ModeloDeAutomovel modeloWithContext:ctx andNome:@"Gol"
                           andFabricante:vw
                       andMotorComLitros:Litros_10L
                          andCombustivel:CombustivelFlex];
    
    [ModeloDeAutomovel modeloWithContext:ctx andNome:@"Gol"
                           andFabricante:vw
                       andMotorComLitros:Litros_10L
                          andCombustivel:CombustivelFlex];
    
    [ModeloDeAutomovel modeloWithContext:ctx andNome:@"Polo"
                           andFabricante:vw
                       andMotorComLitros:Litros_16L
                          andCombustivel:CombustivelFlex];

    [ModeloDeAutomovel modeloWithContext:ctx andNome:@"Tiguana"
                           andFabricante:vw
                       andMotorComLitros:Litros_20L
                          andCombustivel:CombustivelFlex];
    
    Marca *nissan = [Marca marcaWithContext:ctx andNome:@"Nissan"];
    
    [ModeloDeAutomovel modeloWithContext:ctx andNome:@"March"
                           andFabricante:nissan
                       andMotorComLitros:Litros_16L
                          andCombustivel:CombustivelFlex];
    
    [ModeloDeAutomovel modeloWithContext:ctx andNome:@"Tiida"
                           andFabricante:nissan
                       andMotorComLitros:Litros_16L
                          andCombustivel:CombustivelFlex];
    
    [ModeloDeAutomovel modeloWithContext:ctx andNome:@"Sentra"
                           andFabricante:nissan
                       andMotorComLitros:Litros_16L
                          andCombustivel:CombustivelFlex];
    
    
    //Instanciando um ManagedObject de maneira Detached depois colocando no contexto!
    Marca *fubica = [Marca marcaWithContext:ctx andNome:@"Fubica!!!" attached:NO];
    [ctx insertObject:fubica];
    
    block(YES);
}

@end
