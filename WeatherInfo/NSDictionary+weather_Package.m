//
//  NSDictionary+weather_Package.m
//  WeatherInfo
//
//  Created by Akib Quraishi on 17/02/2016.
//  Copyright © 2016 AkibiOS. All rights reserved.
//

#import "NSDictionary+weather_Package.h"

@implementation NSDictionary (weather_Package)


- (NSDictionary *)currentCondition
{
    NSDictionary *dict = self[@"data"];
    NSArray *ar = dict[@"current_condition"];
    return ar[0];
}

- (NSDictionary *)request
{
    NSDictionary *dict = self[@"data"];
    NSArray *ar = dict[@"request"];
    return ar[0];
}

- (NSArray *)upcomingWeather
{
    NSDictionary *dict = self[@"data"];
    return dict[@"weather"];
}

@end
