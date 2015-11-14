//
//  ContactMapViewController.h
//  ContatosIP67
//
//  Created by ios5778 on 11/14/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ContactMapViewController : UIViewController

@property CLLocationManager *manager;
@property IBOutlet MKMapView *map;

@end
