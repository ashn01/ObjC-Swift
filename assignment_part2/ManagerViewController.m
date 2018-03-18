//
//  ManagerViewController.m
//  assignment1
//
//  Created by Youngmin-mac on 2018. 3. 6..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import "ManagerViewController.h"

@interface ManagerViewController () 

@end

@implementation ManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"historySegue"])
    {
        HistoryTableViewController* hvc = (HistoryTableViewController*)segue.destinationViewController;
        hvc.historyArray = self.history;
    }
    else if([segue.identifier isEqualToString:@"restockSegue"])
    {
        RestockViewController* rvc = (RestockViewController*) segue.destinationViewController;
        rvc.itemArray = self.itemArray;
    }
    else if([segue.identifier isEqualToString:@"addSegue"])
    {
        AddItemViewController* aivc = (AddItemViewController*)segue.destinationViewController;
        aivc.addDelegate = self.passDelegate;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
