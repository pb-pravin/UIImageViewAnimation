//
//  ViewController.m
//  ImageViewAnimation
//
//  Created by Romy Ilano on 1/21/13.
//  Copyright (c) 2013 Snowyla. All rights reserved.
//

#import "ViewController.h"
#import "UIView-SubviewGeometry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Animation
-(void)updateButterfly:(NSTimer *)timer
{
    // this makes the butterfly dart around randomly
    [UIView animateWithDuration:0.6f animations:^{
        self.butterflyView.center = [self.butterflyView randomCenterInView:self.view withInset:10.0f];
        
    }];
}

-(void)loadView
{
    [super loadView];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    // load the butterfly images
    NSMutableArray *butterflies = [NSMutableArray array];
    for (int i=1; i <= 17; i++)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"bf_%d", i] ofType:@"png"];
        
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        if (image) [butterflies addObject:image];
        
    }
    
    self.butterflyView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 60.0f, 60.0f)];
    self.butterflyView.animationImages = butterflies;
    self.butterflyView.animationDuration=0.75f;
    [self.view addSubview:self.butterflyView];
    [self.butterflyView startAnimating];

    // this makes the entire butterfly do all sorts of fun things
    // leans on Erica Sadun's Category extension UIView-SubviewGeometry
    [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(updateButterfly:) userInfo:nil repeats:YES];


    // second butterfly view
    UIImageView *butterflyView2 = [[UIImageView alloc] initWithFrame:CGRectMake(50.0f, 300.0f, 60.0f, 60.0f)];
    butterflyView2.animationImages = butterflies;
    butterflyView2.animationDuration = 0.25f;
    [self.view addSubview:butterflyView2];
    [butterflyView2 startAnimating];

}

@end
