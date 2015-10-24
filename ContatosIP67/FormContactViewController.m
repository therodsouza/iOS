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

// Quam chama esse metodo eh o COntroller, mas pode ser pelo init normal mesmo
//-(id) initWithCoder:(NSCoder *)aDecoder {
//    self = [super initWithCoder: aDecoder];
//    
//    if (self) {
//                NSLog(@"THIS IS NSCODER!");
//    }
//    
//    return self;
//}

-(id) init {
    self = [super init];
    NSLog(@"THIS IS INIT!");
    if (self) {
        self.dao = [ContactDao contactDaoInstance];
    }
    
    return self;
}

/*!
 Get the values of the form fields, create a Contact and add to the contacts array
 */
- (IBAction) getFormData {
    // Get the values from the text fields
    NSString *name = self.textFieldName.text;
    NSString *email = self.textFieldEmail.text;
    NSString *site = self.textFieldSite.text;
    NSString *address = self.textFieldAddress.text;
    NSString *phone = self.textFieldPhone.text;
    
    // Create the contact object and set the values
    Contact *contact = [Contact new];
    
    contact.name = name;
    contact.email = email;
    contact.site = site;
    contact.address =address;
    contact.phone = phone;

    //
    
    [self.dao addContacts:contact];
    
    NSLog(@"Contact %@", self.dao.contacts);
}

@end
