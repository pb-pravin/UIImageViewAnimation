//
//  ViewController.m
//  ImageViewAnimation
//
//  Created by Romy Ilano on 1/21/13.
//  Copyright (c) 2013 Snowyla. All rights reserved.
//

#import "ViewController.h"

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
    [UIView animateWithDuration:0.6f animations:^{
        // self.butterflyView.center = [self.butterflyView randomCenterInView:self.view withInset:10.0f];
        
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

}

@end
