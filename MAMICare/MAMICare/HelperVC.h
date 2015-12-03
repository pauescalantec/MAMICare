//
//  HelperVC.h
//  MAMICare
//
//  Created by Luis Alberto Lamadrid on 11/27/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Patient.h"

@interface HelperVC : UIViewController

+ (UIImage *)getPhotoForUser:(Patient *)patient;

@end
