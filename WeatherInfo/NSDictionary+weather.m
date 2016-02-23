//
//  NSDictionary+weather.m
//  WeatherInfo
//
//  Created by Akib Quraishi on 17/02/2016.
//  Copyright © 2016 AkibiOS. All rights reserved.
//

#import "NSDictionary+weather.h"

@implementation NSDictionary (weather)


- (NSNumber *)cloudCover
{
    NSString *cc = self[@"cloudcover"];
    NSNumber *n = @([cc intValue]);
    return n;
}

- (NSString  *)humidity
{
    NSString *cc = [NSString stringWithFormat:@"%@ %%",self[@"humidity"]];
    return cc;
}

- (NSDate *)observationTime
{
    //    NSString *cc = [self currentWeather][@"observation_time"];
    NSDate *n = [NSDate date]; // parse instead "09:07 PM";
    return n;
}

- (NSNumber *)precipMM
{
    NSString *cc = self[@"precipMM"];
    NSNumber *n = @([cc intValue]);
    return n;
}

- (NSNumber *)pressue
{
    NSString *cc = self[@"pressure"];
    NSNumber *n = @([cc intValue]);
    return n;
}

- (NSString *)tempC
{
    NSString *cc = [NSString stringWithFormat:@"%@°", self[@"temp_C"]];
    return cc;
}

- (NSString *)tempF
{
    NSString *cc = self[@"temp_F"];
    return cc;
}

- (NSString *)visibility
{
    NSString *cc = [NSString stringWithFormat:@"%@ km",self[@"visibility"]];
    return cc;
}

- (NSNumber *)weatherCode
{
    NSString *cc = self[@"weatherCode"];
    NSNumber *n = @([cc intValue]);
    return n;
}

-(NSString *)windDir16Point
{
    return self[@"winddir16Point"];
}

- (NSNumber *)windDirDegree
{
    NSString *cc = self[@"winddirDegree"];
    NSNumber *n = @([cc intValue]);
    return n;
}

- (NSString *)windSpeedKmph
{
    NSString *cc = [NSString stringWithFormat:@"%@ Kmph",self[@"windspeedKmph"]];
    return cc;
}

- (NSNumber *)windSpeedMiles
{
    NSString *cc = self[@"windspeedMiles"];
    NSNumber *n = @([cc intValue]);
    return n;
}

- (NSString *)weatherDescription
{
    NSArray *ar = self[@"weatherDesc"];
    NSDictionary *dict = ar[0];
    return dict[@"value"];
}

- (NSString *)weatherIconURL
{
    NSArray *ar = self[@"weatherIconUrl"];
    NSDictionary *dict = ar[0];
    return dict[@"value"];
}

- (NSDate *)date
{
    //    NSString *dateStr = self[@"date"]; // date = "2013-01-15";
    return [NSDate date];
}

- (NSNumber *)tempMaxC
{
    NSString *cc = self[@"tempMaxC"];
    NSNumber *n = @([cc intValue]);
    return n;
}

- (NSNumber *)tempMaxF
{
    NSString *cc = self[@"tempMaxF"];
    NSNumber *n = @([cc intValue]);
    return n;
}

- (NSNumber *)tempMinC
{
    NSString *cc = self[@"tempMinC"];
    NSNumber *n = @([cc intValue]);
    return n;
}

- (NSNumber *)tempMinF
{
    NSString *cc = self[@"tempMinF"];
    NSNumber *n = @([cc intValue]);
    return n;
}

////////////////////////// Hourly Array Dic

- (NSString *)hourlyTime
{
    NSString *cc = [NSString stringWithFormat:@"%@", self[@"time"]];
    
    if ([cc isEqualToString:@"0"]) {
        
        NSString *cc1 = @"12 AM";
        return cc1;
        
    } else if ([cc isEqualToString:@"300"]) {
        
        NSString *cc1 = @"3 AM";
        return cc1;
        
    } else if ([cc isEqualToString:@"600"]) {
        
        NSString *cc1 = @"6 AM";
        return cc1;
        
    }else if ([cc isEqualToString:@"900"]) {
        
        NSString *cc1 = @"9 AM";
        return cc1;
        
    }else if ([cc isEqualToString:@"1200"]) {
        
        NSString *cc1 = @"12 PM";
        return cc1;
        
    }else if ([cc isEqualToString:@"1500"]) {
        
        NSString *cc1 = @"3 PM";
        return cc1;
        
    }else if ([cc isEqualToString:@"1800"]) {
        
        NSString *cc1 = @"6 PM";
        return cc1;
        
    }else if ([cc isEqualToString:@"2100"]) {
        
        NSString *cc1 = @"9 PM";
        return cc1;
        
    }
    return cc;
}

- (NSString *)hourlytempC
{
    NSString *cc = [NSString stringWithFormat:@"%@°", self[@"tempC"]];
    return cc;
}


@end
