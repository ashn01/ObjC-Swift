//
//  ViewController.m
//  lab07
//
//  Created by Youngmin-mac on 2018. 3. 13..
//  Copyright © 2018년 seneca college. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSString* url;
@property (strong, nonatomic) NSArray* array;
@property (strong, nonatomic) dispatch_queue_t myQ;
@property (strong,nonatomic)NSData* data;

@property int idx;
@end

@implementation ViewController
@synthesize url = _url;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myQ = dispatch_queue_create("imageLoad", NULL);
    self.idx = 0;
    self.array = [[NSArray alloc] initWithObjects:@"lobster.png",@"pasta.png",@"pizza.png",@"steak.png", nil];
    dispatch_async(self.myQ, ^(void){[self loadImage];});
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(UIButton *)sender
{
    self.idx = ([[sender currentTitle] isEqualToString:@"Next"] ? self.idx+1 : self.idx == 0 ? 3 : self.idx -1);
    self.idx = self.idx % [self.array count] ;
    dispatch_async(self.myQ, ^(void){[self loadImage];});
    NSLog(@"%d",self.idx);
}

-(void) loadImage
{
    self.url = [NSString stringWithFormat:@"http://warp.senecac.on.ca/satiar.rad/photos/%@",[self.array objectAtIndex:self.idx]];
    NSURL* url =[NSURL URLWithString:self.url];
    self.data= [[NSData alloc] initWithContentsOfURL:url];
    
    dispatch_async(dispatch_get_main_queue(), ^(){
        self.imageView.image = [UIImage imageWithData:self.data];
    });
}

@end
