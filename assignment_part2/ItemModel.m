//
//  ItemModel.m
//  assignment1
//
//  Created by Youngmin-mac on 2018. 3. 1..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import "ItemModel.h"
@interface ItemModel()
@end

@implementation ItemModel

@synthesize name = _name;
@synthesize quantity = _quantity;
@synthesize price = _price;

-(NSString*)name
{
    if(!_name)
        _name = [[NSString alloc]init];
    return _name;
}
-(NSNumber*)quantity
{
    if(!_quantity)
        _quantity = [[NSNumber alloc]init];
    return _quantity;
}
-(NSNumber*)price
{
    if(!_price)
        _price = [[NSNumber alloc]init];
    return _price;
}

-(instancetype) initwithData:(NSString *)name withQuantity:(NSNumber *)quantity withPrice:(NSNumber *)price
{
    if(self)
    {
        self.name = name;
        self.quantity = quantity;
        self.price = price;
    }
    return self;
}
-(void) update:(NSNumber*)quantity
{
    self.quantity = [NSNumber numberWithFloat: [self.quantity floatValue]+ [quantity floatValue]];
}
-(NSString*)itemDetail
{
    return [NSString stringWithFormat :@"%@ %@ %.2lf",self.name, self.quantity, [self.price doubleValue]];
}
@end
