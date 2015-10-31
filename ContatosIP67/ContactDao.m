//
//  ContactDao.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import "ContactDao.h"

@implementation ContactDao
// Static reference to the ContactDao
static ContactDao *defaultDao = nil;

+(ContactDao *)contactDaoInstance {
    if (!defaultDao) {
        defaultDao = [ContactDao new];
    }
    
    return defaultDao;
}

-(ContactDao *) init {
    self = [super init];
    
    if (self) {
        _contacts = [NSMutableArray new];
    }
    return self;
}


-(void) addContacts:(Contact *)contact {
    [self.contacts addObject:contact];
}

-(NSInteger) total {
    return self.contacts.count;
}

-(Contact *)get:(NSInteger)index {
    return self.contacts[index];
}

- (void)remove:(NSInteger)index {
    [self.contacts removeObjectAtIndex:index];
}

@end
