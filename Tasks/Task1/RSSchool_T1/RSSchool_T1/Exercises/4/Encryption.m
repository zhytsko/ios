#import "Encryption.h"

@implementation Encryption

// Complete the encryption function below.
- (NSString *)encryption:(NSString *)string {
    NSString *stringWithoutWhitespaces = [string stringByReplacingOccurrencesOfString:@" "  withString:@""];
    double stringLength = [stringWithoutWhitespaces length];
    int rows = floor(sqrt(stringLength));
    int columns = ceil(sqrt(stringLength));
    if (rows * columns < stringLength) {
        rows < columns ? rows++ : columns++;
    }
    NSMutableString *result = [NSMutableString stringWithString:@""];
    for (int i = 0; i < columns; i++) {
        for (int j = i; j < stringLength; j+=columns) {
            NSString *letter = [NSString stringWithFormat:@"%c",[stringWithoutWhitespaces characterAtIndex: j]];
            [result appendString: letter];
        }
        if (i < columns - 1) {
            [result appendString:@" "];
        }
    }
    return result;
}

@end
