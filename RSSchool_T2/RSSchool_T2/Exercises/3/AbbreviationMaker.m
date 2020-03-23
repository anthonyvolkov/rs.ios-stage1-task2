#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    
    NSString *aUpperCase = [a uppercaseString];
    
    bool result = false;
    
    int w = 0;
    
    for (int q = 0; q < b.length; q++) {
        result = false;
        while (w < a.length) {
            if ([b characterAtIndex:q] == [aUpperCase characterAtIndex:w]) {
                result = true;
                w++;
                break;
            } else {
                w++;
                result = false;
            }
        }
    }
    
    return result ? @"YES" : @"NO";
}
@end
