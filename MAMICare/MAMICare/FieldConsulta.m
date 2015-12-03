//
//  FieldConsulta.m
//  EjercicioContactos
//
//  Created by Natalia García on 9/10/15.
//  Copyright (c) 2015 Natalia García. All rights reserved.
//

#import "FieldConsulta.h"

@implementation FieldConsulta
- (id) initWithField:(NSString *)f dato:(NSString *)d {
        self = [super init];
        if (self) {
            _field = f;
            _dato = d;
        }
        return self;
}
@end
