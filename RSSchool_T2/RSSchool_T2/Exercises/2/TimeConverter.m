#import "TimeConverter.h"

typedef NS_ENUM(NSUInteger, MyEnum) {
    MyEnumValueA = 0,
    MyEnumValueB = 5,
    MyEnumValueC = 10,
};

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    
    NSMutableString *convertedTime = [[NSMutableString alloc] init];

    NSArray *numberToWord = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten",
                              @"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen", @"eighteen",
                              @"nineteen", @"twenty", @"twenty one", @"twenty two", @"twenty three", @"twenty four", @"twenty five",
                              @"twenty six", @"twenty seven", @"twenty eight", @"twenty nine"];

    NSInteger intHours = [hours integerValue];
    NSInteger intMinutes = [minutes integerValue];
    
    if (intHours > 24 || intMinutes > 60) {
        [convertedTime appendFormat:@""];
    } else if (intMinutes == 0) {
        [convertedTime appendFormat:@"%@ o' clock", numberToWord[intHours]];
    } else if (intMinutes == 1) {
        [convertedTime appendFormat:@"one minute past %@", numberToWord[intHours]];
    } else if (intMinutes == 59) {
        [convertedTime appendFormat:@"one minute to %@", numberToWord[intHours % 24 + 1]];
    } else if (intMinutes == 15) {
        [convertedTime appendFormat:@"quarter past %@", numberToWord[intHours]];
    } else if (intMinutes == 30) {
        [convertedTime appendFormat:@"half past %@", numberToWord[intHours]];
    } else if (intMinutes == 45) {
        [convertedTime appendFormat:@"quarter to %@", numberToWord[intHours % 24 + 1]];
    } else if (intMinutes < 30) {
        [convertedTime appendFormat:@"%@ minutes past %@", numberToWord[intMinutes], numberToWord[intHours]];
    } else if (intMinutes > 30) {
        [convertedTime appendFormat:@"%@ minutes to %@", numberToWord[60 - intMinutes], numberToWord[intHours % 24 + 1]];
    }
    
    return [convertedTime autorelease];
}
@end
