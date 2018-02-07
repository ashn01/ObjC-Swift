//
//  fish.m
//  zoo
//
//  Created by Youngmin-mac on 2018. 1. 25..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import "fish.h"

@implementation fish
-(void)display
{
    NSLog(@"%@ name is %@, %d years old, and has %d eyes, and has %d size long fin.",super.isMale ? @"His" : @"Her",super.name,super.age,super.eyes,_fin);
}
@end
