//
//  HistoryTableViewController.h
//  assignment1
//
//  Created by Youngmin-mac on 2018. 3. 6..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HistoryModel.h"
#import "HistoryDetailViewController.h"

@interface HistoryTableViewController : UITableViewController
@property (nonatomic,strong) NSMutableArray* historyArray;
@end
