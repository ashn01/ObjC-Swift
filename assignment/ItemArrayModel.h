//
//  ItemArrayModel.h
//  assignment1
//
//  Created by Youngmin-mac on 2018. 3. 1..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemModel.h"

@interface ItemArrayModel : NSObject

-(void) pushItem: (ItemModel*)object;
-(BOOL) sellItem : (NSInteger) index withQuantity:(int)quantity;
-(NSInteger) length;
-(ItemModel*) objectAt : (NSInteger) index;
@end
