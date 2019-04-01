#import <Foundation/Foundation.h>
#import "AssimilationInformation.h"

@implementation AssimilationInformation

- (id)init {
    return [self initWithAssim:@"14 August 2208 03:13:37"];
}

- (id)initWithAssim:(NSString *)assimilationDate{
    if (self = [super init]){
        _assimilationDate = assimilationDate;
    }
    return self;
}

- (void)setAssim:(NSString *)assimilationDate{
    [assimilationDate retain];
    [_assimilationDate release];
    _assimilationDate = assimilationDate;
}

- (NSString *)assimilationDate{
    return _assimilationDate;
}

+ (instancetype)getInfo:(NSString *)dateString {
    AssimilationInformation *info = [AssimilationInformation new];
    NSDateFormatter *borgFormatter = [[NSDateFormatter alloc] init];
    NSDateFormatter *humanFormatter = [[NSDateFormatter alloc] init];
    borgFormatter.dateFormat = @"yyyy:MM:dd@ss\\mm/HH";
    humanFormatter.dateFormat = @"dd MMMM yyyy HH:mm:ss";
    NSDate *startDate = [humanFormatter dateFromString:info.assimilationDate];
    NSDate *endDate = [borgFormatter dateFromString:dateString];
    [humanFormatter release];
    [borgFormatter release];
    NSCalendar *gregorian = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger unitFlags =  NSCalendarUnitYear |
                            NSCalendarUnitMonth |
                            NSCalendarUnitDay |
                            NSCalendarUnitHour |
                            NSCalendarUnitMinute |
                            NSCalendarUnitSecond;
    NSDateComponents *components = [gregorian components:unitFlags
                                                fromDate:endDate
                                                  toDate:startDate
                                                    options:0];
    info.years = components.year;
    info.months = components.month;
    info.days = components.day;
    info.hours = components.hour;
    info.minutes = components.minute;
    info.seconds = components.second;
    return info;
}

- (void)dealloc
{
    [_assimilationDate release];
    [super dealloc];
}

@end
