//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import "FormContactViewController.h"

@interface FormContactViewController ()
    @property ContactDao *dao;
    @property Contact *contact;

@end


@implementation FormContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Story board call this method instead of init
-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self) {
        // Set the title (shortcut to self.navigationItem.title)
        self.title = @"New contact";
        self.dao = [ContactDao contactDaoInstance];
        
        // Create the addButton, calling self the method showFormContacView
        UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveContact)];
        // Add the button
        self.navigationItem.rightBarButtonItem = saveButton;

        
    }
    
    return self;
}

-(void) saveContact {
    // Create the property contact
    self.contact = [Contact new];
    // get the form data and save it
    [self getFormData];
    // pop this form
    [self.navigationController popToRootViewControllerAnimated:YES];
    // There are other popTo* methods to go to other screens in the stack
}
/*!
 Get the values of the form fields, create a Contact and add to the contacts array
 */
- (void) getFormData {
    // Get the values from the text fields
    NSString *name = self.textFieldName.text;
    NSString *email = self.textFieldEmail.text;
    NSString *site = self.textFieldSite.text;
    NSString *address = self.textFieldAddress.text;
    NSString *phone = self.textFieldPhone.text;
    
    // Create the contact object and set the values
    self.contact.name = name;
    self.contact.email = email;
    self.contact.site = site;
    self.contact.address =address;
    self.contact.phone = phone;

    // add the contact
    [self.dao addContacts:self.contact];
    
    NSLog(@"Contact %@", self.dao.contacts);
}

@end
