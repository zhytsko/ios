#import "RomanTranslator.h"

@implementation RomanTranslator
- (NSString *)romanFromArabic:(NSString *)arabicString{
    NSMutableString *result = [[NSMutableString alloc]init];
    NSDictionary *translator = @{
                                 @1 : @"I",
                                 @4 : @"IV",
                                 @5 : @"V",
                                 @9 : @"IX",
                                 @10 : @"X",
                                 @40 : @"XL",
                                 @50 : @"L",
                                 @90 : @"XC",
                                 @100 : @"C",
                                 @400 : @"CD",
                                 @500 : @"D",
                                 @900 : @"CM",
                                 @1000 : @"M"
                                 };
    NSArray *index = @[@1000, @900, @500, @400, @100, @90, @50, @40, @10, @9, @5, @4, @1];
    int arabic = [arabicString intValue];
    for (int i = 0; arabic > 0; i++) {
        while (arabic >= [index[i] intValue]){
            [result appendString: translator[index[i]]];
            arabic -= [index[i] intValue];
        }
    }
    return result;
}

- (NSString *)arabicFromRoman:(NSString *)romanString{
    int result = 0;
    NSDictionary *translator = @{
                                 @"I"  : @1,
                                 @"IV" : @4,
                                 @"V"  : @5,
                                 @"IX" : @9,
                                 @"X"  : @10,
                                 @"XL" : @40,
                                 @"L"  : @50,
                                 @"XC" : @90,
                                 @"C"  : @100,
                                 @"CD" : @400,
                                 @"D"  : @500,
                                 @"CM" : @900,
                                 @"M"  : @1000
                                 };
    for (int i = 0; i < [romanString length] - 1; i++) {
        NSString *word = [romanString substringWithRange: NSMakeRange(i, 2)];
        if (translator[word] != nil) {
            result += [translator[word] intValue];
            i++;
        } else {
            result += [translator[[romanString substringWithRange:NSMakeRange(i, 1)]] intValue];
            if (i + 2 == [romanString length]) {
                result += [translator[[romanString substringFromIndex: i + 1]] intValue];
            }
        }
    }
    return [NSString stringWithFormat:@"%d", result];
}
@end
