#import "KidnapperNote.h"

@implementation KidnapperNote
-(BOOL)checkMagazine:(NSString *)magazine note:(NSString *)note {
    NSArray *magazineArr = [[magazine lowercaseString] componentsSeparatedByString:@" "];
    NSArray *noteArr = [[note lowercaseString] componentsSeparatedByString:@" "];
    NSMutableDictionary *magazineDic = [NSMutableDictionary dictionaryWithCapacity:1];
    for (NSString *word in magazineArr){
        if (magazineDic[word] != nil){
            magazineDic[word] = @([magazineDic[word] integerValue] + 1);
        } else {
            [magazineDic setObject:@1 forKey:word];
        }
    }
    for (NSString *word in noteArr) {
        if ([magazineDic[word] integerValue] == 0) {
            return NO;
        }
        magazineDic[word] = @([magazineDic[word] integerValue] - 1);
    }
    return YES;
}
@end
