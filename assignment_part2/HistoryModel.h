//
//  HistoryModel.h
//  assignment1
//
//  Created by Youngmin-mac on 2018. 3. 6..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HistoryModel : NSObject
@property (nonatomic,strong) NSString* name;
@property (nonatomic,strong) NSNumber* price;
@property (nonatomic,strong) NSNumber* quantity;
@property (nonatomic,strong) NSDate* date;
-(instancetype) initWithName :(NSString*) name andWithPrice : (NSNumber*) price andWithQuantity : (NSNumber*)quantity;
-(NSString*) displayDetail;
@end
