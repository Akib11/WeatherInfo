//
//  NSDictionary+weather.h
//  WeatherInfo
//
//  Created by Akib Quraishi on 17/02/2016.
//  Copyright © 2016 AkibiOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (weather)

- (NSNumber *)cloudCover;
- (NSString *)humidity;
- (NSDate *)observationTime;
- (NSNumber *)precipMM;
- (NSNumber *)pressue;
- (NSString *)tempC;
- (NSString *)tempF;
- (NSString *)visibility;
- (NSNumber *)weatherCode;
- (NSString *)windDir16Point;
- (NSNumber *)windDirDegree;
- (NSString *)windSpeedKmph;
- (NSNumber *)windSpeedMiles;
- (NSString *)weatherDescription;
- (NSString *)weatherIconURL;
- (NSDate *)date;
- (NSNumber *)tempMaxC;
- (NSNumber *)tempMaxF;
- (NSNumber *)tempMinC;
- (NSNumber *)tempMinF;



- (NSString *)hourlyTime;
- (NSString *)hourlytempC;
@end
