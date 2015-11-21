//
//  Contact.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (NSString *) description {
    return [NSString stringWithFormat: @"%@ <%@>", self.name, self.email ];
}

- (CLLocationCoordinate2D) coordinate {
    return CLLocationCoordinate2DMake([self.latitude doubleValue], [self.longitude doubleValue]);
}

@end
