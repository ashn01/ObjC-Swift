//
//  ViewController.m
//  Calculator
//
//  Created by Youngmin-mac on 2018. 2. 8..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import "ViewController.h"
#import "Calculator_Brain.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Display;
@property (strong, nonatomic) Calculator_Brain* calculator;
@end

@implementation ViewController
-(Calculator_Brain*)calculator
{
    if(_calculator == nil)
       _calculator = [[Calculator_Brain alloc] init];
    return _calculator;
}
- (IBAction)Clear:(id)sender {
    self.Display.text = @"";
}
- (IBAction)DigitPressed:(id)sender {
    self.Display.text = [self.Display.text stringByAppendingString:[sender currentTitle]];
}
- (IBAction)EnterPressed:(id)sender {
    NSNumberFormatter* f = [[NSNumberFormatter alloc]init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    
    [self.calculator pushItem:[[f numberFromString: self.Display.text] doubleValue]];
    self.Display.text = @"";
}
- (IBAction)OperatorPressed:(id)sender {
    double ret=0;
    if([[sender currentTitle] isEqualToString:@"+"])
    {
        ret = [self.calculator calculate:@"+"];
    }else if([[sender currentTitle] isEqualToString:@"-"])
    {
        ret = [self.calculator calculate:@"-"];
    }else if([[sender currentTitle] isEqualToString:@"*"])
    {
        ret = [self.calculator calculate:@"*"];
    }else if([[sender currentTitle] isEqualToString:@"/"])
    {
        ret = [self.calculator calculate:@"/"];
    }
    
    self.Display.text = [NSString stringWithFormat:@"%.2f",ret];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
