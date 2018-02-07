//
//  animal.h
//  zoo
//
//  Created by Youngmin-mac on 2018. 1. 25..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface animal : NSObject
@property int eyes;
@property int age;
@property (nonatomic, strong) NSString* name;
@property BOOL isMale;
-(void)display;
@end
