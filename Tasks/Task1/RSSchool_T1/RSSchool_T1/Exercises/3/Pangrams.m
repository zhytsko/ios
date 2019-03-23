#import "Pangrams.h"

@implementation Pangrams

// Complete the pangrams function below.
- (BOOL)pangrams:(NSString *)string {
    const int alphabetLength = 26;
    NSString *lowercaseStringWithoutWhitespaces = [string stringByReplacingOccurrencesOfString:@" "  withString:@""].lowercaseString;
    unichar letter = 'a';
    for (int i = 0; i < alphabetLength; i++, letter++) {
        if (![lowercaseStringWithoutWhitespaces containsString:[NSString stringWithFormat:@"%c", letter]]){
            return NO;
        }
    }
    return YES;
}

@end
