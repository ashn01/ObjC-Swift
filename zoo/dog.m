//
//  dog.m
//  zoo
//
//  Created by Youngmin-mac on 2018. 1. 25..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import "dog.h"

@implementation dog
-(void)display
{
    NSLog(@"%@ name is %@, %d years old, and has %d eyes, and %d size long tail.",super.isMale ? @"His" : @"Her",super.name,super.age,super.eyes,_sizeOfTail);
}
@end
