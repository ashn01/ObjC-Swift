//
//  ManagerViewController.h
//  assignment1
//
//  Created by Youngmin-mac on 2018. 3. 6..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HistoryModel.h"
#import "HistoryTableViewController.h"
#import "RestockViewController.h"
#import "ItemArrayModel.h"
#import "ItemModel.h"
#import "AddItemViewController.h"

@interface ManagerViewController : UIViewController
@property (nonatomic, strong) NSMutableArray* history;
@property (nonatomic,strong) ItemArrayModel* itemArray;
@property (nonatomic, strong) id passDelegate;
@end
