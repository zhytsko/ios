#import "MatrixHacker.h"
@interface MatrixHacker()

@property (nonatomic, strong) id<Character>(^injectedBlock)(NSString* name);

@end

@implementation MatrixHacker

- (void)injectCode:(id<Character> (^)(NSString *name))theBlock {
    self.injectedBlock = theBlock;
}

- (NSArray<id<Character>> *)runCodeWithData:(NSArray<NSString *> *)names {
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *name in names) {
        [array addObject:self.injectedBlock(name)];
    }
    return array;
}

- (void)dealloc {
    [_injectedBlock release];
    [super dealloc];
}

@end
