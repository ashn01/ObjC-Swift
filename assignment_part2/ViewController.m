//
//  ViewController.m
//  assignment1
//
//  Created by Youngmin-mac on 2018. 3. 1..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate, AddItemDelegate>

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *itemPickerView;
@property (strong, nonatomic) ItemArrayModel* itemArray;
@property (strong, nonatomic) NSMutableArray* historyArray;

@end

@implementation ViewController

-(ItemArrayModel*)itemArray
{
    if(!_itemArray)
        _itemArray = [[ItemArrayModel alloc]init];
    return _itemArray;
}
-(NSMutableArray*)historyArray
{
    if(!_historyArray)
        _historyArray = [[NSMutableArray alloc] init];
    return _historyArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // data initialized
    NSArray* nameArr = [NSArray arrayWithObjects:@"shoes",@"pants",@"shirt",@"dress",@"T-shirt",@"suites", nil];
    NSArray* quanArr = [NSArray arrayWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:5],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:6],[NSNumber numberWithInt:7], nil];
    NSArray* pricArr = [NSArray arrayWithObjects:[NSNumber numberWithDouble:300.99],[NSNumber numberWithDouble:109.99],[NSNumber numberWithDouble:99.99],[NSNumber numberWithDouble:499.99],[NSNumber numberWithDouble:9.99],[NSNumber numberWithDouble:2099.99], nil];
    
    for(int i=0; i< [nameArr count]; i++)
    {
        ItemModel* tempItem = [[ItemModel alloc] initwithData:[nameArr objectAtIndex:i] withQuantity:[quanArr objectAtIndex:i] withPrice:[pricArr objectAtIndex:i]];
        [self.itemArray pushItem:tempItem];
        NSLog(@"%@",[tempItem name]);
    }
    self.nameLabel.text = [[self.itemArray objectAt:0] name];
    
}
- (IBAction)clearPressed:(UIButton *)sender {
    self.quantityLabel.text = @"0";
    self.totalLabel.text = @"0";
}
- (IBAction)digitPressed:(UIButton *)sender {
    if([self.quantityLabel.text isEqualToString:@"0"])
        self.quantityLabel.text = sender.currentTitle;
    else
        self.quantityLabel.text= [NSString stringWithFormat:@"%@%@", self.quantityLabel.text, sender.currentTitle];
    [self update];
    
}

-(void)update
{
    ItemModel* i = [self.itemArray objectAt:[self.itemPickerView selectedRowInComponent:0]];
    
    self.totalLabel.text = [NSString stringWithFormat:@"%.2f", [self.quantityLabel.text doubleValue] * [i.price doubleValue] ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buyPressed:(UIButton *)sender
{
    BOOL inStock = [self.itemArray sellItem:[self.itemPickerView selectedRowInComponent:0] withQuantity:[self.quantityLabel.text intValue]];
    
    if(!inStock) // if stock not available
    {
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Transaction has been cancelled."
                                     message:@"Not enough item in stock."
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
    else // available, make history
    {
        ItemModel* itemSelected = [self.itemArray objectAt:[self.itemPickerView selectedRowInComponent:0]];
        HistoryModel* hs = [[HistoryModel alloc] initWithName: [itemSelected name]
                                                 andWithPrice:[itemSelected price] andWithQuantity:[NSNumber numberWithInt:[self.quantityLabel.text intValue]]];
        [self.historyArray addObject:hs];
    }
    self.totalLabel.text = @"0";
    self.quantityLabel.text = @"0";
    [self.itemPickerView reloadAllComponents];
    
    ///// test
    for(int i=0;i<[self.itemArray length];i++)
    {
        NSLog(@"%@", [self.itemArray objectAt:i].name);
    }
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ManagerViewController* mv = (ManagerViewController* )segue.destinationViewController;
    mv.history = self.historyArray;
    mv.itemArray = self.itemArray;
    mv.passDelegate = self;
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.itemArray length];
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%@ %@ price:%.2f",[[self.itemArray objectAt:row] name],
             [[self.itemArray objectAt:row] quantity],
             [[[self.itemArray objectAt:row] price] doubleValue]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.nameLabel.text = [[self.itemArray objectAt:row] name];
    [self update];
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.itemPickerView reloadAllComponents];
}

-(void)addItem:(ItemModel *)i
{
    [self.itemArray pushItem:i];
    [self.itemPickerView reloadAllComponents];
}

@end
