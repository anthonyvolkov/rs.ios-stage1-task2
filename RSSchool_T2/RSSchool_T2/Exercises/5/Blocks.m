#import "Blocks.h"

@implementation Blocks

NSArray *inputArray;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.blockA = blockA;
    }
    return self;
}

BlockA blockA = ^(NSArray *array){
    inputArray = array;
};

- (BlockB)blockB {
    
    __block Blocks *weakSelf = self;
    
    BlockB blockB = [^(Class classType){
        
        [weakSelf retain];
        
        if ([classType isEqual:[NSString class]]){
            
            NSMutableString *result = [NSMutableString stringWithString:@""];
            
            for (NSObject *obj in inputArray) {
                if([obj isKindOfClass:[NSString class]]) {
                    [result appendString:(NSString *)obj];
                }
            }
            
            self.blockC(result);
            
        }else if ([classType isEqual:[NSNumber class]]) {
            
            int result = 0;
            
            for(NSObject *obj in inputArray) {
                if([obj isKindOfClass:[NSNumber class]]){
                    result += [(NSNumber *)obj intValue];
                }
            }
            
            self.blockC([NSNumber numberWithInt:result]);
            
        }else if ([classType isEqual:[NSDate class]]) {
            
            NSDate *result = [NSDate dateWithTimeIntervalSince1970:0];
            
            for (NSObject *obj in inputArray) {
                if ([obj isKindOfClass:[NSDate class]]) {
                    result = [result laterDate:(NSDate *) obj];
                }
            }
            
            NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
            dateFormatter.dateFormat = @"dd.MM.yyy";
            
            self.blockC([dateFormatter stringFromDate:result]);
        }
        
        [weakSelf release];
    
    } copy];
    
    return [blockB autorelease];
}

- (void)dealloc
{
    [_blockA release];
    [_blockB release];
    [_blockC release];
    
    [super dealloc];
}

@end

