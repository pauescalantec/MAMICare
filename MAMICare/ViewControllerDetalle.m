//
//  ViewControllerDetalle.m
//  MAMICare
//
//  Created by Pau Escalante on 11/15/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "ViewControllerDetalle.h"

@interface ViewControllerDetalle ()

@end

@implementation ViewControllerDetalle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Si es consulta, add consult button
    if ([self.strSegue isEqualToString:@"consultarPacientes"]){
        self.btnStart.hidden = NO;
        
        //check if patient is new
        if ([self.strNuevo isEqualToString:@"Nuevo"]){
            //add cancel button
            self.Cancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancelar Consulta" style:UIBarButtonItemStylePlain target:self action:@selector(btnCancelar:)];
            [self.navigationItem setLeftBarButtonItem:self.Cancel animated:YES];
        }
    }
    
    // not a consult
    else {
        self.btnStart.hidden = YES;
        
        //check if patient is new
        if ([self.strNuevo isEqualToString:@"Nuevo"]){
            //add cancel button
            self.Cancel = [[UIBarButtonItem alloc] initWithTitle:@"Regresar a Menú Principal" style:UIBarButtonItemStylePlain target:self action:@selector(btnCancelar:)];
            [self.navigationItem setLeftBarButtonItem:self.Cancel animated:YES];
        }
    }
    
    // modify the title
    if ([self.strNuevo isEqualToString:@"Nuevo"]){
        self.title = @"Detalle Paciente Nuevo";
    } else {
        self.title = @"Detalle Paciente";
    }
    
    [self configureView];
    
}

- (void)configureView {
    if (self.patient){
        //self.imgPatientImage.image = self.patient.photo;
        //self.lblPatientName.text = [self.patient getFullName];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

- (void)btnCancelar:(UIBarButtonItem *)sender {
    [self popView];
}

- (void) popView {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
