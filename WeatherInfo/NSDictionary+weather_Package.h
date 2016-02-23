//
//  NSDictionary+weather_Package.h
//  WeatherInfo
//
//  Created by Akib Quraishi on 17/02/2016.
//  Copyright © 2016 AkibiOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (weather_Package)

-(NSDictionary *)currentCondition;
-(NSDictionary *)request;
-(NSArray *)upcomingWeather;

@end
