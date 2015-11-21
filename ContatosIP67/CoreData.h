//
//  CoreData.h
//  ContatosIP67
//
//  Created by ios5778 on 11/21/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreData : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+(CoreData *) coreDataInstance;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
