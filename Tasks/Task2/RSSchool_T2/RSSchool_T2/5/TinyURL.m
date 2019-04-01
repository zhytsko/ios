#import "TinyURL.h"
#include <stdlib.h>

@interface TinyURL ()
@property (nonatomic, retain) NSMutableDictionary *database;
@end

@implementation TinyURL

- (instancetype)init {
    self = [super init];
    if (self) {
        self.database = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSURL *)encode:(NSURL *)originalURL{
    NSString *longURL = [originalURL absoluteString];
    NSMutableString *shortURL = [NSMutableString stringWithString:@"http://tinyurl.com/"];
    int key = arc4random() % 100;
    key = key > 0 ? key : -key;
    NSString *keys = [NSString stringWithFormat:@"%d", key];
    while (self.database[keys] != nil){
        key = arc4random() % 100;
        keys = [NSString stringWithFormat:@"%d", key];
    }
    [self database][keys] = longURL;
    NSData *data = [keys dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [data base64EncodedStringWithOptions:0];
    [shortURL appendString:base64String];
    return [NSURL URLWithString:shortURL];
}

- (NSURL *)decode:(NSURL *)shortenedURL{
    NSString *shortURL = [[shortenedURL absoluteString] substringFromIndex:19];
    NSData *data = [[NSData alloc] initWithBase64EncodedString:shortURL options:0];
    NSString *key = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSString *longURL = [self.database objectForKey:key];
    [data release];
    [key release];
    return [NSURL URLWithString:longURL];
}

- (void)dealloc {
    [_database release];
    [super dealloc];
}

@end
