//
//  ViewController.h
//  WeatherInfo
//
//  Created by Akib Quraishi on 02/02/2016.
//  Copyright © 2016 AkibiOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherHTTPClient.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<WeatherHTTPClientDelegate,CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

