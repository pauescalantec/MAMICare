//
//  DetalleConsultaTableViewController.h
//  MAMICare
//
//  Created by Pau Escalante on 12/2/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Assessment.h"
#import "Patient.h"

@interface DetalleConsultaTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UILabel *lblFirst;

@property (strong, nonatomic) IBOutlet UILabel *lblLast;

@property (strong, nonatomic) IBOutlet UIImageView *imagePaciente;

@property (nonatomic, strong) UIImage *imageTaken;

//@property (strong, nonatomic) UIButton *verObservaciones;

@property (nonatomic, strong) Assessment *assessment;
@property (nonatomic, strong) Patient *patient;

@end
