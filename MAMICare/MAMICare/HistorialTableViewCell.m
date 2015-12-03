//
//  HistorialTableViewCell.m
//  MAMICare
//
//  Created by Pau Escalante on 12/3/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "HistorialTableViewCell.h"

@implementation HistorialTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.lblBack.layer.cornerRadius = 5;
    self.lblBack.layer.masksToBounds = YES;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
