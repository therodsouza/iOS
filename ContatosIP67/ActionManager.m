//
//  ActionManager.m
//  ContatosIP67
//
//  Created by ios5778 on 11/7/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import "ActionManager.h"

@implementation ActionManager

-(id) initWithContact:(Contact *)contact {
    self = [super init];
    
    if(self) {
        self.contact = contact;
    }
    
    return self;
}

-(void) controllerActions:(UIViewController *)controller {
    self.controller = controller;
    UIActionSheet *options = [[UIActionSheet alloc] initWithTitle: self.contact.name delegate:self
                                                cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Call", @"Send Mail", @"View site", @"Open map", nil];
    [options showInView:controller.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    // implement switch according to the action
    switch (buttonIndex) {
        case 0:
            [self call];
            break;
        case 1:
            [self sendEmail];
            break;
        case 2:
            [self openSite];
            break;
        case 3:
            [self showMap];
            break;
        default:
            break;
    }
}

-(void) call {
    UIDevice *device = [UIDevice currentDevice];
    NSLog(@"Device:%@", device.model);
    if ([device.model isEqualToString:@"iPhone"]) { // Xcode 7.1 iPhone simulator is equal to iPhone
        NSString *number = [NSString stringWithFormat:@"tel:%@",self.contact.phone];
        [self openAppWithURL:number];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Telephone not available" message:@"Your device is not an iPhone" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }
}

-(void) sendEmail {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *emailSender = [MFMailComposeViewController new];
        
        emailSender.mailComposeDelegate = self;
        
        [emailSender setToRecipients:@[self.contact.email]];
        [emailSender setSubject:@"Caelum"];
        
        [self.controller presentViewController:emailSender animated:YES completion:nil];
    } else {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle: @"Oops!" message:@"Cannot send email"  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}

-(void) openSite {
    NSString *url = self.contact.site;
    [self openAppWithURL:url];
}

-(void) showMap {
    NSString *url = [[NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", self.contact.address] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self openAppWithURL:url];
}

-(void) openAppWithURL: (NSString *) url {
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:url]];
}

-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self.controller dismissViewControllerAnimated:YES completion:nil];
}

@end
