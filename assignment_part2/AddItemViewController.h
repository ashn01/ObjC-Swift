//
//  AddItemViewController.h
//  assignment1
//
//  Created by Youngmin-mac on 2018. 3. 9..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemModel.h"

@protocol AddItemDelegate
@required
-(void) addItem :(ItemModel*) i;

@end

@interface AddItemViewController : UIViewController
@property (nonatomic,strong) id<AddItemDelegate> addDelegate;
@end
