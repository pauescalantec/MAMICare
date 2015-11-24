//
//  ViewControllerDashboard.h
//  MAMICare
//
//  Created by Pau Escalante on 10/8/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerLogin.h"

@interface ViewControllerDashboard : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *botPacientes;

@property (strong, nonatomic) IBOutlet UIButton *outletBtnLogOut;
@property (strong, nonatomic) IBOutlet UIButton *outletBtnCancelar;
@property (strong, nonatomic) IBOutlet UIButton *outletBtnCancel;

@property (weak, nonatomic) IBOutlet UIButton *botConsulta;

- (IBAction)btnSalir:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIView *viewLogOut;

- (IBAction)CancelarLogOut:(UIButton *)sender;

- (IBAction)ConfirmarLogOut:(UIButton *)sender;

@property UIVisualEffect *blurEffect;

@property UIVisualEffectView *visualEffectView;

@property (strong, nonatomic) IBOutlet UIView *viewNormal;

@end
