//
//  CurrentLocationController.h
//  vamanos
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "MLocationController.h"

@interface CurrentLocationController : UIViewController <MLocationControllerDelegate, UIWebViewDelegate, MKReverseGeocoderDelegate> {
    IBOutlet UILabel* positionLabel;
    MLocationController *locationController;
    MKReverseGeocoder *reverseGeocoder;
    UIActivityIndicatorView *spinner;
    

}

- (void)locationUpdate:(CLLocation *)location;
- (void)locationError:(NSError *)error;
- (IBAction)giveLocation:(id)sender;

- (IBAction)reverseGeocodeCurrentLocation;

@property (nonatomic, retain) UIActivityIndicatorView *spinner;
@property (nonatomic, retain) MKReverseGeocoder *reverseGeocoder;

//@property (nonatomic, retain) CLLocationManager *locationManager;
//@property (nonatomic, assign) MLocationController* locationController;


@property(nonatomic, retain) IBOutlet UILabel* locationLabel;
@property(nonatomic, retain) IBOutlet UIWebView* webView;

@property(nonatomic, retain) IBOutlet UILabel* positionLabel;


- (IBAction)backButtonPressed:(id)sender;
- (IBAction)forwardButtonPressed:(id)sender;
- (NSString*)replaceInString:(id)inputString stringToReplace:(id)stringReplaced replaceWithString:(id)stringToReplaceWith;

@end
