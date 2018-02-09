//
//  Calculator_Brain.h
//  Calculator
//
//  Created by Youngmin-mac on 2018. 2. 7..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator_Brain : NSObject
@property (nonatomic) NSMutableArray* items;

-(void)pushItem:(double) number;
-(double)calculate:(NSString*)operation;
@end
