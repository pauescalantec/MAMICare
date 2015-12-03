//
//  ConsultaCustomTableCell.h
//  MAMICare
//
//  Created by Pau Escalante on 12/2/15.
//  Copyright © 2015 Paulina´s. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConsultaCustomTableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lblDato;

@property (strong, nonatomic) IBOutlet UILabel *lblField;

@property (strong, nonatomic) IBOutlet UILabel *backDato;

@property (strong, nonatomic) IBOutlet UILabel *backField;

//@property (strong, nonatomic) UIButton *verObservaciones;

@property (nonatomic, strong) NSString *observationText;


@end
