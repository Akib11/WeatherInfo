//
//  DetailViewController.m
//  WeatherInfo
//
//  Created by Akib Quraishi on 17/02/2016.
//  Copyright © 2016 AkibiOS. All rights reserved.
//

#import "FXBlurView.h"
#import "DetailViewController.h"
#import "NSDictionary+weather.h"
#import "NSDictionary+weather_Package.h"
#import <AFNetworking/AFNetworking.h>
#import "UIImageView+AFNetworking.h"


@interface DetailViewController ()<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;


@property (strong, nonatomic) IBOutlet UILabel *NextDay1DateLabel;

@property (strong, nonatomic) IBOutlet UICollectionView *NextDay1CollectionView;


@property (strong, nonatomic) IBOutlet UILabel *NextDay2DateLabel;

@property (strong, nonatomic) IBOutlet UICollectionView *NextDay2CollectionView;


@property (strong, nonatomic) IBOutlet UILabel *NextDay3DateLabel;

@property (strong, nonatomic) IBOutlet UICollectionView *NextDay3CollectionView;


@property (strong, nonatomic) IBOutlet UILabel *tempCLabel;
@property (strong, nonatomic) IBOutlet UILabel *cityLabel;
@property (strong, nonatomic) IBOutlet UILabel *weatherDescLabel;
@property (strong, nonatomic) IBOutlet UIImageView *weatherIconImageView;


@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@property (strong, nonatomic) IBOutlet UILabel *sunriseLabel;
@property (strong, nonatomic) IBOutlet UILabel *sunsetLabel;
@property (strong, nonatomic) IBOutlet UILabel *humidityLabel;
@property (strong, nonatomic) IBOutlet UILabel *visibilityLabel;
@property (strong, nonatomic) IBOutlet UILabel *windSpeedLabel;
@property (strong, nonatomic) IBOutlet UILabel *tempFLabel;



@end

@implementation DetailViewController {
    NSDictionary *dict0;
    NSArray *UpcomingWeatherArray;
    NSDictionary *nextDay1Dic;
    NSDictionary *nextDay2Dic;
    NSDictionary *nextDay3Dic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollView.delegate = self;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, 1251);
    
    FXBlurView *_blurView = [[FXBlurView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.scrollView.frame.size.height)];
    _blurView.blurRadius = 80.f;
    [self.view insertSubview:_blurView atIndex:0];
    NSLog(@"*****%f",self.scrollView.frame.size.width);
     NSLog(@"****%f",_blurView.frame.size.width);
   // NSLog(@"****/n%@",self.Weathers);
  
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor =[[UIColor grayColor] colorWithAlphaComponent:0.5];
    
    self.NextDay1CollectionView.delegate = self;
    self.NextDay1CollectionView.dataSource = self;
    self.NextDay1CollectionView.backgroundColor =[[UIColor grayColor] colorWithAlphaComponent:0.5];
    
    self.NextDay2CollectionView.delegate = self;
    self.NextDay2CollectionView.dataSource = self;
    self.NextDay2CollectionView.backgroundColor =[[UIColor grayColor] colorWithAlphaComponent:0.5];
    
    self.NextDay3CollectionView.delegate = self;
    self.NextDay3CollectionView.dataSource = self;
    self.NextDay3CollectionView.backgroundColor =[[UIColor grayColor] colorWithAlphaComponent:0.5];
    
    
    
    NSDictionary *request = self.Weathers.request;
    self.cityLabel.text = request[@"query"];
    
    NSDictionary *current_condition = self.Weathers.currentCondition;
    
    [self.weatherIconImageView setImageWithURL:[NSURL URLWithString:current_condition.weatherIconURL]];
    self.weatherDescLabel.text = current_condition.weatherDescription;
    self.tempCLabel.text = [NSString stringWithFormat:@"%@°",current_condition.tempC];
    
    self.humidityLabel.text = current_condition.humidity;
    self.visibilityLabel.text = current_condition.visibility;
    self.windSpeedLabel.text = current_condition.windSpeedKmph;
    self.tempFLabel.text = current_condition.tempF;
    
    
    //Nested Array and Dic for sunrise, sunset value
   UpcomingWeatherArray = self.Weathers.upcomingWeather;
    
    dict0 = UpcomingWeatherArray[0];
    NSArray *astroArray = dict0[@"astronomy"];
    NSDictionary *sunDic = astroArray[0];
    self.sunriseLabel.text = sunDic[@"sunrise"];
    self.sunsetLabel.text = sunDic[@"sunset"];
    
    self.dateLabel.text = [NSString stringWithFormat:@"Today \"%@\"",dict0[@"date"]];
  
    nextDay1Dic = UpcomingWeatherArray[1];
    self.NextDay1DateLabel.text = nextDay1Dic[@"date"];
    
    nextDay2Dic = UpcomingWeatherArray[2];
    self.NextDay2DateLabel.text = nextDay2Dic[@"date"];
    
    nextDay3Dic = UpcomingWeatherArray[3];
    self.NextDay3DateLabel.text = nextDay3Dic[@"date"];
    
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (collectionView == self.collectionView) {
        NSArray *hourlyArray = dict0[@"hourly"];
        return hourlyArray.count;
        
    } else if (collectionView == self.NextDay1CollectionView) {
        NSDictionary *dic1 = UpcomingWeatherArray[1];
        NSArray *hourlyArray = dic1[@"hourly"];
        return hourlyArray.count;
    
    } else if (collectionView == self.NextDay2CollectionView) {
        NSDictionary *dic2 = UpcomingWeatherArray[2];
        NSArray *hourlyArray = dic2[@"hourly"];
        return hourlyArray.count;
    
    } else if (collectionView == self.NextDay3CollectionView) {
        NSDictionary *dic3 = UpcomingWeatherArray[3];
        NSArray *hourlyArray = dic3[@"hourly"];
        return hourlyArray.count;
    
    }
    
    return 0;

}





