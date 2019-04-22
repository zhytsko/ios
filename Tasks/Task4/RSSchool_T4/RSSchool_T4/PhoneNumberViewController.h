#import <UIKit/UIKit.h>

@interface PhoneNumber : UIViewController

@property (retain,nonatomic) NSArray *flags;
@property (retain,nonatomic) NSString *countryCode;
@property (retain,nonatomic) NSString *operatorCode;
@property (retain,nonatomic) UITextField *phoneTextField;
@property (retain,nonatomic) NSString *firstPart;
@property (retain,nonatomic) NSString *secondPart;
@property (retain,nonatomic) NSString *thirdPart;
@property (retain,nonatomic) NSArray *countriesCode;



@end
