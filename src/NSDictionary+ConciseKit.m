#import "NSDictionary+ConciseKit.h"
#import "CKMacros.h"

@implementation NSDictionary (ConciseKit)

- (id)$for:(id)aKey {
  return [self objectForKey:aKey];
}

- (id)$safeFor:(id)aKey {
  return $safe([self objectForKey:aKey]);
}

@end

@implementation NSMutableDictionary (ConciseKit)

- (NSMutableDictionary *)$obj:(id)anObject for:(id)aKey {
  [self setObject:anObject forKey:aKey];
  return self;
}

@end
