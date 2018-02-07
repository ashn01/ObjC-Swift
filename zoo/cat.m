//
//  cat.m
//  zoo
//
//  Created by Youngmin-mac on 2018. 1. 25..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import "cat.h"

@implementation cat
-(void)display
{
    NSLog(@"%@ name is %@, %d years old, and has %d eyes, and is able to jump up to %d meters.",super.isMale ? @"His" : @"Her",super.name,super.age,super.eyes,_jumpUpTo);
}
@end
