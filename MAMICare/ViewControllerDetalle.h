//
//  ViewControllerDetalle.h
//  MAMICare
//
//  Created by Pau Escalante on 11/15/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Patient.h"

@interface ViewControllerDetalle : UIViewController

@property (nonatomic, strong) Patient *patient;

@property (nonatomic, strong) NSString *strSegue;

@property (nonatomic, strong) NSString *strNuevo;

@property (nonatomic, strong) UIBarButtonItem *Cancel;

@property (strong, nonatomic) IBOutlet UIButton *btnStart;

- (void)btnCancelar:(UIBarButtonItem *)sender;

@end
