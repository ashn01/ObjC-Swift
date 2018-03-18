//
//  ItemModel.h
//  assignment1
//
//  Created by Youngmin-mac on 2018. 3. 1..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemModel : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSNumber* quantity;
@property (strong, nonatomic) NSNumber* price;

-(instancetype)initwithData : (NSString*) name withQuantity : (NSNumber*) quantity withPrice : (NSNumber*) price;
-(void) update:(NSNumber*)quantity;
-(NSString*) itemDetail;
@end
