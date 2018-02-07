//
//  main.m
//  zoo
//
//  Created by Youngmin-mac on 2018. 1. 25..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "fish.h"
#import "animal.h"
#import "cat.h"
#import "dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        animal* a[6];
        NSString* name[] = {@"Nemo", @"Dory", @"Duchess", @"Berlioz",@"Tramp", @"Lady" };
        for(int i=0;i<6;i++)
        {
            if(i < 2)
            {
                a[i] = [[fish alloc]init];
                ((fish*)a[i]).fin = i+1;
            }else if(i < 4)
            {
                a[i] = [[cat alloc]init];
                ((cat*)a[i]).jumpUpTo = i;
            }else
            {
                a[i] = [[dog alloc]init];
                ((dog*)a[i]).sizeOfTail = i;
            }
            a[i].name = [NSString stringWithFormat:@"%@",name[i]];
            a[i].age = i+1;
            a[i].isMale = i%2 ? NO:YES;
            a[i].eyes = 2;
        }
        for(int i=0;i<6;i++)
        {
            [a[i] display]; // call function
        }
    }
    
    /*fish * f = [[fish alloc]init];
    f.name = @"fishy";
    NSLog(@"%@",f.name);
    
    fish * f2 = [fish alloc];
    f2.name = @"abc";
    NSLog(@"%@",f2.name);
    
    fish * f3 = [f3 init];
    f3.name = @"efg";
    NSLog(@"%@",f3.name);*/
    
    
    return 0;
}
