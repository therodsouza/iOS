//
//  ContactsListViewController.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import "ContactsListViewController.h"

@interface ContactsListViewController ()
@property ContactDao *dao;
@end

@implementation ContactsListViewController

static NSString *CONTAC_CELL = @"contactCell";

-(id) init {
    self = [super init];
    if (self) {
        // Create the addButton, calling self the method showFormContacView
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd) target:self action:@selector(showFormContactView)];

        // Set the title
        self.navigationItem.title = @"VNT Contacts";
        // Add the button
        self.navigationItem.rightBarButtonItem = addButton;
        // The view already have the 'edit' button ready, just add it to the view
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
        
        // Get the dao
        self.dao = [ContactDao contactDaoInstance];
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

/* Methods to set the table values */
// Default to have 1 section
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Returns the number of contacts
- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section {
    return [self.dao total];
}

// Return the component
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Contact *contact = [self.dao get: indexPath.row];
    
    // Try to re-use a cell that is not visible to avoid memory usage
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CONTAC_CELL];
    
    // If the cell does not exist, we need to create it
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CONTAC_CELL];
    }
    
    cell.textLabel.text = contact.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.dao remove:indexPath.row];
        // [tableView reloadData];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
// Reload the table view contents just before the view appear
-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
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