-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    UICollectionViewCell *myCell = [collectionView
                                  dequeueReusableCellWithReuseIdentifier:@"cell"
                                  forIndexPath:indexPath];
 
    if (collectionView == self.collectionView) {
        
        [self SortingCellsWithDictionary:dict0 first:100 second:102 third:103 withIndexPath:indexPath withCell:myCell];
        
        
    } else if (collectionView == self.NextDay1CollectionView) {
        
        [self SortingCellsWithDictionary:nextDay1Dic first:201 second:202 third:203 withIndexPath:indexPath withCell:myCell];
        
    } else if (collectionView == self.NextDay2CollectionView) {
        [self SortingCellsWithDictionary:nextDay1Dic first:301 second:302 third:303 withIndexPath:indexPath withCell:myCell];
        
    } else if (collectionView == self.NextDay3CollectionView) {
        [self SortingCellsWithDictionary:nextDay1Dic first:401 second:402 third:403 withIndexPath:indexPath withCell:myCell];
    }
    
     return myCell;
    
}


-(void)SortingCellsWithDictionary:(NSDictionary *)dictionary first:(NSInteger)one second:(NSInteger)second third:(NSInteger)third withIndexPath:(NSIndexPath*)indexPath withCell:(UICollectionViewCell *)myCell{

    NSArray *hourlyArray = dictionary[@"hourly"];
    NSDictionary *tempDic = hourlyArray[indexPath.row];
    NSString *iconUrl = tempDic.weatherIconURL;
    
    
    UIImageView *imageview = (UIImageView *)[myCell.contentView viewWithTag:one];
    [imageview setImageWithURL:[NSURL URLWithString:iconUrl] placeholderImage:[UIImage imageNamed:@"Placeholder.png" ]];
    
    UILabel *timeLabel = (UILabel *)[myCell.contentView viewWithTag:second];
    timeLabel.text = tempDic.hourlyTime;
    
    UILabel *degreeLabel = (UILabel *)[myCell.contentView viewWithTag:third];
    degreeLabel.text = tempDic.hourlytempC;

}







@end
