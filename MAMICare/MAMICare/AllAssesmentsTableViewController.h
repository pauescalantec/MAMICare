//
//  AllAssesmentsTableViewController.h
//  MAMICare
//
//  Created by Pau Escalante on 12/3/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Patient.h"
#import "Assessment.h"

@interface AllAssesmentsTableViewController : UITableViewController

@property(nonatomic, strong) Patient *patient;

@property(nonatomic, strong) Assessment *assessment;

@property (nonatomic, strong) NSMutableArray *listaConsultas;

@property (strong, nonatomic) IBOutlet UILabel *lblFirst;

@property (strong, nonatomic) IBOutlet UILabel *lblLast;

@property (strong, nonatomic) IBOutlet UIImageView *imgPatient;

@property (nonatomic, strong) UIImage *imageTaken;
@end
