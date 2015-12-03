//
//  ViewControllerDashboard.m
//  MAMICare
//
//  Created by Pau Escalante on 10/8/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//


#import "ViewControllerDashboard.h"
#import "ViewControllerLoginUsername.h"
#import "PatientsTableViewController.h"
#import "ViewControllerLoginUsername.h"

@interface ViewControllerDashboard ()

@end

@implementation ViewControllerDashboard

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //button formatting
    self.botConsulta.layer.cornerRadius = 100;
    self.botPacientes.layer.cornerRadius = 100;
    self.viewLogOut.hidden = YES;
    self.outletBtnCancelar.layer.cornerRadius = 5;
    self.outletBtnCancel.layer.cornerRadius = 5;
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

- (IBAction)btnSalir:(UIButton *)sender {
    self.outletBtnLogOut.enabled = NO;
    self.viewLogOut.hidden = NO;
    self.blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    self.visualEffectView = [[UIVisualEffectView alloc] initWithEffect:self.blurEffect];
    self.visualEffectView.alpha = 0.5;
    
    self.visualEffectView.frame = self.viewNormal.bounds;
    [self.viewNormal addSubview:self.visualEffectView];
}


- (IBAction)CancelarLogOut:(UIButton *)sender {
    self.viewLogOut.hidden = YES;
    self.outletBtnLogOut.enabled = YES;
    [self.visualEffectView removeFromSuperview];
}

- (IBAction)ConfirmarLogOut:(UIButton *)sender {
    self.viewLogOut.hidden = YES;
    self.outletBtnLogOut.enabled = YES;
    UIStoryboard * storyboard = self.storyboard;
    NSString * storyboardName = [storyboard valueForKey:@"name"];
    storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    ViewControllerLoginUsername *add = [storyboard instantiateViewControllerWithIdentifier:@"first"];
    
    [self presentViewController:add animated:YES completion:nil];
}

- (IBAction)credits:(UIButton *)sender {
    //alert error
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Información"
                                                                   message:@"MAMICare ha sido desarrollado por estudiantes del Tecnológico de Monterrey durante el semestre Agosto Diciembre de 2015 como parte del curso Proyecto de Desarrollo de Dispositivos Móviles y asesorados por la Maestra Yolanda Martínez Treviño. \n \n Desarrolladores: \n Luis Lamadrid \n Paulina Escalante \n Natalia García"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
