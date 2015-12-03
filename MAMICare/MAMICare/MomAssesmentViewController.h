//
//  MomAssesmentViewController.h
//  MAMICare
//
//  Created by Luis Alberto Lamadrid on 11/18/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Consultation.h"

@interface MomAssesmentViewController : UIViewController

// attributes
@property(nonatomic, strong) Patient *patient;
@property(nonatomic, strong) Assessment *assessment;
@property (nonatomic, strong) UIImage *imageTaken;

// outlets
@property(nonatomic, strong) IBOutlet UIImageView *imgPatientPhoto;
@property(nonatomic, strong) IBOutlet UILabel *lblFirstName;
@property(nonatomic, strong) IBOutlet UILabel *lblLastName;

@property(nonatomic, strong) UITextField *tfWeight;
@property(nonatomic, strong) UITextField *tfPulse;
@property(nonatomic, strong) UITextField *tfSystolicHeartRate;
@property(nonatomic, strong) UITextField *tfDiastolicHeartRate;
@property(nonatomic, strong) UITextField *tffundalHeight;

@property(nonatomic, strong) UITextField *tfUrineTest;
@property(nonatomic, strong) UITextField *tfBasalGlucose;
@property(nonatomic, strong) UITextField *tfOxygen;

@property(nonatomic, strong) UITextField *tfFetalHeartBeat;
@property(nonatomic, strong) UITextField *tfFetalRegion;
@property(nonatomic, strong) UILabel *labelContraction;
@property(nonatomic, strong) UILabel *labelContractions;
@property(nonatomic, strong) UISwitch *swtcontractionsExist;
@property(nonatomic, strong) UITextField *tfContractionsTime;
@property(nonatomic, strong) UILabel *lineCon;
@property(nonatomic, strong) UITextView *tvObservations;

@property (strong, nonatomic) IBOutlet UIScrollView *outScroll;

@property(nonatomic, strong) UILabel *l1;
@property(nonatomic, strong) UILabel *l3;
@property(nonatomic, strong) UILabel *l5;
@property(nonatomic, strong) UILabel *l7;
@property(nonatomic, strong) UILabel *l9;
@property(nonatomic, strong) UILabel *l11;
@property(nonatomic, strong) UILabel *l13;
@property(nonatomic, strong) UILabel *l15;
@property(nonatomic, strong) UILabel *l17;
@property(nonatomic, strong) UILabel *l19;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnSave;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnCancel;

- (IBAction)cancel:(UIBarButtonItem *)sender;

@end
