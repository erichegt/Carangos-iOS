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

@synthesize valores, picker;

- (id)initWithValores: (NSArray*) opcoes andCallback:(void (^)(NSInteger selecionado))block
{
    self = [super initWithNibName:@"OpcoesController" bundle:[NSBundle mainBundle]];
    if (self) {
        UIPickerView *pickerMofo = (UIPickerView*)[ [self view] viewWithTag:666];
        [self setPicker:pickerMofo];
        [[self picker] setDataSource:self];
        [[self picker] setDelegate:self];
        [self setValores:opcoes];
        [self setExecutaComSelecionado:block];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self picker] reloadAllComponents];
   
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

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"SELECIONADO: %d", row);
    
    self.executaComSelecionado(row);
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [valores count];
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
