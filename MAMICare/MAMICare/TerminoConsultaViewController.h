//
//  TerminoConsultaViewController.h
//  MAMICare
//
//  Created by Pau Escalante on 11/23/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Assessment.h"

@interface TerminoConsultaViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *labelFirstName;

@property (strong, nonatomic) IBOutlet UILabel *labelLastName;

@property (strong, nonatomic) IBOutlet UIImageView *picturePatient;

- (IBAction)btnMenu:(UIBarButtonItem *)sender;

@property (nonatomic, strong) NSString *strFirstName;

@property (nonatomic, strong) NSString *strLastName;

@property (nonatomic, strong) UIImage *imagePatient;

@property (nonatomic, strong) Assessment *assessment;

@end
