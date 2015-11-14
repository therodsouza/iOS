//
//  ContactMapViewController.m
//  ContatosIP67
//
//  Created by ios5778 on 11/14/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import "ContactMapViewController.h"

@interface ContactMapViewController ()

@end

@implementation ContactMapViewController

- (id) init{
    self = [super init];
    
    if (self) {
        UIImage *imageTabItem = [UIImage imageNamed:@"mapa-contatos.png"];
        UITabBarItem *tabItem = [[UITabBarItem alloc] initWithTitle:@"Map" image:imageTabItem tag:0];
        
        self.tabBarItem = tabItem;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
