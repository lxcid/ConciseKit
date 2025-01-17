#import "NSArray+ConciseKit.h"
#import "CKMacros.h"

@implementation NSArray (ConciseKit)

- (id)$first {
  return [self objectAtIndex:0];
}

- (id)$last {
  return [self lastObject];
}

- (id)$at:(NSUInteger)index {
  return [self objectAtIndex:index];
}

- (NSArray *)$each:(void (^)(id obj))block {
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    block(obj);
  }];
  return self;
}

- (NSArray *)$eachWithIndex:(void (^)(id obj, NSUInteger idx))block {
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    block(obj, idx);
  }];
  return self;
}

- (NSArray *)$eachWithStop:(void (^)(id obj, BOOL *stop))block {
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    block(obj, stop);
  }];
  return self;
}

- (NSArray *)$eachWithIndexAndStop:(void (^)(id obj, NSUInteger idx, BOOL *stop))block {
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    block(obj, idx, stop);
  }];
  return self;
}

- (NSArray *)$map:(id (^)(id obj))block {
  __block NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [array addObject:block(obj)];
  }];
  return array;
}

- (NSArray *)$mapWithIndex:(id (^)(id obj, NSUInteger idx))block {
  __block NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [array addObject:block(obj, idx)];
  }];
  return array;
}


- (id)$safeFirst {
  return $safe([self objectAtIndex:0]);
}

- (id)$safeLast {
  return $safe([self lastObject]);
}

- (id)$safeAt:(NSUInteger)index {
  return $safe([self objectAtIndex:index]);
}

@end

@implementation NSMutableArray (ConciseKit)

- (NSMutableArray *)$push:(id)anObject {
  [self addObject:anObject];
  return self;
}

@end