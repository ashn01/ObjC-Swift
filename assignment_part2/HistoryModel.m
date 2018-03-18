//
//  HistoryModel.m
//  assignment1
//
//  Created by Youngmin-mac on 2018. 3. 6..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import "HistoryModel.h"

@implementation HistoryModel
@synthesize name = _name;
@synthesize price = _price;
@synthesize quantity = _quantity;
@synthesize date = _date;

-(NSString*) name
{
    if(!_name)
        _name = [[NSString alloc]init];
    return _name;
}
-(NSNumber*) price
{
    if(!_price)
        _price = [[NSNumber alloc]init];
    return _price;
}
-(NSNumber*)quantity
{
    if(!_quantity)
        _quantity = [[NSNumber alloc]init];
    return _quantity;
}
-(NSDate*) date
{
    if(!_date)
        _date = [[NSDate alloc]init];
    return _date;
}

-(instancetype) initWithName :(NSString*) name andWithPrice : (NSNumber*) price andWithQuantity : (NSNumber*)quantity
{
    if(self)
    {
        self.name = name;
        self.price = price;
        self.quantity = quantity;
        self.date = [NSDate date];
    }
    
    return self;
}

-(NSString*) displayDetail
{
    return [NSString stringWithFormat:@"%@ %@ %@ %@",self.name, self.price, self.quantity, self.date];
}

@end
