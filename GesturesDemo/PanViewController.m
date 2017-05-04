//
//  PanViewController.m
//  GesturesDemo
//
//  Created by Gabriel Theodoropoulos on 8/22/14.
//  Copyright (c) 2014 Appcoda. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

-(void)moveViewWithGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer;
@property(nonatomic, assign) CGPoint startCurrentPositionCube;

@end

@implementation PanViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveViewWithGestureRecognizer:)];
    [self.testView addGestureRecognizer:panGestureRecognizer];
    self.startCurrentPositionCube = self.testView.frame.origin;
    NSLog(@"!!!!!!!!!!!!!!!position %.2f", self.startCurrentPositionCube);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)moveViewWithGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer{
    CGPoint touchLocation = [panGestureRecognizer locationInView:self.view];
    
    self.testView.center = touchLocation;
    
    
    CGPoint velocity = [panGestureRecognizer velocityInView:self.view];
    
    self.horizontalVelocityLabel.text = [NSString stringWithFormat:@"Horizontal Velocity: %.2f points/sec", velocity.x];
    self.verticalVelocityLabel.text = [NSString stringWithFormat:@"Vertical Velocity: %.2f points/sec", velocity.y];
    //NSLog(@"Horizontal Velocity: %.2f points/sec", velocity.x);
    //NSLog(@"Vertical Velocity: %.2f points/sec", velocity.y);
    
    CGPoint currentPositionCube = self.testView.frame.origin;
    
    if (fabs(currentPositionCube.y -  self.startCurrentPositionCube.y) > 20) {
        NSLog(@"ДВИГАЕМ");
    }
    NSLog(@"position %.2f", currentPositionCube.y);
    NSLog(@"!!!!!!!!!!!!!!!position %.2f", self.startCurrentPositionCube.y);

}

@end
