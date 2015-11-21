//
//  ContactDao.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import "ContactDao.h"
#import "CoreData.h"
#import <CoreData/CoreData.h>

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
        [self insertDefaultContact];
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

-(NSInteger) searchContactPosition:(Contact *)contact {
    return [self.contacts indexOfObject:contact];
}

- (void) insertDefaultContact {
    
    NSUserDefaults *configs = [NSUserDefaults standardUserDefaults];
    
    BOOL inserted = [configs boolForKey:@"inserted"];
    
    if (inserted) {
        Contact *defaultContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:[[CoreData coreDataInstance]managedObjectContext]];
        
        defaultContact.name = @"Rodrigo";
        defaultContact.email = @"rodrigo.evangelista.souza@gmail.com";
        defaultContact.address = @"Rua Vergueiro, Sao Paulo";
        defaultContact.phone = @"19 000000000";
     
        [[CoreData coreDataInstance] saveContext];
        [configs setBool:YES forKey:@"inserted"];
        [configs synchronize];
    }
}

@end
