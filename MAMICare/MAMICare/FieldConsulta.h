//
//  FieldConsulta.h
//  EjercicioContactos
//
//  Created by Natalia García on 9/10/15.
//  Copyright (c) 2015 Natalia García. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FieldConsulta : NSObject
@property (nonatomic, strong) NSString *field;
@property (nonatomic, strong) NSString *dato;
-(id) initWithField: (NSString *) f
            dato: (NSString *) d;
@end
