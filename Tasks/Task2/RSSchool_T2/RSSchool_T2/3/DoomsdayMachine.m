#import "DoomsdayMachine.h"
#import "AssimilationInformation.h"

@implementation DoomsdayMachine
- (id<AssimilationInfo>)assimilationInfoForCurrentDateString:(NSString *)dateString {
    return [AssimilationInformation getInfo:dateString];
}

- (NSString *)doomsdayString {
    AssimilationInformation *assimilationInfo = [[AssimilationInformation alloc] init];
    NSDateFormatter* humanFormatter = [[NSDateFormatter alloc] init];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    humanFormatter.dateFormat = @"dd MMMM yyyy HH:mm:ss";
    formatter.dateFormat = @"EEEE, MMMM dd, yyyy";
    NSDate *assimilationDate = [humanFormatter dateFromString:assimilationInfo.assimilationDate];
    NSString *assimilationString = [formatter stringFromDate:assimilationDate];
    [humanFormatter release];
    [formatter release];
    [assimilationInfo release];
    return assimilationString;
}
@end
