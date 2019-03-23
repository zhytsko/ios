#import "Diagonal.h"

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
    int sum = 0;
    NSUInteger matrixSize = [array count];
    NSMutableArray *matrix = [NSMutableArray arrayWithCapacity: matrixSize];
    for (NSString *row in array){
        [matrix addObject: [row componentsSeparatedByString:@" "]];
    }
    for (int i = 0; i < matrixSize; i++){
        sum += [(NSNumber *)matrix[i][i] intValue];
        sum -= [(NSNumber *)matrix[matrixSize - i - 1][i] intValue];
    }
    return sum > 0 ? @(sum) : @(-sum);
}

@end
