//
//  ContactMapViewController.h
//  ContatosIP67
//
//  Created by ios5778 on 11/14/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ContactDao.h"

@interface ContactMapViewController : UIViewController<MKMapViewDelegate>

@property CLLocationManager *manager;
@property IBOutlet MKMapView *map;
@property (nonatomic, weak) NSMutableArray *contacts;

@end
