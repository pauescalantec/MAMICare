//
//  ViewControllerConsultar.m
//  MAMICare
//
//  Created by Pau Escalante on 10/9/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "ViewControllerConsultar.h"
#import "PatientsTableViewController.h"
#import "ViewControllerNuevoPaciente.h"

@interface ViewControllerConsultar ()

@end

@implementation ViewControllerConsultar

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.botExistente.layer.cornerRadius = 100;
    self.botNuevo.layer.cornerRadius = 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString: @"consultarPacientes"]) {
        PatientsTableViewController *viewPacientes= [segue destinationViewController];
        viewPacientes.strSegue = @"consultarPacientes";
    }
    
    if ([[segue identifier] isEqualToString: @"consultarNuevo"]) {
        ViewControllerNuevoPaciente *viewPacienteNuevo= [segue destinationViewController];
        viewPacienteNuevo.strSegue = @"consultarPacientes";
    }
}


@end
