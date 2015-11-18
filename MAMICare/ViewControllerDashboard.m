//
//  ViewControllerDashboard.m
//  MAMICare
//
//  Created by Pau Escalante on 10/8/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//


#import "ViewControllerDashboard.h"
#import "PatientsTableViewController.h"

@interface ViewControllerDashboard ()

@end

@implementation ViewControllerDashboard

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //button formatting
    self.botConsulta.layer.cornerRadius = 100;
    self.botPacientes.layer.cornerRadius = 100;
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
    if ([[segue identifier] isEqualToString: @"pacientes"]) {
        PatientsTableViewController *viewPacientes= [segue destinationViewController];
        viewPacientes.strSegue = @"pacientes";
    }
}


@end
