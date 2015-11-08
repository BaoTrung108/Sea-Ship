//
//  ViewController.m
//  Sea&Ship
//
//  Created by trung bao on 08/11/2015.
//  Copyright © 2015 baotrung. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController
{
    UIImageView *ship,*sea1,*sea2;
    AVAudioPlayer *music;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self drawsea];
    [self drawship];
    [self animationShip];
    [self animationSea];
    [self playmusic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) drawsea {
    sea1= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea2"]];
    sea1.frame=self.view.bounds;
    [self.view addSubview:sea1];
    sea2 =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea1"]];
    sea2.frame=CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:sea2];
}
-(void) drawship {
    ship =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shipchuan"]];
    ship.center = CGPointMake(250,500);
    [self.view addSubview:ship];
}
-(void) animationShip {
    [UIView animateWithDuration:0.2 animations:^{
        ship.transform =CGAffineTransformMakeRotation(-0.04);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            ship.transform=CGAffineTransformMakeRotation(0.04);
        } completion:^(BOOL finished) {
            [self animationShip];
        }];
    }];
}
-(void) animationSea {
    [UIView animateWithDuration:7 animations:^{
        sea1.frame= CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        sea2.frame=self.view.bounds;
    } completion:^(BOOL finished) {
        sea1.frame=CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        [UIView animateWithDuration:7 animations:^{
            sea1.frame=self.view.bounds;
            sea2.frame=CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        } completion:^(BOOL finished) {
            sea2.frame=CGRectMake(-self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
            [self animationSea];
        }];
    }];
}
-(void) playmusic {
    NSString *filepath =[[NSBundle mainBundle] pathForResource:@"tuyhongnhan" ofType:@"mp3"];
    NSURL *url =[NSURL fileURLWithPath:filepath];
    NSError *loi;
    music =[[AVAudioPlayer alloc] initWithContentsOfURL:url error:&loi];
    [music prepareToPlay];
    [music play];
}
@end

