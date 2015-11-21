//
//  Contact.h
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>
#import <CoreData/CoreData.h>

@import UIKit;

@interface Contact : NSManagedObject<MKAnnotation>
@property (strong) NSString *name;
@property (strong) NSString *email;
@property (strong) NSString *site;
@property (strong) NSString *address;
@property (strong) NSString *phone;
@property UIImage *photo;
@property (strong) NSNumber *latitude;
@property (strong) NSNumber *longitude;

@end
