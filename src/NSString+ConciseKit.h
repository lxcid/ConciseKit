#import <Foundation/Foundation.h>

@interface NSString (ConciseKit)

- (NSString *)$append:(NSString *)aString;
- (NSString *)$prepend:(NSString *)aString;
- (NSArray *)$split:(NSString *)aString;
- (BOOL)$isBlank;
- (NSInteger)$indexOf:(NSString *)theSubString from:(NSInteger)theFrom;
- (NSString *)$substringFrom:(NSInteger)theFrom to:(NSInteger)theTo;

@end

@interface NSMutableString (ConciseKit)

- (NSMutableString *)$append_:(NSString *)aString;
- (NSMutableString *)$prepend_:(NSString *)aString;
- (NSMutableString *)$insert:(NSString *)aString at:(NSUInteger)anIndex;
- (NSMutableString *)$set:(NSString *)aString;

@end