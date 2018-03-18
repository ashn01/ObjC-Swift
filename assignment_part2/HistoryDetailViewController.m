//
//  HistoryDetailViewController.m
//  assignment1
//
//  Created by Youngmin-mac on 2018. 3. 6..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import "HistoryDetailViewController.h"

@interface HistoryDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ItemName;
@property (weak, nonatomic) IBOutlet UILabel *ItemQuantity;
@property (weak, nonatomic) IBOutlet UILabel *ItemTotal;
@property (weak, nonatomic) IBOutlet UILabel *PurchasedDate;

@end

@implementation HistoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ItemName.text = [self.historyItem name];
    self.ItemQuantity.text = [NSString stringWithFormat:@"%@",[self.historyItem quantity]];
    self.ItemTotal.text = [NSString stringWithFormat:@"%.2f",[[self.historyItem price] doubleValue]*[[self.historyItem quantity] doubleValue]];
    self.PurchasedDate.text = [NSString stringWithFormat:@"%@",[self.historyItem date]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
