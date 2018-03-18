//
//  RestockViewController.m
//  assignment1
//
//  Created by Youngmin-mac on 2018. 3. 6..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import "RestockViewController.h"

@interface RestockViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UINavigationItem *Title;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITableView *restockTableView;


@end

@implementation RestockViewController
- (IBAction)CancelPressed:(UIButton *)sender
{
    self.amountTextField.text = @"";
}
- (IBAction)OKPressed:(UIButton *)sender
{
    if([[[self.itemArray objectAt:[[self.restockTableView indexPathForSelectedRow] row]] quantity] intValue] + [self.amountTextField.text intValue] < 0 ) // if quantity goes negative amount
    {
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Transaction has been cancelled."
                                     message:@"Quantity cannot be lower than 0."
                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okButton = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
                                       //Handle your yes please button action here
                                   }];
        [alert addAction:okButton];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        [[self.itemArray objectAt:[[self.restockTableView indexPathForSelectedRow] row]] update: [NSNumber numberWithInt:[self.amountTextField.text intValue]]];
//        [self.delegate updateItem:self.itemArray];
//        self.amountTextField.text = @"";
        [self.restockTableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.itemArray length];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.amountTextField.text = [NSString stringWithFormat:@"%@",[[self.itemArray objectAt:indexPath.row] quantity]];
    self.Title.title = [NSString stringWithFormat:@"%@",[[self.itemArray objectAt:indexPath.row] name]];
}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"restockCell" forIndexPath:indexPath];
    if(!cell)
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"restockCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@ price:%.2lf",[[self.itemArray objectAt:indexPath.row] name],[[self.itemArray objectAt:indexPath.row] quantity],[[[self.itemArray objectAt:indexPath.row] price] doubleValue]];
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor yellowColor];
    [cell setSelectedBackgroundView:bgColorView];
    
    return cell;
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
