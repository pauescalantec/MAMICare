//
//  DetailViewController.h
//  MAMICare
//
//  Created by Luis Alberto Lamadrid on 11/5/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Patient.h"

@interface DetailViewController : UIViewController

// detail Items
@property (nonatomic, strong) Patient *patient;

// outlets
@property (weak, nonatomic) IBOutlet UIImageView *imgPatientImage;
@property (weak, nonatomic) IBOutlet UILabel *lblPatientName;

//actions


@end
