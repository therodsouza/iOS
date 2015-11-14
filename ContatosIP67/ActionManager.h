//
//  ActionManager.h
//  ContatosIP67
//
//  Created by ios5778 on 11/7/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Contact.h"

@import MessageUI;

@interface ActionManager : NSObject<UIActionSheetDelegate, MFMailComposeViewControllerDelegate>

@property Contact *contact;
@property UIViewController *controller;
-(id) initWithContact:(Contact *) contact;
-(void) controllerActions:(UIViewController *) controller;

@end
