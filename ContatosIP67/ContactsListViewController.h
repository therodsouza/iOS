//
//  ContactsListViewController.h
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormContactViewController.h"
#import "ActionManager.h"

@interface ContactsListViewController : UITableViewController<FormContactViewControllerDelegate>

@property NSInteger highlightRow;
@property (readonly) ActionManager *actionManager;

-(void)showMoreActions:(UIGestureRecognizer *) gesture;

@end
