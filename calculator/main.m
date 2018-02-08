//
//  main.m
//  Calculator
//
//  Created by Youngmin-mac on 2018. 2. 7..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator_Brain.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        Calculator_Brain* cal = [[Calculator_Brain alloc]init];
        double values[] = {3.0,12.7,-1.3,5.0,-3.06,2.2,7.3,2.5};
        NSArray* oper = [[NSArray alloc]initWithObjects:@"+",@"-",@"*",@"/",nil];
        for(int i=0;i<8;i++)
            [cal pushItem:values[i]];
        int i=6;
        for(NSString* op in oper)
        {
            NSLog(@"%f %@ %f = %f",values[i],op,values[i+1],[cal calculate:op]);
            i-=2;
        }
    }
    return 0;
}
