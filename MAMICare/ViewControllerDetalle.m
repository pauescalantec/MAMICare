//
//  ViewControllerDetalle.m
//  MAMICare
//
//  Created by Pau Escalante on 11/15/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "ViewControllerDetalle.h"
#import "HelperVC.h"

@interface ViewControllerDetalle ()

@end

@implementation ViewControllerDetalle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Si es consulta, add consult button
    if ([self.strSegue isEqualToString:@"consultarPacientes"]){
        self.btnStart.hidden = NO;
        self.btnShadow.hidden = NO;
        
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
        self.btnShadow.hidden = YES;
        
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
        self.imgPatientImage.image = [HelperVC getPhotoForUser:self.patient];
        self.lblFirstName.text = self.patient.name;
        self.lblLastNames.text = [self.patient getFullName];
        self.lblAge.text = [NSString stringWithFormat:@"%ld", (long)[self.patient getAge]];
        self.lblStreet.text = self.patient.pAddress.addressLine1;
        self.lblNeighborhood.text = self.patient.pAddress.addressLine2;
        self.lblCity.text = self.patient.pAddress.city;
        self.lblState.text = self.patient.pAddress.state;
        self.lblPostalCode.text = [NSString stringWithFormat:@"%ld",
                                   (long)self.patient.pAddress.zipCode];
        self.lblCountry.text = self.patient.pAddress.country;
        self.lblEmail.text = self.patient.email;
        self.lblCURP.text = self.patient.curp;
        [self.patient loadAllAssessments];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [[segue destinationViewController] setPatient: self.patient];
}

- (void)btnCancelar:(UIBarButtonItem *)sender {
    [self popView];
}

- (void) popView {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
