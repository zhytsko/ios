#import "SummArray.h"

@implementation SummArray

// Complete the summArray function below.
- (NSNumber *)summArray:(NSArray *)array {
    int sum = 0;
    for (NSNumber* i in array) {
        sum += [i intValue];
    }
    return @(sum);
}

@end
