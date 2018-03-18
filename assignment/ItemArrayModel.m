//
//  ItemArrayModel.m
//  assignment1
//
//  Created by Youngmin-mac on 2018. 3. 1..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import "ItemArrayModel.h"


@interface ItemArrayModel()
@property (strong,nonatomic) NSMutableArray* itemArray;
@end

@implementation ItemArrayModel
-(NSMutableArray*) itemArray
{
    if(!_itemArray)
        _itemArray = [[NSMutableArray alloc]init];
    return _itemArray;
}

-(void)pushItem:(ItemModel*)object
{
    [self.itemArray addObject:object];
}
-(BOOL)sellItem:(NSInteger)index withQuantity:(int)quantity
{
    ItemModel* i = [self.itemArray objectAtIndex:index];
    if([i.quantity intValue] >= quantity)
    {
        i.quantity = [NSNumber numberWithDouble:[i.quantity doubleValue]-quantity];
        return YES;
    }
    return NO;
}
-(NSInteger)length
{
    return self.itemArray.count;
}
-(ItemModel*) objectAt:(NSInteger)index
{
    return [self.itemArray objectAtIndex:index];
}
@end
