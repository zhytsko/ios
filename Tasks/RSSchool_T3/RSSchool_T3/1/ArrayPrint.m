#import "ArrayPrint.h"

int check(id object) {
    if ([object isKindOfClass:[NSNumber class]]){
        return 0;
    } else if ([object isKindOfClass:[NSNull class]]) {
        return 1;
    } else if ([object isKindOfClass:[NSArray class]]) {
        return 2;
    } else if ([object isKindOfClass:[NSString class]]) {
        return 3;
    }
    return -1;
}

NSString *objToString(id object) {
    NSMutableString *result = [[NSMutableString alloc] init];
    switch (check(object)) {
        case 0:
            [result appendFormat:@"%@,", object];
            break;
        case 1:
            [result appendString: @"null,"];
            break;
        case 2:
            [result appendString:@"["];
            for (id obj in object) {
                [result appendString: objToString(obj)];
            }
            [result appendString:@"],"];
            break;
        case 3:
            [result appendFormat:@"\"%@\",", object];
            break;
        default:
            [result appendString:@"unsupported,"];
            break;
    }
    [result autorelease];
    return result;
}

@implementation NSArray (RSSchool_Extension_Name)
- (NSString *)print{
    NSMutableString *result = [[NSMutableString alloc] init];
    [result appendString:@"["];
    NSArray *array = self;
    for (int i = 0; i < [array count]; i++) {
        [result appendString: objToString(array[i])];
    }
    [result appendString:@"]"];
    [result replaceOccurrencesOfString:@",]" withString:@"]" options:0 range: NSMakeRange(0, [result length])];
    [result autorelease];
    return result;
}

@end
