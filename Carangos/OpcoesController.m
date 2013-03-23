//
//  OpcoesController.m
//  Carangos
//
//  Created by Erich Egert on 3/2/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "OpcoesController.h"

@interface OpcoesController ()

@property (nonatomic, strong) NSArray* valores;
@property (nonatomic, strong) void (^executaComSelecionado)(NSInteger);

@end



@implementation OpcoesController

@synthesize valores, table;

- (id)initWithValores: (NSArray*) opcoes andCallback:(void (^)(NSInteger selecionado))block
{
    self = [super initWithNibName:@"OpcoesController" bundle:[NSBundle mainBundle]];
    if (self) {
        UITableView *tabela = (UITableView*)[ [self view] viewWithTag:666];
        [self setTable:tabela];
        
        [[self table] setDataSource:self];
        [[self table] setDelegate:self];
        [self setValores:opcoes];
        [self setExecutaComSelecionado:block];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self table] reloadData];
   
}

- (void)didReceiveMemoryWarning
{
    [self setExecutaComSelecionado:nil];
    [self setValores:nil];
    [super didReceiveMemoryWarning];
}

- (NSString *)pickerView:(UIPickerView *)pickerView  titleForRow:(NSInteger)row
                                                    forComponent:(NSInteger)component {
    
    return [[[self valores] objectAtIndex:row] description];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [valores count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *valor = [[[self valores] objectAtIndex:[indexPath row]] description];
    
    [cell setText:[valor description]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.executaComSelecionado([indexPath row]);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

- (void)viewDidUnload {
    [self setExecutaComSelecionado:nil];
    [self setValores:nil];
    [super viewDidUnload];
}


@end
