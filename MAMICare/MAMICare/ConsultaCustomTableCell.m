//
//  ConsultaCustomTableCell.m
//  MAMICare
//
//  Created by Pau Escalante on 12/2/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import "ConsultaCustomTableCell.h"

@implementation ConsultaCustomTableCell

- (void)awakeFromNib {
    // Initialization code
    self.backDato.layer.cornerRadius = 5;
    self.backDato.layer.masksToBounds = YES;
    self.backField.layer.cornerRadius = 5;
    self.backField.layer.masksToBounds = YES;
    
    self.userInteractionEnabled = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //set the position of the button
//    self.verObservaciones = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    self.verObservaciones.frame = CGRectMake(873, 20, 132, 50);
//    [self.verObservaciones setTitle:@"Abrir" forState:UIControlStateNormal];
//    UIFont *font = [UIFont systemFontOfSize:20];
//    self.verObservaciones.titleLabel.font = font;
//    [self.verObservaciones setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    
//    self.verObservaciones.backgroundColor= [UIColor clearColor];
//    self.verObservaciones.enabled = YES;
//    [self addSubview:self.verObservaciones];
//    [self.verObservaciones addTarget:self action:@selector(btnObservaciones:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/*
- (IBAction)btnObservaciones:(id)sender {
    //alert error
    UIAlertController *alert =  [UIAlertController alertControllerWithTitle:@"Observaciones"
                                                                    message:self.observationText
                                                             preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    
    UIViewController* activeVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    [activeVC presentViewController:alert
                           animated:YES
                         completion:NULL];
    
    //[self presentViewController:alert animated:YES completion:nil];
 
}
 */

 


@end
