//
//  ViewController.h
//  HTTPRequestLecture
//
//  Created by Yung Dai on 2015-05-04.
//  Copyright (c) 2015 Yung Dai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTTPCommunication.h"
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) HTTPCommunication *http;
@property (strong, nonatomic) NSNumber *responseID;
@property (strong, nonatomic) IBOutlet UILabel *jokeLabel;
@property (strong, nonatomic) NSMutableArray *stationName;



@property (strong,nonatomic) MKMapView *mapView;

- (IBAction)getJokeWhenButtonPresssed:(id)sender;
@end

