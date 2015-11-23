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

// outlets
@property (nonatomic, strong) Patient *patient;
@property (nonatomic, strong) NSString *strSegue;
@property (nonatomic, strong) NSString *strNuevo;
@property (nonatomic, strong) UIBarButtonItem *Cancel;
@property (strong, nonatomic) IBOutlet UIButton *btnStart;

@property (weak, nonatomic) IBOutlet UILabel *lblFirstName;
@property (weak, nonatomic) IBOutlet UILabel *lblLastNames;
@property (weak, nonatomic) IBOutlet UILabel *lblAge;
@property (weak, nonatomic) IBOutlet UILabel *lblStreet;
@property (weak, nonatomic) IBOutlet UILabel *lblNeighborhood;
@property (weak, nonatomic) IBOutlet UILabel *lblCity;
@property (weak, nonatomic) IBOutlet UILabel *lblState;
@property (weak, nonatomic) IBOutlet UILabel *lblPostalCode;
@property (weak, nonatomic) IBOutlet UILabel *lblCountry;

@property (weak, nonatomic) IBOutlet UILabel *lblEmail;
@property (weak, nonatomic) IBOutlet UILabel *lblCURP;



// action
- (void)btnCancelar:(UIBarButtonItem *)sender;

@end
