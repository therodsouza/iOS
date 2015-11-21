//
//  ContactDao.h
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@import UIKit;
@interface ContactDao : NSObject

// Strong reference and without the set method
@property (strong, readonly) NSMutableArray *contacts;

+(ContactDao *) contactDaoInstance;
-(void)addContacts:(Contact *) contact;
-(NSInteger) total;
-(Contact *) get:(NSInteger) index;
-(void) remove:(NSInteger) index;
-(NSInteger) searchContactPosition:(Contact *) contact;
-(Contact *) newContact;

@end
