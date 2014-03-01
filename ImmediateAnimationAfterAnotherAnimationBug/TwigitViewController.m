//
//  TwigitViewController.m
//  ImmediateAnimationAfterAnotherAnimationBug
//
//  Created by Paweł Brewczyński on 3/1/14.
//  Copyright (c) 2014 Paweł Brewczyński. All rights reserved.
//

#import "TwigitViewController.h"

@interface TwigitViewController ()

@property (strong, nonatomic) UIView *container;
@property (strong, nonatomic) UIView *v1;
@property (nonatomic)         NSInteger y;

@end

@implementation TwigitViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.y = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createV1View {
    
    self.container = [[UIView alloc] initWithFrame:CGRectMake(20, self.y, 80, 80)];
    self.y += 85;  // Just so, next view will be underneath previous one
    self.container.backgroundColor = [UIColor redColor];  // Background of container is RED.
    
    [self.view addSubview:self.container];
}

- (IBAction) performTransition {
    
    
    self.v1  = [[UIView alloc] initWithFrame:self.container.bounds];
    self.v1.backgroundColor = [UIColor greenColor];
    
    
    [UIView transitionWithView:self.container duration:0.5 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{[self.container addSubview:self.v1];} completion:^(BOOL finished) {NSLog(@"I finished second animation");}];
    
}

- (IBAction) createV1ViewANDperformTransition {
    [self createV1View];
    [self performTransition];
}

@end
