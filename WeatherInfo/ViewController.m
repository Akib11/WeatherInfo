//
//  ViewController.m
//  WeatherInfo
//
//  Created by Akib Quraishi on 02/02/2016.
//  Copyright © 2016 AkibiOS. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet UITextField *textfield;
@property (strong, nonatomic) IBOutlet UIButton *goButton;

@end

@implementation ViewController {
    NSDictionary *tempDic;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.containerView.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.5];
    self.textfield.delegate = self;
     self.goButton.enabled = NO;
   
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    if ([self.textfield.text length] > 2) {
        self.goButton.enabled = YES;
    }
    
    return YES;

}

#pragma mark - IBActions

- (IBAction)apiButtonPressed:(UIButton *)sender {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}

- (IBAction)goButtonPressed:(UIButton *)sender {
    
    if ([self.textfield.text length] > 2) {
    
    WeatherHTTPClient *client = [WeatherHTTPClient sharedWeatherHTTPClient];
    
    client.delegate = self;
    
    [client updateWeatherAtCityName:self.textfield.text forNumberOfDays:5];
        
    }
    
    NSLog(@"Less Character....");
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"Location Updating***");
    // Last object contains the most recent location
    CLLocation *newLocation = [locations lastObject];
    
    // If the location is more than 5 minutes old, ignore it
    if([newLocation.timestamp timeIntervalSinceNow] > 300)
        return;
    
    [self.locationManager stopUpdatingLocation];
    
    WeatherHTTPClient *client = [WeatherHTTPClient sharedWeatherHTTPClient];
    
    client.delegate = self;
    
    [client updateWeatherAtLocation:newLocation forNumberOfDays:5];
}


#pragma mark - WeatherHTTPClientDelegate

- (void)weatherHTTPClient:(WeatherHTTPClient *)client didUpdateWithWeather:(id)weather
{
    NSLog(@"didUpdateWithWeather*************");
    tempDic = weather;
    
    //NSLog(@"%@",temp);
   
    if (tempDic) {
        [self performSegueWithIdentifier:@"SegueToDetailInfo" sender:nil];
    }
}

- (void)weatherHTTPClient:(WeatherHTTPClient *)client didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError");
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"SegueToDetailInfo"]) {
        DetailViewController *controller = segue.destinationViewController;
        controller.Weathers = tempDic;
    }
    
}





@end
