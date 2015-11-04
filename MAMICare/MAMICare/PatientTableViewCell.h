//
//  PatientTableViewCell.h
//  MAMICare
//
//  Created by Luis Alberto Lamadrid on 11/3/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientTableViewCell : UITableViewCell

// outlets
@property (weak, nonatomic) IBOutlet UIImageView *imgPatientImage;
@property (weak, nonatomic) IBOutlet UILabel *lblPatientName;

// outlet collections
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *lblBabiesCollection;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *lblVisitsCollection;

@end
