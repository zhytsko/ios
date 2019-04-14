#import "FullBinaryTrees.h"

NSMutableArray *makeBracketSequences(int count){
    NSMutableArray *bracketSequences = [[NSMutableArray alloc] init];
    __block void (^myBlock)(int, int,int, NSString*) = [^void (int n,
                                                               int counterOpen,
                                                               int counterClose,
                                                               NSString *ans){
        if (counterOpen + counterClose == 2 * n) {
            [bracketSequences addObject:ans];
        }
        if (counterOpen < n) {
            myBlock(n, counterOpen + 1, counterClose, [NSString stringWithFormat: @"%@(", ans]);
        }
        if (counterOpen > counterClose) {
            myBlock(n, counterOpen, counterClose + 1, [NSString stringWithFormat: @"%@)", ans]);
        }
    } copy];
    myBlock((count - 1) / 2, 0, 0, @"");
    [bracketSequences autorelease];
    return bracketSequences;
}

@implementation FullBinaryTrees
- (NSString *)stringForNodeCount:(NSInteger)count{
    if (count % 2 == 0) {
        return @"[]";
    }
    if (count == 1) {
        return @"[[0]]";
    }
    NSArray *bracketSequences = makeBracketSequences((int)count);
    NSMutableString *result = [NSMutableString string];
    [result appendString: @"["];
    for (NSString* string in bracketSequences) {
        int vertex = 0;
        NSMutableArray *graphs = [[NSMutableArray alloc] init];
        graphs[0] = @"0";
        
        for (int i = 1; i < [string length]; i++) {
            graphs[i] = @"null";
        }
        
        for (int i = 0; i < [string length]; i++) {
            if ([string characterAtIndex:i] == '(') {
                if (2 * vertex + 2 >= [graphs count]) {
                    for (int j = (int)[graphs count]; j < 2 * vertex + 2; j++) {
                        graphs[j] = @"null";
                    }
                }
                graphs[2 * vertex + 1] = graphs[2 * vertex + 2] = @"0";
                vertex = 2 * vertex + 1;
            } else {
                if ([string characterAtIndex:i - 1] == ')') {
                    vertex = (vertex - 2) / 2;
                    while (vertex % 2 == 0) {
                        vertex = (vertex - 2) / 2;
                    }
                }
                graphs[vertex + 1] = @"0";
                vertex++;
            }
        }
        
        NSMutableArray *copyArray = [NSMutableArray arrayWithArray:graphs];
        
        for (int i = 0; i < ([graphs count] - 2) / 2; i++) {
            if ([graphs[i] isEqualToString: @"null"]) {
                copyArray[2 * i + 1] = copyArray[2 * i + 2] = @"delete";
            }
        }
        [copyArray removeObject: @"delete"];
        [result appendString: @"["];
        
        for (NSString *s in copyArray) {
            [result appendFormat: @"%@,", s];
        }
        
        [result appendString: @"],"];
        [graphs release];
    }
    [result appendString: @"]"];
    [result replaceOccurrencesOfString: @",]" withString: @"]" options:0 range: NSMakeRange(0, [result length])];
    return result;
}
@end

