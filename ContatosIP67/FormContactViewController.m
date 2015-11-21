//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import "FormContactViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface FormContactViewController ()
@property ContactDao *dao;
@end


@implementation FormContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *saveButton = nil;
    // Do any additional setup after loading the view, typically from a nib.
    
    if (self.contact) {
        self.textFieldName.text = self.contact.name;
        self.textFieldEmail.text = self.contact.email;
        self.textFieldSite.text = self.contact.site;
        self.textFieldAddress.text = self.contact.address;
        self.textFieldPhone.text = self.contact.phone;
        self.textFieldLatitude.text = [self.contact.latitude stringValue];
        self.textFieldLongitude.text = [self.contact.longitude stringValue];

        if (self.contact.photo) {
            [self.photoBtn setBackgroundImage:self.contact.photo forState:UIControlStateNormal];
            [self.photoBtn setTitle:nil forState:UIControlStateNormal];
        }
        
        // Create the addButton, calling self the method showFormContacView
        saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Update" style:UIBarButtonItemStylePlain target:self action:@selector(updateContact)];
    } else {
        saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveContact)];

    }
    
    // Add the button
    self.navigationItem.rightBarButtonItem = saveButton;

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
        

        
    }
    
    return self;
}

// Save new Contacts
-(void) saveContact {
    // Create the property contact
    self.contact = [Contact new];
    // get the form data and save it
    [self getFormData];
    // add the contact
    [self.dao addContacts:self.contact];

    // pop this form
    [self.navigationController popToRootViewControllerAnimated:YES];
    // There are other popTo* methods to go to other screens in the stack
    
    if (self.delegate) {
        [self.delegate contactAdded:self.contact];
    }
}

-(void) updateContact {
    // get the form data and save it
    [self getFormData];
    // pop this form
    [self.navigationController popToRootViewControllerAnimated:YES];
    // There are other popTo* methods to go to other screens in the stack
    
    if (self.delegate) {
        [self.delegate contactUpdated:self.contact];
    }

}
/*!
 Get the values of the form fields, create a Contact and add to the contacts array
 */
- (void) getFormData {
    
    if (!self.contact) {
        self.contact = [Contact new];
    }
    
    if ([self.photoBtn backgroundImageForState:UIControlStateNormal]) {
        self.contact.photo = [self.photoBtn backgroundImageForState:UIControlStateNormal];
    }
    
    // Get the values from the text fields
    NSString *name = self.textFieldName.text;
    NSString *email = self.textFieldEmail.text;
    NSString *site = self.textFieldSite.text;
    NSString *address = self.textFieldAddress.text;
    NSString *phone = self.textFieldPhone.text;
    NSNumber *latitude = [NSNumber numberWithFloat: [self.textFieldLatitude.text floatValue]];
    NSNumber *longitude = [NSNumber numberWithFloat: [self.textFieldLongitude.text floatValue]];
    
    // Create the contact object and set the values
    self.contact.name = name;
    self.contact.email = email;
    self.contact.site = site;
    self.contact.address = address;
    self.contact.phone = phone;
    self.contact.latitude = latitude;
    self.contact.longitude = longitude;
}

- (IBAction)selectPhoto {
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Pick photo" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle: nil otherButtonTitles:@"Camera", @"Library", nil];
        
        [sheet showInView: self.view];
        
    } else {
        UIImagePickerController *picker = [UIImagePickerController new];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = [info valueForKey:UIImagePickerControllerEditedImage];
    
    [self.photoBtn setBackgroundImage:image forState: UIControlStateNormal];
    [self.photoBtn setTitle: nil forState: UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion: nil];
}

- (void) actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    if (buttonIndex == 0) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else if (buttonIndex == 1) {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:picker animated:YES completion: nil];
    
}

- (IBAction)searchCoordinates: (UIButton *) button {
    [self.spinner startAnimating];
    button.hidden = YES;
    
    CLGeocoder *geocoder = [CLGeocoder new];
    [geocoder geocodeAddressString: self.textFieldAddress.text completionHandler: ^(NSArray *results, NSError *error) {
        if (error == nil && [results count] > 0) {
            CLPlacemark *result = results[0];
            CLLocationCoordinate2D coordinate = result.location.coordinate;
            self.textFieldLatitude.text = [NSString stringWithFormat:@"%f", coordinate.latitude];
            self.textFieldLongitude.text = [NSString stringWithFormat:@"%f", coordinate.longitude];
        } else {
            NSLog(@"Error: %@ Results: %@", error, results);
        }
        
        [self.spinner stopAnimating];
        button.hidden = NO;
    }];
}

@end
