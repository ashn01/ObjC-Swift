//
//  AddItemViewController.m
//  assignment1
//
//  Created by Youngmin-mac on 2018. 3. 9..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UITextField *quantityTextField;

@end

@implementation AddItemViewController
- (IBAction)addPressed:(UIButton *)sender {
    
    if([self.priceTextField.text doubleValue] > 0 && [self.quantityTextField.text intValue] > 0)
    {
        ItemModel* i = [[ItemModel alloc] initwithData:self.nameTextField.text withQuantity:[NSNumber numberWithInt:[self.quantityTextField.text intValue]] withPrice:[NSNumber numberWithDouble:[self.priceTextField.text doubleValue]]];
    
    
        [self messageMakerWithTitle:@"Item has been added" withMessage:[NSString stringWithFormat:@"Item Name : %@\nQuantity : %@\nPrice : %.2lf",self.nameTextField.text, self.quantityTextField.text,[self.priceTextField.text doubleValue]] withActionTitle:@"OK"];
        [self clear];
        [self.addDelegate addItem:i];
    }
    else
        [self messageMakerWithTitle:@"Transaction has been canceled" withMessage:@"Quantity and Price cannot be lower than 0." withActionTitle:@"OK"];
}
-(void)messageMakerWithTitle : (NSString*)title withMessage:(NSString*)msg withActionTitle:(NSString*) actTitle
{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:title
                                 message:msg
                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:actTitle
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   //Handle your yes please button action here
                               }];
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)clear
{
    self.quantityTextField.text=@"";
    self.nameTextField.text=@"";
    self.priceTextField.text=@"";
}
- (IBAction)cancelPressed:(UIButton *)sender {
    [self clear];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
