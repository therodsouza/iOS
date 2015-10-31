//
//  ContactsListViewController.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import "ContactsListViewController.h"

@interface ContactsListViewController ()

@end

@implementation ContactsListViewController

-(id) init {
    self = [super init];
    if (self) {
        // Create the addButton, calling self the method showFormContacView
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(showFormContactView)];
        // Set the title
        self.navigationItem.title = @"VNT Contacts";
        // Add the button
        self.navigationItem.rightBarButtonItem = addButton;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// Opens the form contact view
- (void) showFormContactView {
    
    /* Create the form */
    
    // Doing this manualy, the screen will not appear. We need to create using with the story board
    // FormContactViewController *form = [FormContactViewController new];
    
    // Creating with the story board
    // Get the storyBoard instance
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FormContactViewController *form = [storyBoard instantiateViewControllerWithIdentifier:@"formContact"];
    
    
    // Now send the message to navigation Controller to show the form
    [self.navigationController pushViewController:form animated: YES];
    

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
