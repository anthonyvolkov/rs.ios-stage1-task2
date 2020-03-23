#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    
    NSInteger result = 0;
    NSInteger fib1 = 1;
    NSInteger fib2 = 2;
    
    while (result < [number intValue]) {
        NSInteger temp = fib1;
        fib1 = fib2;
        fib2 = fib1 + temp;
        
        result = fib1 * fib2;
    }
    
    return result == [number intValue] ? @[[NSNumber numberWithInteger:fib1], [NSNumber numberWithInteger:fib2], @1]
                                        : @[[NSNumber numberWithInteger:fib1], [NSNumber numberWithInteger:fib2], @0];
}

@end
