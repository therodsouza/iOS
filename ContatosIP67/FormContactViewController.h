//
//  ViewController.h
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
#import "ContactDao.h"

@protocol FormContactViewControllerDelegate <NSObject>

- (void) contactUpdated:(Contact *) contact;
- (void) contactAdded:(Contact *) contact;

@end

@interface FormContactViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmail;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSite;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAddress;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPhone;
@property (weak, nonatomic) IBOutlet UITextField *textFieldLatitude;
@property (weak, nonatomic) IBOutlet UITextField *textFieldLongitude;
@property Contact *contact;
@property (weak) id<FormContactViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *photoBtn;

- (IBAction)selectPhoto;
- (IBAction)searchCoordinates;

@end

