#import "Sorted.h"

@implementation ResultObject
@end

@implementation Sorted

// Complete the sorted function below.
- (ResultObject*)sorted:(NSString*)string {
    ResultObject *value = [ResultObject new];
    NSArray *array = [string componentsSeparatedByString:@" "];
    int startIndex = -1;
    int endIndex = -1;
    BOOL isSwap = NO;
    BOOL isReverse = NO;
    for (int i = 1; i < [array count]; i++) {
        if ([array[i-1] integerValue] > [array[i] integerValue]) {      //1) check that elements are sorted
            if (startIndex == -1) {                                     //2) if it's the first time then remember index
                if ([array count] == 2) {                               //*trivial
                    endIndex = i;
                }
                startIndex = i - 1;
                isSwap = YES;
            } else {                                                    //3) if it's the second time. We have two variants:
                if (endIndex == -1 && startIndex + 2 == i) {            //   a) this is first case of reverse
                    isReverse = YES;
                    isSwap = NO;
                }
                endIndex = i;                                           //   b) this is swap or Nth case of reverse
            }
        }
    }
    
    if ((isSwap || isReverse) && endIndex != -1 && startIndex != -1) {
        value.status = YES;
        if (isSwap) {
            value.detail = [NSString stringWithFormat:@"swap %d %d", startIndex + 1, endIndex + 1];
        } else {
            value.detail = [NSString stringWithFormat:@"reverse %d %d", startIndex + 1, endIndex + 1];
        }
    } else {
        value.status = NO;
    }
    return value;
}

@end
