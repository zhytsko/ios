#import <Foundation/Foundation.h>
#import "DoomsdayMachine.h"

@interface AssimilationInformation : NSObject<AssimilationInfo> {
    NSString *_assimilationDate;
}

@property (nonatomic, readwrite) NSInteger years;
@property (nonatomic, readwrite) NSInteger months;
@property (nonatomic, readwrite) NSInteger weeks;
@property (nonatomic, readwrite) NSInteger days;
@property (nonatomic, readwrite) NSInteger hours;
@property (nonatomic, readwrite) NSInteger minutes;
@property (nonatomic, readwrite) NSInteger seconds;

- (id)initWithAssim: (NSString *)assimilationDate;
- (void)setAssim: (NSString *)assimilationDate;
- (NSString *)assimilationDate;
+ (instancetype)getInfo: (NSString *)dateString;

@end
