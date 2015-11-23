//
//  MomAssesmentViewController.h
//  MAMICare
//
//  Created by Luis Alberto Lamadrid on 11/18/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Patient.h"
#import "Assessment.h"

@interface MomAssesmentViewController : UIViewController

// attributes
@property(nonatomic, strong) Patient *patient;
@property(nonatomic, strong) Assessment *assessment;

// outlets
@property(nonatomic, weak) IBOutlet UITextField *tfWeight;
@property(nonatomic, weak) IBOutlet UITextField *tfPulse;
@property(nonatomic, weak) IBOutlet UITextField *tfSystolicHeartRate;
@property(nonatomic, weak) IBOutlet UITextField *tfDiastolicHeartRate;
@property(nonatomic, weak) IBOutlet UITextField *tffundalHeight;

@property(nonatomic, weak) IBOutlet UITextField *tfUrineTest;
@property(nonatomic, weak) IBOutlet UITextField *tfBasalGlucose;
@property(nonatomic, weak) IBOutlet UITextField *tfOxygen;

@property(nonatomic, weak) IBOutlet UITextField *tfFetalHeartBeat;
@property(nonatomic, weak) IBOutlet UITextField *tfFetalRegion;
@property(nonatomic, weak) IBOutlet UISwitch *swtcontractionsExist;
@property(nonatomic, weak) IBOutlet UITextField *tfContractionsTime;
@property(nonatomic, weak) IBOutlet UITextView *tvObservations;

@end
