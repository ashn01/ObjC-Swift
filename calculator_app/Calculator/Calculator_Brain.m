//
//  Calculator_Brain.m
//  Calculator
//
//  Created by Youngmin-mac on 2018. 2. 7..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import "Calculator_Brain.h"

@implementation Calculator_Brain
-(NSMutableArray*)items
{
    if(_items == nil)
        _items = [[NSMutableArray alloc]init];
    return _items;
}
-(void)pushItem:(double)number
{
    [self.items addObject:[NSNumber numberWithDouble:number]];
}

-(double)calculate:(NSString *)operation
{
    double first = [self popItem];
    double second = [self popItem];
    if([operation isEqualToString:@"+"])
    {
        second += first;
    }
    else if([operation isEqualToString:@"-"])
    {
        second -= first;
    }
    else if([operation isEqualToString:@"*"])
    {
        second *= first;
    }
    else if([operation isEqualToString:@"/"] && first != 0 && second != 0)
    {
        second /= first;
    }
    else
        second = 0;
    return second;
}

-(double)popItem
{
    double ret = [[self.items lastObject] doubleValue];
    [self.items removeLastObject];
    return ret;
}

@end
