#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    
    NSMutableString *dateString = [NSMutableString stringWithFormat:@"%@ %@ %@", day, month, year];
    
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    
    dateFormatter.dateFormat = @"d MM yyyy";
    NSDate *date = [dateFormatter dateFromString:dateString];
    
    dateFormatter.dateFormat = @"d MMMM, EEEE";
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier: @"ru"];
    
    return [dateFormatter stringFromDate:date] ? [dateFormatter stringFromDate:date] : @"Такого дня не существует";
}

@end
