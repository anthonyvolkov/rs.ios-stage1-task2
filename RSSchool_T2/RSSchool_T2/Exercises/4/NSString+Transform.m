#import "NSString+Transform.h"

@implementation NSString (Transform)

- (NSString*)transform {
    
    if (self.isPangram) {
        self = [self sortByCountOfVowels];
    } else {
        self = [self sortByCountOfConsonants];
    }
    
    return self;
}

- (BOOL)isPangram {
    
    NSMutableSet *set = [[NSMutableSet alloc] init];
    
    NSString *str = [self lowercaseString];
    
    for (int q = 0; q < self.length; q++) {
        if ([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[str characterAtIndex:q]]) {
            
            [set addObject:[NSString stringWithFormat:@"%c", [str characterAtIndex:q]]];
        } else if ([[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:[str characterAtIndex:q]]) {
            [set addObject:[NSString stringWithFormat:@"%c", [str characterAtIndex:q]]];
        }
    }
    
    if (set.count >= 26) {
        [set release];
        return true;
    } else {
        [set release];
        return false;
    }
}

- (NSString*)sortByCountOfVowels {
    
    NSMutableArray *arrayOfWords = [[self componentsSeparatedByString: @" "] mutableCopy];
    
    NSSet *lowerCaseVowels = [NSSet setWithObjects: @"a", @"e", @"i", @"o", @"u", @"y", nil];
    NSSet *upperCaseVowels = [NSSet setWithObjects: @"A", @"E", @"I", @"O", @"U", @"Y", nil];
    
    self = [self countLetters:arrayOfWords lowerCaseLetters:lowerCaseVowels upperCaseLetters:upperCaseVowels];
    
    [arrayOfWords release];
    return self;
}

- (NSString*)sortByCountOfConsonants {
    
    NSMutableArray *arrayOfWords = [[self componentsSeparatedByString: @" "] mutableCopy];
    
    for (int q = 0; q < arrayOfWords.count; q++) {
        if (arrayOfWords[q] == nil) {
            [arrayOfWords removeObjectAtIndex:q];
        }
    }
    
    NSSet *lowerCaseConsonants = [NSSet setWithObjects: @"b", @"c", @"d", @"f", @"g", @"h", @"j", @"k", @"l",
                                  @"m", @"n", @"p", @"q", @"r", @"s", @"t", @"v", @"w", @"x", @"z", nil];
    NSSet *upperCaseConsonants = [NSSet setWithObjects: @"B", @"C", @"D", @"F", @"G", @"H", @"J", @"K", @"L",
                                  @"M", @"N", @"P", @"Q", @"R", @"S", @"T", @"V", @"W", @"X", @"Z", nil];
    
    self = [self countLetters:arrayOfWords lowerCaseLetters:lowerCaseConsonants upperCaseLetters:upperCaseConsonants];
    
    [arrayOfWords release];
    return self;
    
    return self;
}

- (NSString *)countLetters:(NSMutableArray *)arrayOfWords lowerCaseLetters:(NSSet *)lowerCaseLetters upperCaseLetters:(NSSet *)upperCaseLetters {
    for (int q = 0; q < arrayOfWords.count; q++) {
        int count = 0;
        for (int w = 0; w < [(NSString *)arrayOfWords[q] length]; w++) {
            if ([lowerCaseLetters containsObject:[(NSString *)arrayOfWords[q] substringWithRange:NSMakeRange(w, 1)]]) {
                
                NSString *capitalizedLetter = [[(NSString *)arrayOfWords[q] substringWithRange:NSMakeRange(w, 1)] uppercaseString];
                
                NSMutableString *str = [NSMutableString stringWithString:(NSString *)arrayOfWords[q]];
                [str deleteCharactersInRange:NSMakeRange(w, 1)];
                [str insertString:capitalizedLetter atIndex:w];
                
                arrayOfWords[q] = str;
                
                count++;
            } else if ([upperCaseLetters containsObject:[(NSString *)arrayOfWords[q] substringWithRange:NSMakeRange(w, 1)]]) {
                
                count++;
            }
        }
        if (![(NSString *)arrayOfWords[q] isEqualToString: @""]) {
            NSString *str = [NSString stringWithFormat:@"%d%@", count, arrayOfWords[q]];
            arrayOfWords[q] = str;
        }
    }
    
    [self bubbleSort:arrayOfWords];
    
    NSMutableString *str = [NSMutableString stringWithString:@""];
    
    for (int q = 0; q < arrayOfWords.count; q++) {
        if (![(NSString *)arrayOfWords[q] isEqualToString: @""]) {
            if (str.length == 0) {
                [str appendFormat:@"%@", arrayOfWords[q]];
            } else {
                [str appendFormat:@" %@", arrayOfWords[q]];
            }
        }
    }
    
    return str;
}

- (NSArray *)bubbleSort:(NSMutableArray *)sortedArray
{
    long count = sortedArray.count;
    
    bool swapped = YES;
    
    while (swapped) {
        swapped = NO;
        
        for (int q = 1; q < count; q++) {
            int w = [sortedArray[q - 1] intValue];
            int e = [sortedArray[q] intValue];
            if (w > e) {
                [sortedArray exchangeObjectAtIndex:(q-1) withObjectAtIndex:q];
                swapped = YES;
            }
        }
    }
    return sortedArray;
}

@end
